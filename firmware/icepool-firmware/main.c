#include <string.h>
#include "sam.h"
#include "system.h"

#include "uart.h"
#include "net/net.h"
#include "net/interface_uart.h"

// Raw buffers for context, interface
static uint8_t _iface_rx_buffer[NET_IFACE_RX_BUFFER_LEN];
static uint8_t _iface_tx_buffer[NET_IFACE_TX_BUFFER_LEN];
static uint8_t _context_rx_buffer[NET_CONTEXT_RECV_BUFFER_LEN];
static uint8_t _context_ack_buffer[NET_CONTEXT_ACK_BUFFER_LEN];

// Local buffer for frame data
FrameBuffer frame_buffer;

// Network interface
static NetInterface interface;

// Network context
static NetContext context;

int main(void)
{
    // Set up system
    system_init();
 
    // Set up NetDevice for net subsystem
    net_interface_uart_init(&interface);
 
    // Set up context and buffers for net subsystem
    net_init(&context, &interface, 0x01);
    
    // Initialize buffers
    ringbuffer_init(&context.recv_buffer, _context_rx_buffer, NET_CONTEXT_RECV_BUFFER_LEN);
    ringbuffer_init(&context.ack_buffer, _context_ack_buffer, NET_CONTEXT_ACK_BUFFER_LEN);
    ringbuffer_init(&interface.rx_buffer, _iface_rx_buffer, NET_IFACE_RX_BUFFER_LEN);
    ringbuffer_init(&interface.tx_buffer, _iface_tx_buffer, NET_IFACE_TX_BUFFER_LEN);
    
    // Set up UART
    uart_init(9600);
        
    uart_enable_interrupts();
    uart_enable();

    while(1)
    {
        net_tick(&context);
        
        // Echo any received data
        while (!ringbuffer_is_empty(&context.recv_buffer))
        {
            // Pop the header
            net_recv(&context, &frame_buffer.header, frame_buffer.body);
            
            // Echo data back
            net_send(&context, frame_buffer.header.source,
                frame_buffer.body, frame_buffer.header.body_length);
        }
        
        //__asm("wfi");
    }
}