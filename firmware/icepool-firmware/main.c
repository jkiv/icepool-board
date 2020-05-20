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

// Network interface
static NetInterface interface;

// Network context
static NetContext context;

int main(void)
{
    // Set up system
    system_init();
     
    // Set up UART
    uart_init(9600);
     
    // Set up NetDevice for net subsystem
    net_interface_uart_init(&interface);
        
    // Initialize buffers
    ringbuffer_init(&context.recv_buffer, _context_rx_buffer, NET_CONTEXT_RECV_BUFFER_LEN);
    ringbuffer_init(&context.ack_buffer, _context_ack_buffer, NET_CONTEXT_ACK_BUFFER_LEN);
    ringbuffer_init(&interface.rx_buffer, _iface_rx_buffer, NET_IFACE_RX_BUFFER_LEN);
    ringbuffer_init(&interface.tx_buffer, _iface_tx_buffer, NET_IFACE_TX_BUFFER_LEN);

    // Set up context and buffers for net subsystem
    net_init(&context, &interface, 0x01);

    // Enable the UART
    uart_enable_interrupts();
    uart_enable();
    
    /*
    while(1)
    {
        if(ringbuffer_has_occupancy(&interface.rx_buffer, 3))
        {
            while(!ringbuffer_is_empty(&interface.rx_buffer))
            {
                interface.write(&interface, ringbuffer_remove(&interface.rx_buffer));
            }
        }
    }*/
    
    while(1)
    {
        net_tick(&context);
        
        // Echo any received data
        while (!ringbuffer_is_empty(&context.recv_buffer))
        {
            // Pop the header
            // -- re-use context.frame_buffer
            net_recv(&context, &context.frame_buffer.header, context.frame_buffer.body);
            
            // Echo data back
            net_send(&context, context.frame_buffer.header.source,
                context.frame_buffer.body, context.frame_buffer.header.body_length);
        }
        
        //__asm("wfi");
    }
}