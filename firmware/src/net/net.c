#include "net.h"
#include "interface.h"
#include "../data/ringbuffer.h"

// TODO enable/disable rx and tx when interacting with buffer
// TODO include project root in include path for all submodules [?]

// FUTURE reference buffers by NetContext

// Buffers
static RingBuffer _rx_buffer;
static uint8_t _rx_raw_buffer[NET_RX_BUFFER_LEN];

static RingBuffer _tx_buffer;
static uint8_t _tx_raw_buffer[NET_TX_BUFFER_LEN];

static RingBuffer _rx_user_buffer;
static uint8_t _rx_user_raw_buffer[NET_RX_USER_BUFFER_LEN];

static RingBuffer _tx_ack_buffer;
static uint8_t _tx_ack_raw_buffer[NET_TX_ACK_BUFFER_LEN];

// Temporary Frame
static FrameHeader _frame_header;
static uint8_t* _frame_header_raw = (uint8_t*) &_frame_header;
// WARNING Aliasing FrameHeader* with uint8_t* for copies
static uint8_t _body_buffer[NET_FRAME_BODY_MAX_SIZE];

// Validates frame header data
static uint8_t _net_validate_header(FrameHeader* header);

// Validates body data. Body length and sum are provided via `header`.
static uint8_t _net_validate_body(FrameHeader* header, uint8_t* body);

// Sends the provided frame `header` and `body`.
// Calculates and populates header and body checksums in `header`.
static void _net_send_raw_frame(NetContext* context, FrameHeader* header, uint8_t* body);

// Returns a random value for use as a frame ID
static uint8_t _net_random_id();

// Given an ACK header, clear relevant frames out of the ACK buffer
static void _net_handle_ack(NetContext* context, FrameHeader* ack);

// Resend all un-ACK'd frames
static void _net_resend_unacked(NetContext* context);

void net_init(NetContext* context, NetInterface* interface, uint8_t address)
{
    // Initialize context struct
    // FUTURE use automatic addressing
    context->address = address;
    context->state = STATE_START;
    context->interface = interface;
    context->next_id = _net_random_id();
    
    // Initialize buffers
    ringbuffer_init(&_rx_buffer, _rx_raw_buffer, NET_RX_BUFFER_LEN);
    ringbuffer_init(&_tx_buffer, _tx_raw_buffer, NET_TX_BUFFER_LEN);
    ringbuffer_init(&_rx_user_buffer, _rx_user_raw_buffer, NET_RX_USER_BUFFER_LEN);
    ringbuffer_init(&_tx_ack_buffer, _tx_ack_raw_buffer, NET_TX_ACK_BUFFER_LEN);
}

uint8_t net_available()
{
    // FIXME assuming any data == all data is ready
    return !ringbuffer_is_empty(&_rx_user_buffer);
}

void net_recv(NetContext* context, FrameHeader* header, uint8_t* body)
{
    FrameHeader header_tmp;
    uint8_t* header_raw = (uint8_t*) &header_tmp;

    if (net_available())
    {
        // Populate header
        ringbuffer_remove_n(&_rx_user_buffer, header_raw, NET_FRAME_HEADER_SIZE);
        
        if (body != NULL && header_tmp.body_length > 0)
        {
            // Copy body data to return
            ringbuffer_remove_n(&_rx_user_buffer, body, header_tmp.body_length);
        }
        else
        {
            // Pop the data into the void
            // TODO use ringbuffer_remove_n(buffer, NULL, n)
            for (size_t i = 0; i < header_tmp.body_length; i++)
                ringbuffer_remove(&_rx_user_buffer);
        }
        
        // Copy the header data to return
        *header = header_tmp;
    }
}

// Constructs a frame from the provided data and queues it in the net subsystem.
void net_send(NetContext* context, uint8_t dest_addr, uint8_t* body, size_t body_length)
{
    FrameHeader header;
    
    // Build the header
    header.source = context->address;
    header.destination = dest_addr;
    header.id = context->next_id++;
    header.body_length = body_length;
    header.body_sum = net_sum(body, body_length);
    header.header_sum = net_sum((uint8_t*) &header, NET_FRAME_HEADER_SIZE-1);
    
    _net_send_raw_frame(context, &header, body);
}

void net_tick(NetContext* context)
{
    switch(context->state)
    {
        case STATE_START:
        
            // Go to STATE_WAIT immediately
            context->state = STATE_WAIT;
            
            break;
            
        case STATE_WAIT:
        
            if (!ringbuffer_is_empty(&_rx_buffer))
            {
                // Go to STATE_RECV_HEADER if data available
                context->state = STATE_RECV_HEADER;
            }
            
            break;
            
        case STATE_RECV_HEADER:
            
            context->interface->rx_disable();
            
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
            
            context->interface->rx_enable();     
            
            break;
            
        case STATE_RECV_BODY:
            
            context->interface->rx_disable();
            
            if (ringbuffer_has_occupancy(&_rx_buffer, _frame_header.body_length))
            {
                ringbuffer_remove_n(&_rx_buffer, _body_buffer, _frame_header.body_length);
                
                context->state = STATE_HANDLE_FRAME;                
            }
            
            context->interface->rx_enable();
            
            break;
            
        case STATE_HANDLE_FRAME:
            
            if (context->address != _frame_header.destination &&
                context->address != NET_FRAME_ADDR_BROADCAST)
            {
                // Frame is addressed to someone else... ignore.
                context->state = STATE_WAIT;
            }
            else if (_frame_header.flags & NET_FRAME_HEADER_FLAGS_ACK)
            {
                // Handle ACK
                _net_handle_ack(context, &_frame_header);
                
                context->state = STATE_WAIT;
            }
            else if (_frame_header.flags & NET_FRAME_HEADER_FLAGS_ERR)
            {
                // A recoverable error occurred.
                
                // Resend all unacked frames...
                _net_resend_unacked(context);
                
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
                
                ringbuffer_add_n(&_rx_user_buffer, _frame_header_raw, NET_FRAME_HEADER_SIZE);
                
                if (_frame_header.body_length > 0) {
                    ringbuffer_add_n(&_rx_user_buffer, _body_buffer, _frame_header.body_length);
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
            
            context->interface->rx_disable();
            ringbuffer_clear(&_rx_buffer, 0);
            context->interface->rx_enable();
            
            context->state = STATE_WAIT;
            
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
    ringbuffer_add(&_rx_buffer, d);
}

void net_on_interface_write(void* param)
{
    NetContext* context = (NetContext*) param;
    
    if (context == NULL)
        return;
    
    if (context->interface == NULL)
        return;
 
    // This function should either be called from an interrupt
    // or have interrupts for tx disabled prior to calling.
    // In other words, interrupts are not disabled/enabled here.
     
    // Send data
    if (!ringbuffer_is_empty(&_tx_buffer)) {
        context->interface->write(ringbuffer_remove(&_tx_buffer));
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
    // Populate the header checksum
    header->header_sum = net_sum((uint8_t*) header, NET_FRAME_HEADER_SIZE-1);
    
    // Populate the body checksum
    header->body_sum = net_sum(body, header->body_length);
    
    context->interface->tx_disable();
    
    // Append header to the send queue  
    ringbuffer_add_n(&_tx_buffer, (uint8_t*) header, NET_FRAME_HEADER_SIZE);
    
    // Append body to the send queue
    if (body != NULL && header->body_length > 0)
    {
        ringbuffer_add_n(&_tx_buffer, body, header->body_length);
    }
    
    context->interface->tx_enable();
    
    // Append header to the ack list
    ringbuffer_add_n(&_tx_ack_buffer, (uint8_t*) header, NET_FRAME_HEADER_SIZE);
    
    // Append body to the ack list
    if (body != NULL && header->body_length > 0)
    {
        ringbuffer_add_n(&_tx_ack_buffer, body, header->body_length);
    }
    
    // Force a write to the interface
    // TODO some other method?
    net_on_interface_write((void*)context);
}

uint8_t _net_random_id()
{
    // TODO
    return 1;
}

void _net_resend_unacked(NetContext* context)
{
    uint8_t first_id = 0;
    uint8_t seen_first_id = 0;
    
    context->interface->tx_disable();
    
    while(!ringbuffer_is_empty(&_tx_ack_buffer))
    {
        uint8_t frame_id = ringbuffer_at(&_tx_ack_buffer, 3);
        uint8_t frame_body_length = ringbuffer_at(&_tx_ack_buffer, 4);
        
        if (seen_first_id == 0)
        {
            // Keep track of the first ID in the ack buffer
            first_id = frame_id;
            seen_first_id = 1;
        }
        else if (frame_id == first_id)
        {
            // We've looped through all the data in the ack buffer...
            break;
        }
        
        // Copy header + body to tx buffer, and re-add to tx ack buffer
        for(size_t i = 0; i < NET_FRAME_HEADER_SIZE + frame_body_length; i++)
        {
            uint8_t d = ringbuffer_remove(&_tx_ack_buffer);
            ringbuffer_add(&_tx_buffer, d);
            ringbuffer_add(&_tx_ack_buffer, d);
        }
    }
    
    context->interface->tx_enable();
    
    // Force a write to the interface
    // TODO some other method?
    net_on_interface_write((void*)context);
}

void _net_handle_ack(NetContext* context, FrameHeader *ack)
{
    uint8_t ack_id = ack->id;
    
    uint8_t frame_id;
    uint8_t frame_body_length;
    
    context->interface->tx_enable();
    
    while(!ringbuffer_is_empty(&_tx_ack_buffer))
    {
        // Peak at header data in buffer
        frame_id = ringbuffer_at(&_tx_ack_buffer, 3);
        frame_body_length = ringbuffer_at(&_tx_ack_buffer, 4);
        
        // Remove the frame if frame_id <= id
        if (ack_id - frame_id < NET_MAX_ACK_DISTANCE)
        {
            ringbuffer_remove_n(&_tx_ack_buffer, NULL, NET_FRAME_HEADER_SIZE + frame_body_length);
        }            
        else
        {
            break;
        }            
    }
    
    context->interface->tx_disable();
}