#ifndef INTERFACE_UART_H__
#define INTERFACE_UART_H__

#include "interface.h"

typedef struct {
    // FUTURE
} NetInterfaceUartConfig;

void net_interface_uart_init(NetInterface* self);

#endif /* INTERFACE_UART_H__ */