#include "net.h"

#include "../data/ringbuffer.h"
#include "../uart.h"

// TODO include project root in include path for all submodules [?]

// Raw buffers
static uint8_t _rx_raw_buffer[NET_RX_BUFFER_LEN];
static uint8_t _tx_raw_buffer[NET_TX_BUFFER_LEN];

// Ring buffers
static RingBuffer _rx_buffer;
static RingBuffer _tx_buffer;

// One frame
static FrameHeader _rx_frame_header;
static uint8_t _rx_frame_buffer[NET_FRAME_BODY_MAX_SIZE];

// TODO _net_sum_8
uint8_t _net_sum_8(uint8_t* buffer, size_t length);

void net_init(NetContext* context, uint8_t address)
{
    // Initialize context struct
    // FUTURE use automatic addressing
    context->address = address;
    context->state = STATE_START;
    
    // Initialize buffers
    ringbuffer_init(&_rx_buffer, _rx_raw_buffer, NET_RX_BUFFER_LEN);
    ringbuffer_init(&_tx_buffer, _tx_raw_buffer, NET_TX_BUFFER_LEN);
}

void net_on_read(uint8_t d)
{
    ringbuffer_add(&_rx_buffer, d);
}

void net_on_write()
{
    if (!ringbuffer_is_empty(&_tx_buffer)) {
        // TODO avoid UART directly somehow
        uart_write(ringbuffer_remove(&_tx_buffer));
    }        
}

void net_tick(NetContext* context)
{
    uint8_t* raw_frame;
    
    switch(context->state)
    {
        case STATE_START:
        
            // Go to STATE_WAIT immediately
            context->state = STATE_WAIT;
            break;
            
        case STATE_WAIT:
        
            if (!ringbuffer_is_empty(&_rx_buffer)) {
                // Go to STATE_RECV_HEADER if data available
                context->state = STATE_RECV_HEADER;
            }
                 
            break;
            
        case STATE_RECV_HEADER:

            // Treat _rx_frame_header as a raw buffer
            raw_frame = (uint8_t*) (&_rx_frame_header);
            
            // TODO assert sizeof(FrameHeader) == NET_FRAME_HEADER_SIZE
            
            if (ringbuffer_has_occupancy(&_rx_buffer, NET_FRAME_HEADER_SIZE))
            {
                ringbuffer_remove_n(&_rx_buffer, raw_frame, NET_FRAME_HEADER_SIZE);
                
                if (net_validate_header(&_rx_frame_header) && _rx_frame_header.body_length > 0)
                {
                    context->state = STATE_RECV_PAYLOAD;
                }             
                else
                {
                    context->state = STATE_HANDLE_FRAME;
                }
            }                       
            
            break;
            
        case STATE_RECV_PAYLOAD:
            
            if (ringbuffer_has_occupancy(&_rx_buffer, _rx_frame_header.body_length))
            {
                ringbuffer_remove_n(&_rx_buffer, _rx_frame_buffer, _rx_frame_header.body_length);
                context->state = STATE_HANDLE_FRAME;
            }
            
            break;
            
        case STATE_HANDLE_FRAME:
            
            // TODO
            while(1);
            
            break;
            
        default:
            ;
    }
}

uint8_t net_validate_header(FrameHeader* header)
{
    // Compute sum over header
    // TODO
    return 1;
}

uint8_t net_validate_payload(uint8_t* payload, size_t length, uint8_t sum)
{
    // Compute sum over header
    return 1;
}