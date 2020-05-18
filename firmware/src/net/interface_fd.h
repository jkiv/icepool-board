#ifndef NET_INTERFACE_FD_H_
#define NET_INTERFACE_FD_H_

#include <stdio.h>

#include "net.h"
#include "interface.h"

typedef struct
{
  FILE* file;

  void (*on_read)(uint8_t d, void*);
  void (*on_write)(void*);
  void* callback_params;
} NetInterfaceFdParams;

void net_interface_fd_init_params(NetInterfaceFdParams* params, FILE* fd, NetContext* context);
void net_interface_fd_init(NetInterface* iface, NetInterfaceFdParams* params);

uint8_t net_interface_fd_read(void*);
void net_interface_fd_write(uint8_t, void*);

#endif /* NET_INTERFACE_FD_H_ */
