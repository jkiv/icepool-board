#include "../uart.h"
#include "interface.h"

static uint8_t _net_interface_uart_read(NetInterface* self);
static void _net_interface_uart_write(NetInterface* self, uint8_t data);
static void _net_interface_uart_enable_interrupts(NetInterface* self);
static void _net_interface_uart_disable_interrupts(NetInterface* self);

void net_interface_uart_init(NetInterface* self)
{
    // Set up abstract interface
    self->read = _net_interface_uart_read;
    self->write = _net_interface_uart_write;
    self->rx_enable = _net_interface_uart_enable_interrupts;
    self->rx_disable = _net_interface_uart_disable_interrupts;
    self->tx_enable = _net_interface_uart_enable_interrupts;
    self->tx_disable = _net_interface_uart_disable_interrupts;
    
    // Wire up asynchronous UART callbacks    
    uart_set_on_read(net_on_interface_read, (void*) self);
    uart_set_on_write(net_on_interface_write, (void*) self);
    
    // FUTURE
    // NetInterfaceUartConfig* x;
    // self->child = (void*) x;
}

uint8_t _net_interface_uart_read(NetInterface* self)
{
    return uart_read();
}

void _net_interface_uart_write(NetInterface* self, uint8_t data)
{
    uart_write(data);
}

void _net_interface_uart_enable_interrupts(NetInterface* self)
{
    uart_enable_interrupts();
}

void _net_interface_uart_disable_interrupts(NetInterface* self)
{
    uart_disable_interrupts();
}