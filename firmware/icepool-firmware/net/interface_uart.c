#include "../uart.h"
#include "interface.h"

void _net_interface_uart_on_read(uint8_t, void* params);
void _net_interface_uart_on_write(void* params);

static uint8_t _net_interface_uart_read(NetInterface* self);
static void _net_interface_uart_write(NetInterface* self, uint8_t data);
static void _net_interface_uart_enable_interrupts(NetInterface* self);
static void _net_interface_uart_disable_interrupts(NetInterface* self);

void net_interface_uart_init(NetInterface* self)
{
    self->read = _net_interface_uart_read;
    self->write = _net_interface_uart_write;
    
    self->rx_enable = _net_interface_uart_enable_interrupts;
    self->rx_disable = _net_interface_uart_disable_interrupts;
    
    self->tx_enable = _net_interface_uart_enable_interrupts;
    self->tx_disable = _net_interface_uart_disable_interrupts;
    
    // Wire up UART callbacks
    uart_set_on_read(_net_interface_uart_on_read, (void*) self);
    uart_set_on_write(_net_interface_uart_on_write, (void*) self);
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

void _net_interface_uart_on_read(uint8_t data, void* params)
{
    NetInterface* self = (NetInterface*) params;
    
    ringbuffer_add(&self->rx_buffer, data);
}

void _net_interface_uart_on_write(void* params)
{
    NetInterface* self = (NetInterface*) params;
     
    // Send data
    // FIXME `tx_buffer` may be locked by caller
    if (!ringbuffer_is_empty(&self->tx_buffer)) {
        self->write(self, ringbuffer_remove(&self->tx_buffer));
    }
}