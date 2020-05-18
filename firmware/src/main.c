#include <string.h>
#include "sam.h"
#include "system.h"

#include "uart.h"
#include "net/net.h"
#include "net/interface_uart.h"

static NetInterface _interface;
static NetContext _context;

FrameHeader _header;
static uint8_t _body_buffer[NET_FRAME_BODY_MAX_SIZE];

// TODO Initialize NetEndpointList for all addresses? LOL

int main(void)
{
    // Set up system
    system_init();
 
    // Set up NetDevice for net subsystem
    net_interface_uart_init(&_interface, NULL);
 
    // Set up context and buffers for net subsystem
    net_init(&_context, &_interface, 0x01);
    
    // Set up UART
    uart_init(9600);
    
    uart_set_on_read(net_on_interface_read, &_interface);
    uart_set_on_write(net_on_interface_write, &_interface);
    
    uart_enable_interrupts();
    uart_enable();

    while(1)
    {
        net_tick(&_context);
        
        // Echo any received data
        while (!ringbuffer_is_empty(&_context.recv))
        {
            // Pop the header
            net_recv(&_context, &_header, _body_buffer);
            
            // Echo data back
            net_send(&_context, _header.source, _body_buffer, _header.body_length);
        }
        
        //__asm("wfi");
    }
}