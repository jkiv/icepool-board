#include <string.h>
#include "sam.h"
#include "system.h"

#include "uart.h"
#include "net/net.h"

NetContext _context;

int main(void)
{
    // Set up system
    system_init();
 
    // Set up data, buffers, etc.
    net_init(&_context, 0x01);
    
    // TODO wire up uart_write to net
    
    // Set up UART
    uart_init(9600);
    
    uart_set_on_read(net_on_read);
    uart_set_on_write(net_on_write);
    
    uart_enable_interrupts();
    uart_enable();

    while(1) {
        net_tick(&_context);
        
        //__asm("wfi");
    }
}