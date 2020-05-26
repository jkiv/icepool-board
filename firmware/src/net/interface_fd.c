#include "interface_fd.h"

static void _net_interface_fd_dummy(void*);

void net_interface_fd_init_params(NetInterfaceFdParams* params, FILE* fd, NetContext* context)
{
    // Set up interface callbacks to use net_*
    params->on_read = net_on_interface_read;
    params->on_write = net_on_interface_write;
    params->callback_params = (void*) context;

    // Associate file descriptor
    params->file = fd;
}

void net_interface_fd_init(NetInterface* iface, NetInterfaceFdParams* params)
{
    // Note: params should be set up already using
    //       net_interface_fd_init_params().
    iface->params = (void*) params;

    // Set up function pointers
    iface->read = net_interface_fd_read;
    iface->write = net_interface_fd_write;
    
    iface->rx_enable = _net_interface_fd_dummy;
    iface->rx_disable = _net_interface_fd_dummy;
    
    iface->tx_enable = _net_interface_fd_dummy;
    iface->tx_disable = _net_interface_fd_dummy;
}

uint8_t net_interface_fd_read(void* params)
{
  NetInterfaceFdParams* fdParams =
    (NetInterfaceFdParams*) params;

  uint8_t data;
  
  // Read one byte of data...
  fread(&data, sizeof(uint8_t), 1, fdParams->file);
  // TODO seek to zero?

  if(fdParams->on_read)
    fdParams->on_read(data, fdParams->callback_params);

  return data;
}

void net_interface_fd_write(uint8_t data, void* params)
{
  NetInterfaceFdParams* fdParams =
    (NetInterfaceFdParams*) params;

  // Write one byte of data...
  fwrite(&data, sizeof(uint8_t), 1, fdParams->file);
  fflush(fdParams->file);

  if(fdParams->on_write)
    fdParams->on_write(fdParams->callback_params);
}

void _net_interface_fd_dummy(void* params)
{
  // do nothing
}
