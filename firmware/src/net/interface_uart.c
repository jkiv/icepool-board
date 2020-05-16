#include "../uart.h"
#include "interface.h"

void net_interface_uart_init(NetInterface* iface)
{
    iface->read = uart_read;
    iface->write = uart_write;
    
    iface->rx_enable = uart_enable_interrupts;
    iface->rx_disable = uart_disable_interrupts;
    
    iface->tx_enable = uart_enable_interrupts;
    iface->tx_disable = uart_disable_interrupts;
}