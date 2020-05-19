#ifndef NET_INTERFACE_H_
#define NET_INTERFACE_H_

#include "net.h"
#include "../data/ringbuffer.h"

typedef struct
{
    RingBuffer rx_buffer;
    RingBuffer tx_buffer;
    FrameBuffer frame_buffer;
    
    void* other;
    
    void (*write)(void* self, uint8_t data);
    uint8_t (*read)(void* self);
    void (*rx_enable)(void* self);
    void (*rx_disable)(void* self);
    void (*tx_enable)(void* self);
    void (*tx_disable)(void* self);
    
} NetInterface;

#endif /* NET_INTERFACE_H_ */