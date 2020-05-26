#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#include <termios.h> // POSIX terminal interface

#include "net/interface_termios.h"

static void _termios_init(NetInterfaceTermiosConfig* config);

static uint8_t _net_interface_termios_read(NetInterface* self);
static void _net_interface_termios_write(NetInterface* self, uint8_t data);
static void _net_interface_termios_enable_interrupts(NetInterface* self);
static void _net_interface_termios_disable_interrupts(NetInterface* self);

// FUTURE lookup which Interface has data by file descriptor.
static NetInterfaceTermiosConfig _config;

void net_interface_termios_init(NetInterface* self, const char* path, uint32_t baudrate)
{
    // Set up abstract interface
    self->read = _net_interface_termios_read;
    self->write = _net_interface_termios_write;
    self->rx_enable = _net_interface_termios_enable_interrupts;
    self->rx_disable = _net_interface_termios_disable_interrupts;
    self->tx_enable = _net_interface_termios_enable_interrupts;
    self->tx_disable = _net_interface_termios_disable_interrupts;
    
    // Initialize termios config

    _config.path = path;
    _config.baud = baudrate;

    _termios_init(&_config);

    // self->child is a NetInterfaceTermiosConfig*
    self->child = (void*) &_config;
}

void _termios_init(NetInterfaceTermiosConfig* config)
{
  int fd;
  struct termios options;
  speed_t baud = B9600;

  fd = open(config->path, O_RDWR | O_NOCTTY | O_NDELAY);

  if (fd < 0) {
    fprintf(stderr, "Could not open serial device '%s'.\n", config->path);
    exit(EXIT_FAILURE);
  }

  // Clear file descriptor flags 
  //fcntl(fd, F_SETFL, 0);
  
  // Configure port
  tcgetattr(fd, &options);

  switch(config->baud)
  {
    // Map integer value to speed_t
    // ...
    case 115200:
      baud = B115200;
      break;
    case 57600:
      baud = B57600;
      break;
    case 38400:
      baud = B38400;
      break;
    case 19200:
      baud = B19200;
      break;
    // Default: B9600
  }

  cfsetispeed(&options, baud);
  cfsetospeed(&options, baud);

  // Set for 8N1
  options.c_cflag &= ~PARENB;
  options.c_cflag &= ~CSTOPB;
  options.c_cflag &= ~CSIZE;
  options.c_cflag |= (CS8 | CLOCAL | CREAD);
  
  // Disable hardware flow control
  options.c_cflag &= ~CRTSCTS;

  // Local Options
  options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG); // raw input

  // Input Options
  options.c_iflag &= ~(INPCK);          // Disable parity check
  options.c_iflag &= ~(PARMRK);         // Disable marking parity errors
  options.c_iflag |= (ISTRIP | IGNPAR); // Strip parity, ignore parity errors, map CR -> NL

  // Output Options
  options.c_oflag &= ~(OPOST); // raw output
                               // -- ignores all other out options

  // Character Options
  // TODO

  // Flush and update options
  tcsetattr(fd, TCSANOW, &options);

  // Wire up asynchronous callbacks
  // TODO

  // Save configuration into NetInterfaceTermiosConfig
  config->_fd = fd;
  config->_options = options;
}

void net_interface_termios_deinit(NetInterface* self, NetInterfaceTermiosConfig* config)
{
  close(config->_fd);
}


uint8_t _termios_read(NetInterfaceTermiosConfig* config)
{
  uint8_t data = 0;

  if (config == 0)
    return 0;
   
  // Blocking while reading
  while(read(config->_fd, &data, 1) == 0);

  return data;
}

void _termios_write(NetInterfaceTermiosConfig* config, uint8_t data)
{
  if (config != NULL)
      // Blocking while writing
      while(write(config->_fd, &data, 1) == 0);
}

uint8_t _net_interface_termios_read(NetInterface* self)
{
  if (self == NULL)
    return 0;

  // TODO on read?

  return _termios_read((NetInterfaceTermiosConfig*) self->child);
}

void _net_interface_termios_write(NetInterface* self, uint8_t data)
{
  if (self == NULL)
    return;

  // TODO on write?

  _termios_write((NetInterfaceTermiosConfig*) self->child, data);
}

void _net_interface_termios_enable_interrupts(NetInterface* self)
{
  // ...
}

void _net_interface_termios_disable_interrupts(NetInterface* self)
{
  // ...
}

/*
void _net_interface_termios_on_signal(int sig, siginfo_t* info, void* ucontext)
{
  // TODO SA_SIGINFO
}
*/
