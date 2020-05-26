#ifndef NET_INTERFACE_H__
#define NET_INTERFACE_H__

#include "net.h"
#include "../data/ringbuffer.h"

struct NetInterface_t;
typedef struct NetInterface_t NetInterface;

struct NetInterface_t
{
    RingBuffer rx_buffer;
    RingBuffer tx_buffer;
    
    void (*write)(NetInterface* self, uint8_t data);
    uint8_t (*read)(NetInterface* self);
    void (*rx_enable)(NetInterface* self);
    void (*rx_disable)(NetInterface* self);
    void (*tx_enable)(NetInterface* self);
    void (*tx_disable)(NetInterface* self);
    
    void* child;
};

#endif /* NET_INTERFACE_H__ */