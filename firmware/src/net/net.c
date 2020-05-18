#include "net.h"
#include "interface.h"
#include "../data/ringbuffer.h"

// TODO include project root in include path for all submodules [?]
// TODO byte ordering (e.g. (uint8_t*) header_ptr)

// TODO initialize endpoint
// TODO per-interface header, body buffers

// FUTURE reference buffers by NetContext

// Buffers for Interface
// TODO move to interface
// TODO initialize for interface
static RingBuffer _rx_buffer;
static uint8_t _rx_raw_buffer[NET_RX_BUFFER_LEN];

static RingBuffer _tx_buffer;
static uint8_t _tx_raw_buffer[NET_TX_BUFFER_LEN];

// Temporary Frame for Interface
// TODO move to interface
// TODO initialize for interface
static FrameHeader _frame_header;
static uint8_t* _frame_header_raw = (uint8_t*) &_frame_header;
static uint8_t _body_buffer[NET_FRAME_BODY_MAX_SIZE];

// Buffers for context
// TODO initialize for each context
static uint8_t _rx_user_raw_buffer[NET_RX_USER_BUFFER_LEN];
static uint8_t _tx_ack_raw_buffer[NET_TX_ACK_BUFFER_LEN];

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
static void _net_remove_ack_waiting(NetContext* context, uint8_t address, uint8_t ack_id);

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
    
    // Initialize buffers
    // TODO move to Interface init -- initialize with malloc? provided by user?
    ringbuffer_init(&_rx_buffer, _rx_raw_buffer, NET_RX_BUFFER_LEN);
    ringbuffer_init(&_tx_buffer, _tx_raw_buffer, NET_TX_BUFFER_LEN);
    
    // Initialize context buffers
    // TODO underlying buffer -- initialize with malloc? provided by user?
    ringbuffer_init(&context->recv, _rx_user_raw_buffer, NET_RX_USER_BUFFER_LEN);
    ringbuffer_init(&context->ack_waiting, _tx_ack_raw_buffer, NET_TX_ACK_BUFFER_LEN);
}

uint8_t net_available(NetContext* context)
{
    return !ringbuffer_is_empty(&context->recv);
}

void net_recv(NetContext* context, FrameHeader* header, uint8_t* body)
{
    FrameHeader header_tmp;
    uint8_t* header_raw = (uint8_t*) &header_tmp;

    if (net_available(context))
    {
        // Populate header
        ringbuffer_remove_n(&context->recv, header_raw, NET_FRAME_HEADER_SIZE);
        
        if (body != NULL && header_tmp.body_length > 0)
        {
            // Copy body data to return
            ringbuffer_remove_n(&context->recv, body, header_tmp.body_length);
        }
        else
        {
            // Pop the data into the void
            ringbuffer_remove_n(&context->recv, NULL, header_tmp.body_length);
            
            //for (size_t i = 0; i < header_tmp.body_length; i++)
            //    ringbuffer_remove(&context->recv);
        }
        
        // Copy the header data to return
        *header = header_tmp;
    }
}

// Constructs a frame from the provided data and queues it in the net subsystem.
void net_send(NetContext* context, uint8_t address, uint8_t* body, size_t body_length)
{
    FrameHeader header;
    
    // Build the header
    header.source = context->address;
    header.destination = address;
    header.id = context->next_id++;
    header.body_length = body_length;
    header.body_sum = net_sum(body, body_length);
    header.header_sum = net_sum((uint8_t*) &header, NET_FRAME_HEADER_SIZE-1);
    
    _net_send_raw_frame(context, &header, body);
    
    // Append header to the ack list
    ringbuffer_add_n(&context->ack_waiting, (uint8_t*) &header, NET_FRAME_HEADER_SIZE);
        
    // Append body to the ack list
    if (body != NULL && header.body_length > 0)
    {
        ringbuffer_add_n(&context->ack_waiting, body, header.body_length);
    }
}

void net_tick(NetContext* context)
{
    NetInterface* iface = context->interface;
    
    switch(context->state)
    {
        case STATE_START:
        
            // Go to STATE_WAIT immediately
            context->state = STATE_WAIT;
            
            break;
            
        case STATE_WAIT:
        
            iface->rx_disable(iface->params);
            
            if (!ringbuffer_is_empty(&_rx_buffer))
            {
                // Go to STATE_RECV_HEADER if data available
                context->state = STATE_RECV_HEADER;
            }
            
            iface->rx_enable(iface->params);
            
            break;
            
        case STATE_RECV_HEADER:
            
            iface->rx_disable(iface->params);
            
            if (ringbuffer_has_occupancy(&_rx_buffer, NET_FRAME_HEADER_SIZE))
            {
                // Pull bytes from the receive buffer into raw frame header memory
                ringbuffer_remove_n(&_rx_buffer, _frame_header_raw, NET_FRAME_HEADER_SIZE);
                
                if (!_net_validate_header(&_frame_header))
                {
                    // Error with header data... go into recovery mode.
                    context->state = STATE_ERROR;
                }
                else if (_frame_header.body_length == 0)
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
            
            iface->rx_enable(iface->params);     
            
            break;
            
        case STATE_RECV_BODY:
            
            iface->rx_disable(iface->params);
            
            if (ringbuffer_has_occupancy(&_rx_buffer, _frame_header.body_length))
            {
                ringbuffer_remove_n(&_rx_buffer, _body_buffer, _frame_header.body_length);
                
                context->state = STATE_HANDLE_FRAME;                
            }
            
            iface->rx_enable(iface->params);
            
            break;
            
        case STATE_HANDLE_FRAME:
            
            if (context->address != _frame_header.destination &&
                context->address != NET_FRAME_ADDR_BROADCAST)
            {
                // Frame is addressed to someone else... ignore.
                context->state = STATE_WAIT;
                break;
            }
            else if (_frame_header.flags & NET_FRAME_HEADER_FLAGS_ERR)
            {
                // A recoverable error occurred.
                
                // Resend all unacked frames...
                _net_resend_unacked(context, _frame_header.source);
                
                context->state = STATE_WAIT;
            }
            else if (_frame_header.flags & NET_FRAME_HEADER_FLAGS_ACK)
            {
                // Handle ACK
                _net_remove_ack_waiting(context, _frame_header.source, _frame_header.id);
                
                context->state = STATE_WAIT;
            }
            else if (_frame_header.body_length > 0 &&
                     !_net_validate_body(&_frame_header, _body_buffer))
            {
                // Header OK, Body BAD
                // ... respond with an ERR packet to source
                
                _frame_header.destination = _frame_header.source;
                _frame_header.source = context->address;
                _frame_header.flags |= NET_FRAME_HEADER_FLAGS_ERR;
                _frame_header.body_length = 0;
                
                _net_send_raw_frame(context, &_frame_header, NULL);
                
                context->state = STATE_WAIT;
            }
            else
            {
                // Header OK, Body OK
                
                // TODO handle HELLO sequence
                
                // Add frame data to user-facing buffer
                
                ringbuffer_add_n(&context->recv, _frame_header_raw, NET_FRAME_HEADER_SIZE);
                
                if (_frame_header.body_length > 0) {
                    ringbuffer_add_n(&context->recv, _body_buffer, _frame_header.body_length);
                }
                
                // Queue an ACK for this frame
                
                _frame_header.destination = _frame_header.source;
                _frame_header.source = context->address;
                _frame_header.flags = NET_FRAME_HEADER_FLAGS_ACK;
                _frame_header.body_length = 0;
                
                _net_send_raw_frame(context, &_frame_header, NULL);
                
                // Onto the next one...
                context->state = STATE_WAIT;
            }
            
            break;
        case STATE_ERROR:
        
            // We had a transmission error that didn't involve the header data...
            
            // TODO error recovery sequence
            
            iface->rx_disable(iface->params);
            ringbuffer_clear(&_rx_buffer, 0);
            iface->rx_enable(iface->params);
            
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

void net_on_interface_read(uint8_t d, void* param)
{
    // Param = context, which provides interface
    // TODO interface buffer
    ringbuffer_add(&_rx_buffer, d);
}

void net_on_interface_write(void* param)
{
    NetContext* context = (NetContext*) param;
    
    if (context == NULL)
        return;
    
    NetInterface* interface = context->interface;
    
    if (interface == NULL)
        return;
 
    // This function should either be called from an interrupt
    // or have interrupts for tx disabled prior to calling.
    // In other words, interrupts are not disabled/enabled here.
     
    // Send data
    // TODO interface buffer
    // TODO remove recursion
    // TODO make net_force_write()?
    if (!ringbuffer_is_empty(&_tx_buffer)) {
        interface->write(ringbuffer_remove(&_tx_buffer), interface->params);
    }
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
    
    // Populate the header checksum
    header->header_sum = net_sum((uint8_t*) header, NET_FRAME_HEADER_SIZE-1);
    
    // Populate the body checksum
    header->body_sum = net_sum(body, header->body_length);
    
    iface->tx_disable(iface->params);
    
    // Append header to the send queue  
    ringbuffer_add_n(&_tx_buffer, (uint8_t*) header, NET_FRAME_HEADER_SIZE);
    
    // Append body to the send queue
    if (body != NULL && header->body_length > 0)
    {
        ringbuffer_add_n(&_tx_buffer, body, header->body_length);
    }
    
    iface->tx_enable(iface->params);
    
    // Force a write to the interface
    // TODO some other method?
    net_on_interface_write((void*)context);
}

uint8_t _net_random_id()
{
    // TODO
    return 1;
}

void _net_resend_unacked(NetContext* context, uint8_t address)
{
    NetInterface* iface = context->interface;
    
    uint8_t frame_address;
    uint8_t frame_body_length;
    
    RingBuffer* ack_waiting = &context->ack_waiting;
    size_t occupancy = ringbuffer_occupancy(ack_waiting);
    
    // Buffer is empty, nothing to possibly re-send
    if (ringbuffer_is_empty(ack_waiting)) {
        return;
    }
    
    // Go through the _entire_ ACK buffer to preserve
    // temporal ordering.
    for(size_t j = 0; j < occupancy; )
    {
        // Peak at header data in buffer
        frame_address     = ringbuffer_at(ack_waiting, 1);
        frame_body_length = ringbuffer_at(ack_waiting, 4);
        
        for(size_t i = 0; i < NET_FRAME_HEADER_SIZE + frame_body_length; i++)
        {
            uint8_t d = ringbuffer_remove(ack_waiting);
            
            // Re-send frame data if it matches the given `address`
            if (frame_address == address)
            {
                // Re-send frame data
                iface->tx_disable(iface->params);
                ringbuffer_add(&_tx_buffer, d);
                iface->tx_enable(iface->params);
            }
            
            // Add the frame data back to the ACK buffer
            // to preserve temporal ordering.
            ringbuffer_add(ack_waiting, d);
        }
        
        // Advance by as many bytes as we affected
        j += NET_FRAME_HEADER_SIZE + frame_body_length;
    }
        
    // Force a write to the interface
    // TODO some other method?
    net_on_interface_write((void*)context);
}

void _net_remove_ack_waiting(NetContext* context, uint8_t address, uint8_t ack_id)
{
    uint8_t frame_address;
    uint8_t frame_id;
    uint8_t frame_body_length;
    
    RingBuffer* ack_waiting = &context->ack_waiting;
    size_t occupancy = ringbuffer_occupancy(ack_waiting);
    
    // Buffer is empty, nothing to possibly ACK
    if (ringbuffer_is_empty(ack_waiting)) {
        return;
    }        
    
    // Go through the _entire_ ACK buffer to keep frames in
    // temporal order.
    // FUTURE possibly use a linked list?
    for(size_t j = 0; j < occupancy; )
    {
        // Peak at header data in buffer -- the oldest item
        frame_address     = ringbuffer_at(ack_waiting, 1);
        frame_id          = ringbuffer_at(ack_waiting, 3);
        frame_body_length = ringbuffer_at(ack_waiting, 4);
        
        // Go through the whole buffer, drop frames that are ack'd by `address` and `ack_id`
        
        // Handle removing/dropping single frame
        for(size_t i = 0; i < NET_FRAME_HEADER_SIZE + frame_body_length; i++)
        {
            uint8_t d = ringbuffer_remove(ack_waiting);
            
            if (!(frame_address == address && (ack_id - frame_id) < NET_MAX_ACK_DISTANCE))
            {
                // Don't drop this data
                ringbuffer_add(ack_waiting, d);
            }
        }
     
        // Advance by as many bytes as we affected   
        j += NET_FRAME_HEADER_SIZE + frame_body_length;
    }
}
