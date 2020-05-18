#include "../uart.h"
#include "interface.h"

static uint8_t _net_interface_uart_read(void* params);
static void _net_interface_uart_write(uint8_t data, void* params);
static void _net_interface_uart_enable_interrupts(void* params);
static void _net_interface_uart_disable_interrupts(void* params);

void net_interface_uart_init(NetInterface* iface, void* params)
{
    iface->params = params;
    
    iface->read = _net_interface_uart_read;
    iface->write = _net_interface_uart_write;
    
    iface->rx_enable = _net_interface_uart_enable_interrupts;
    iface->rx_disable = _net_interface_uart_disable_interrupts;
    
    iface->tx_enable = _net_interface_uart_enable_interrupts;
    iface->tx_disable = _net_interface_uart_disable_interrupts;
}

uint8_t _net_interface_uart_read(void* params)
{
    return uart_read();
}

void _net_interface_uart_write(uint8_t data, void* params)
{
    uart_write(data);
}

void _net_interface_uart_enable_interrupts(void* params)
{
    uart_enable_interrupts();
}

void _net_interface_uart_disable_interrupts(void* params)
{
    uart_disable_interrupts();
}