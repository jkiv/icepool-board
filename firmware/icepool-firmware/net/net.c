#include "net.h"

// Validates frame header data
static uint8_t _net_validate_header(FrameHeader* header);

// Validates body data. Body length and sum are provided via `header`.
static uint8_t _net_validate_body(FrameHeader* header, uint8_t* body);

// Sends the provided frame `header` and `body`.
// Calculates and populates header and body checksums in `header`.
static void _net_send_raw_frame(NetContext* context, FrameHeader* header, uint8_t* body);

// Returns a random value for initializing frame ID
static uint8_t _net_random_id();

// Given an ACK header, clear relevant frames out of the ACK buffer for a given endpoint
static void _net_remove_ack(NetContext* context, uint8_t address, uint8_t ack_id);

// Resend all un-ACK'd frames for a given endpoint
static void _net_resend_unacked(NetContext* context, uint8_t address);

void net_init(NetContext* context, NetInterface* interface, uint8_t address)
{
    // Initialize context struct
    // FUTURE use automatic addressing
    context->address = address;
    context->state = STATE_START;
    context->interface = interface;
    context->next_id = _net_random_id();
    
    // Note: RingBuffer initialization is currently done separately.
}

uint8_t net_available(NetContext* context)
{
    return !ringbuffer_is_empty(&context->recv_buffer);
}

void net_recv(NetContext* context, FrameHeader* header, uint8_t* body)
{
    if (net_available(context))
    {
        // Populate header
        ringbuffer_remove_n(&context->recv_buffer, (uint8_t*) header, NET_FRAME_HEADER_SIZE);
        
        if (body != NULL && header->body_length > 0)
        {
            // Copy body data to return
            ringbuffer_remove_n(&context->recv_buffer, body, header->body_length);
        }
        else
        {
            // Pop the data into the void
            ringbuffer_remove_n(&context->recv_buffer, NULL, header->body_length);
        }
    }
}

// Constructs a frame from the provided data and queues it in the net subsystem.
void net_send(NetContext* context, uint8_t address, uint8_t* body, size_t body_length)
{
    FrameHeader header;
    
    // Build the header
    header.source      = context->address;
    header.destination = address;
    header.id          = context->next_id++;
    header.body_length = body_length;
    header.body_sum    = net_sum(body, body_length);
    header.header_sum  = net_sum((uint8_t*) &header, NET_FRAME_HEADER_SIZE-1);
    
    _net_send_raw_frame(context, &header, body);
    
    // Append header to the ack list
    ringbuffer_add_n(&context->ack_buffer, (uint8_t*) &header, NET_FRAME_HEADER_SIZE);
        
    // Append body to the ack list
    if (body != NULL && header.body_length > 0)
    {
        ringbuffer_add_n(&context->ack_buffer, body, header.body_length);
    }
}

void net_tick(NetContext* context)
{
    NetInterface* iface = context->interface;
    
    FrameBuffer* frame_buffer = &context->frame_buffer;
    RingBuffer* rx_buffer = &iface->rx_buffer;
    
    switch(context->state)
    {
        case STATE_START:
        
            // Go to STATE_WAIT immediately
            context->state = STATE_WAIT;
            
            break;
            
        case STATE_WAIT:
        
            iface->rx_disable(iface);
            
            if (!ringbuffer_is_empty(rx_buffer))
            {
                // Go to STATE_RECV_HEADER if data available
                context->state = STATE_RECV_HEADER;
            }
            
            iface->rx_enable(iface);
            
            break;
            
        case STATE_RECV_HEADER:
            
            iface->rx_disable(iface);
            
            if (ringbuffer_has_occupancy(rx_buffer, NET_FRAME_HEADER_SIZE))
            {
                // Pull bytes from the receive buffer into raw frame header memory
                ringbuffer_remove_n(rx_buffer, (uint8_t*) &frame_buffer->header, NET_FRAME_HEADER_SIZE);
                
                if (!_net_validate_header(&frame_buffer->header))
                {
                    // Error with header data... go into recovery mode.
                    context->state = STATE_ERROR;
                }
                else if (frame_buffer->header.body_length == 0)
                {
                    // No body
                    context->state = STATE_HANDLE_FRAME;
                }
                else
                {
                    // Handle the body
                    context->state = STATE_RECV_BODY;
                }
            }                  
            
            iface->rx_enable(iface);     
            
            break;
            
        case STATE_RECV_BODY:
            
            iface->rx_disable(iface);
            
            if (ringbuffer_has_occupancy(rx_buffer, frame_buffer->header.body_length))
            {
                ringbuffer_remove_n(rx_buffer, frame_buffer->body, frame_buffer->header.body_length);
                
                context->state = STATE_HANDLE_FRAME;                
            }
            
            iface->rx_enable(iface);
            
            break;
            
        case STATE_HANDLE_FRAME:
            
            if (context->address != frame_buffer->header.destination &&
                context->address != NET_FRAME_ADDR_BROADCAST)
            {
                // Frame is addressed to someone else... ignore.
                context->state = STATE_WAIT;
                break;
            }
            else if (frame_buffer->header.flags & NET_FRAME_HEADER_FLAGS_ERR)
            {
                // A recoverable error occurred.
                
                // Resend all unacked frames...
                _net_resend_unacked(context, frame_buffer->header.source);
                
                context->state = STATE_WAIT;
            }
            else if (frame_buffer->header.flags & NET_FRAME_HEADER_FLAGS_ACK)
            {
                // Handle ACK
                _net_remove_ack(context, frame_buffer->header.source, frame_buffer->header.id);
                
                context->state = STATE_WAIT;
            }
            else if (frame_buffer->header.body_length > 0 &&
                     !_net_validate_body(&frame_buffer->header, frame_buffer->body))
            {
                // Header OK, Body BAD
                // ... respond with an ERR packet to source
                
                frame_buffer->header.destination  = frame_buffer->header.source;
                frame_buffer->header.source       = context->address;
                frame_buffer->header.flags       |= NET_FRAME_HEADER_FLAGS_ERR;
                frame_buffer->header.body_length  = 0;
                
                _net_send_raw_frame(context, &frame_buffer->header, NULL);
                
                context->state = STATE_WAIT;
            }
            else
            {
                // Header OK, Body OK
                
                // TODO handle HELLO sequence
                
                // Add frame data to user-facing buffer
                
                ringbuffer_add_n(&context->recv_buffer, (uint8_t*) &frame_buffer->header, NET_FRAME_HEADER_SIZE);
                
                if (frame_buffer->header.body_length > 0) {
                    ringbuffer_add_n(&context->recv_buffer, frame_buffer->body, frame_buffer->header.body_length);
                }
                
                // Queue an ACK for this frame
                
                frame_buffer->header.destination = frame_buffer->header.source;
                frame_buffer->header.source      = context->address;
                frame_buffer->header.flags       = NET_FRAME_HEADER_FLAGS_ACK;
                frame_buffer->header.body_length = 0;
                
                _net_send_raw_frame(context, &frame_buffer->header, NULL);
                
                // Onto the next one...
                context->state = STATE_WAIT;
            }
            
            break;
        case STATE_ERROR:
        
            // We had a transmission error that didn't involve the header data...
            
            // TODO error recovery sequence
            
            iface->rx_disable(iface);
            ringbuffer_clear(rx_buffer, 0);
            iface->rx_enable(iface);
            
            context->state = STATE_WAIT;
            
            break;
        default:
            ;
    }
}

uint8_t net_sum(uint8_t* buffer, size_t length)
{
    if (buffer == NULL || length == 0)
        return 0xFF;
    
    // 8-bit one's complement sum:
    //
    //   - Accumulate each byte into 16-bit sum.
    //   - Upper 8-bits represent the carries.
    //   - Add the upper 8-bits to the lower and
    //     return the inverted lower 8-bits.
    //
    // Note: method will only work if `length` < 2^8.
    
    uint16_t sum = 0;
    
    for(size_t i = 0; i < length; i++)
    {
        sum += buffer[i];
    }
    
    sum = ~(((sum << 8) >> 8) + (sum >> 8));
    
    return (uint8_t) (sum & 0xFF);
}

uint8_t _net_validate_header(FrameHeader* header)
{   
    // Checksum valid?
    if (net_sum((uint8_t*) header, NET_FRAME_HEADER_SIZE-1) != header->header_sum)
    {
        return 0;
    }
        
    return 1;
}

uint8_t _net_validate_body(FrameHeader* header, uint8_t* body)
{
    // Checksum valid?
    if (net_sum(body, header->body_length) != header->body_sum)
    {
        return 0;
    }
    
    // Compute sum over header
    return 1;
}

void _net_send_raw_frame(NetContext* context, FrameHeader* header, uint8_t* body)
{
    NetInterface* iface = context->interface;
    FrameBuffer* frame_buffer = &context->frame_buffer;
    
    // Populate the header checksum
    header->header_sum = net_sum((uint8_t*) header, NET_FRAME_HEADER_SIZE-1);
    
    // Populate the body checksum
    header->body_sum = net_sum(body, header->body_length);
    
    iface->tx_disable(iface);
    
    // Append header to the send queue  
    ringbuffer_add_n(&iface->tx_buffer, (uint8_t*) header, NET_FRAME_HEADER_SIZE);
    
    // Append body to the send queue
    if (body != NULL && header->body_length > 0)
    {
        ringbuffer_add_n(&iface->tx_buffer, frame_buffer->body, header->body_length);
    }
    
    iface->tx_enable(iface);
    
    // Force a write to the interface
    // TODO flush?
    if (!ringbuffer_is_empty(&iface->tx_buffer)) {
        iface->write(iface, ringbuffer_remove(&iface->tx_buffer));
    }
}

uint8_t _net_random_id()
{
    return 1; // TODO
}

void _net_resend_unacked(NetContext* context, uint8_t address)
{
    NetInterface* iface = context->interface;
    
    RingBuffer* ack_buffer = &context->ack_buffer;
    
    size_t occupancy = ringbuffer_occupancy(ack_buffer);
    
    uint8_t frame_address;
    uint8_t frame_body_length;
    
    // Buffer is empty, nothing to possibly re-send
    if (ringbuffer_is_empty(ack_buffer)) {
        return;
    }
    
    // Go through the _entire_ ACK buffer to preserve
    // temporal ordering.
    for(size_t j = 0; j < occupancy; )
    {
        // Peak at header data in buffer
        frame_address     = ringbuffer_at(ack_buffer, 1);
        frame_body_length = ringbuffer_at(ack_buffer, 4);
        
        for(size_t i = 0; i < NET_FRAME_HEADER_SIZE + frame_body_length; i++)
        {
            uint8_t d = ringbuffer_remove(ack_buffer);
            
            // Re-send frame data if it matches the given `address`
            if (frame_address == address)
            {
                // Re-send frame data
                iface->tx_disable(iface);
                ringbuffer_add(&iface->tx_buffer, d);
                iface->tx_enable(iface);
            }
            
            // Add the frame data back to the ACK buffer
            // to preserve temporal ordering.
            ringbuffer_add(ack_buffer, d);
        }
        
        // Advance by as many bytes as we affected
        j += NET_FRAME_HEADER_SIZE + frame_body_length;
    }
        
    // Force a write to the interface
    // TODO flush?
    if (!ringbuffer_is_empty(&iface->tx_buffer)) {
        iface->write(iface, ringbuffer_remove(&iface->tx_buffer));
    }
}

void _net_remove_ack(NetContext* context, uint8_t address, uint8_t ack_id)
{
    uint8_t frame_address;
    uint8_t frame_id;
    uint8_t frame_body_length;
    
    RingBuffer* ack = &context->ack_buffer;
    size_t occupancy = ringbuffer_occupancy(ack);
    
    // Buffer is empty, nothing to possibly ACK
    if (ringbuffer_is_empty(ack)) {
        return;
    }        
    
    // Go through the _entire_ ACK buffer to keep frames in
    // temporal order.
    // FUTURE possibly use a linked list?
    for(size_t j = 0; j < occupancy; )
    {
        // Peak at header data in buffer -- the oldest item
        frame_address     = ringbuffer_at(ack, 1);
        frame_id          = ringbuffer_at(ack, 3);
        frame_body_length = ringbuffer_at(ack, 4);
        
        // Go through the whole buffer, drop frames that are ack'd by `address` and `ack_id`
        
        // Handle removing/dropping single frame
        for(size_t i = 0; i < NET_FRAME_HEADER_SIZE + frame_body_length; i++)
        {
            uint8_t d = ringbuffer_remove(ack);
            
            if (!(frame_address == address && (ack_id - frame_id) < NET_MAX_ACK_DISTANCE))
            {
                // Don't drop this data
                ringbuffer_add(ack, d);
            }
        }
     
        // Advance by as many bytes as we affected   
        j += NET_FRAME_HEADER_SIZE + frame_body_length;
    }
}