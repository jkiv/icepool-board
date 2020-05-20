#ifndef NET_H__
#define NET_H__

#include <stdint.h>
#include <stdlib.h>

#include "interface.h"
#include "../data/ringbuffer.h"

#define NET_CONTEXT_RECV_BUFFER_LEN  (2 * NET_FRAME_BODY_MAX_SIZE)
#define NET_CONTEXT_ACK_BUFFER_LEN (2 * NET_FRAME_BODY_MAX_SIZE)

#define NET_IFACE_RX_BUFFER_LEN    (512UL)
#define NET_IFACE_TX_BUFFER_LEN    (512UL)

#define NET_FRAME_HEADER_FLAGS_ERR (1UL << 0)
#define NET_FRAME_HEADER_FLAGS_ACK (1UL << 1)

#define NET_MAX_ACK_DISTANCE       (0x0F)

#define NET_FRAME_ADDR_BROADCAST   (0xFF)
#define NET_FRAME_ADDR_HOST        (0x00)
#define NET_FRAME_ADDR_GUEST_UNSET (0xFF)

typedef struct __attribute__ ((__packed__))
{
    uint8_t  source;
    uint8_t  destination;
    uint8_t  flags;         // TODO bitfield
    uint8_t  id;
    uint8_t  body_length;
    uint8_t  body_sum;
    uint8_t  header_sum;
} FrameHeader;

#define NET_FRAME_HEADER_SIZE      (sizeof(FrameHeader))
#define NET_FRAME_BODY_MAX_SIZE    (32UL)
#define NET_FRAME_MAX_SIZE         (NET_FRAME_HEADER_SIZE + NET_FRAME_BODY_MAX_SIZE)

typedef enum
{
    STATE_START,
    STATE_WAIT,
    STATE_RECV_HEADER,
    STATE_RECV_BODY,
    STATE_HANDLE_FRAME,
    STATE_ERROR,
    STATE_UNKNOWN
} FrameState;

typedef struct
{
    FrameHeader header;
    uint8_t body[NET_FRAME_BODY_MAX_SIZE];
} FrameBuffer;

typedef struct NetInterface_t NetInterface; // FIXME why???

typedef struct
{
    uint8_t address;
    uint8_t next_id; // FUTURE endpoint-specific next_id's
    FrameState state;
    RingBuffer recv_buffer;
    RingBuffer ack_buffer;
    FrameBuffer frame_buffer;
    NetInterface* interface;
} NetContext;

// Initialize NetContext and underlying buffers.
void net_init(NetContext* context, NetInterface* iface, uint8_t address);

// Returns 1 if ready to receive a frame using net_recv(). Returns 0 otherwise.
uint8_t net_available(NetContext* context);

// Copies awaiting data into `header` and optional `body`.
// If no data is available, header and body will remain unchanged.
// Call net_available() prior to net_recv() to determine whether data is waiting.
// `body` must be at least NET_FRAME_BODY_MAX_SIZE bytes in size.
void net_recv(NetContext* context, FrameHeader* header, uint8_t* body);

// Constructs a frame from the provided data and queues it in the net subsystem.
void net_send(NetContext* context, uint8_t address, uint8_t* body, size_t body_length);

// Update context state and handle data
void net_tick(NetContext* context);

// Computes the 8-bit checksum for the provided `buffer` of `length` bytes.
uint8_t net_sum(uint8_t* buffer, size_t length);

// Callback for underlying interface.
// Called after a byte `d` is received on the underlying interface.
void net_on_interface_read(uint8_t d, void* param);

// Callback for underlying interface.
// Called after a byte is sent on the underlying interface.
void net_on_interface_write(void* param);

#endif /* NET_H__ */