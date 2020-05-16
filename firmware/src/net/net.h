#ifndef ICEPOOL_NET_H_
#define ICEPOOL_NET_H_

#include <stdint.h>
#include <stdlib.h>

#include "interface.h"

/*

A network, here, contains one host and one or more guests.

Data is sent between host and guest using a frame structure.

A frame consists of a 48-bit header of the following format:

      [7:0] source address
     [15:8] destination address
       [16] ACK flag
       [17] ERR flag
    [23:18] Frame ID (0-255)
    [31:24] frame body length (max. 256 bytes)
    [39:32] frame body checksum
    [47:40] header checksum

The frame header is followed by the frame body. The frame body can contain
arbitrary data, up to 256 bytes.

If the frame is received correctly, the guest must respond with a frame
containing the same Frame ID as the frame received and the ACK flag
set.

If the frame is not received correctly, the guest must respond to the
host with a frame containing the last correctly received Frame ID and
the ERR flag set. The host will wait a random amount of time and resend
every frame sent after the provided Frame ID. The delay allows the guest
to clear its receive buffer and return to a waiting ("start of frame")
state.

Note, flags take on the following precedence from highest to lowest:
ERR, ACK.

Each guest needs an address to communicate with the host, since all
guests share an RX and TX line with each other.

The host is always at address 0. The host can send a message to all
guests using the "broadcast" address 0xFF. Guests can take on addresses
0x01 through 0xFE.

This library supports automatic addressing, managed by the host. A
guest can request an address by sending the host a "HELLO" frame. The
host will either assign the guest an unreserved address or a response
with the ERR flag set.

The HELLO sequence is as follows:

    guest                           host

    src = 0xFF
    dst = 0x00
     id = <any>
    body = <hello>

                                    src = 0x00
                                    dst = <new address>
                                    id = <matching initial request>
                                    ack = 1
                                    body = <hello>
                            
    src = <new address>
    dst = 0x00
    id = <matching initial request>
    ack = 1

Static addressing is also supported. A guest can assert itself as
another address, without using the HELLO mechanism. These guests are
referred to as jerks.

<FUTURE>

The host can also release an address by sending a GOODBYE frame.

The GOODBYE sequence is as follows:

guest                           host

                                src = 0x00
                                dst = <address to expire>
                                id = <any>
                                body = <goodbye>

src = <address to expire>
dst = 0x00
id = <matching initial request>
ack = 1

When a GOODBYE frame is received, the guest whose address expired will
need to re-request an address.

</FUTURE>

This library also supports a higher-level "messaging" protocol. If used,
the frame body is assumed to take the following format:

    [7:0] message type
    [..8] message-specific body

The library can automatically examine the message type and dispatch the
body data to a registered handler function, which will interpret the
body data further.

Message types and structure are defined by the user application.

*/

#define NET_FRAME_HEADER_SIZE      (sizeof(FrameHeader))
#define NET_FRAME_BODY_MAX_SIZE    (32UL)
#define NET_FRAME_MAX_SIZE         (NET_FRAME_HEADER_SIZE + NET_FRAME_BODY_MAX_SIZE)

#define NET_RX_BUFFER_LEN          (1024UL)
#define NET_TX_BUFFER_LEN          (1024UL)
#define NET_RX_USER_BUFFER_LEN     (4 * NET_FRAME_BODY_MAX_SIZE)
#define NET_TX_ACK_BUFFER_LEN      (4 * NET_FRAME_BODY_MAX_SIZE)

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
    uint8_t address;
    uint8_t next_id;
    FrameState state;
    NetInterface *interface;
} NetContext;

// Initialize NetContext and underlying buffers.
void net_init(NetContext* context, NetInterface* iface, uint8_t address);

// Returns 1 if ready to receive a frame using net_recv(). Returns 0 otherwise.
uint8_t net_available();

// Copies awaiting data into `header` and optional `body`.
// If no data is available, header and body will remain unchanged.
// Call net_available() prior to net_recv() to determine whether data is waiting.
// `body` must be at least NET_FRAME_BODY_MAX_SIZE bytes in size.
void net_recv(NetContext* context, FrameHeader* header, uint8_t* body);

// Constructs a frame from the provided data and queues it in the net subsystem.
void net_send(NetContext* context, uint8_t dest_addr, uint8_t* body, size_t body_length);

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

#endif /* ICEPOOL_NET_H_ */