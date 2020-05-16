#include "../uart.h"
#include "device.h"

void net_device_uart_init(NetDevice* device)
{
    device->read = uart_read;
    device->write = uart_write;
    
    device->rx_enable = uart_enable_interrupts;
    device->rx_disable = uart_disable_interrupts;
    
    device->tx_enable = uart_enable_interrupts;
    device->tx_disable = uart_disable_interrupts;
}