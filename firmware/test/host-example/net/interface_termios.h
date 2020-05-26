#ifndef NET_INTERFACE_TERMIOS_H__
#define NET_INTERFACE_TERMIOS_H__

#include <stdint.h> 

#include <asm/termbits.h>

#include "net/interface.h"

typedef struct
{
  // Provided by user
  const char* path;
  uint32_t baud;
  
  // Kept by driver
  int _fd;
  struct termios _options;
} NetInterfaceTermiosConfig;

// Initialize termios interface
void net_interface_termios_init(NetInterface* iface, const char* path, uint32_t baudrate);

#endif /* NET_INTERFACE_TERMIOS_H__ */
