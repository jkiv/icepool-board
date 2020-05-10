#ifndef ICEPOOL_NET_H_
#define ICEPOOL_NET_H_

#include <stdint.h>
#include <stdlib.h>

#define NET_RX_BUFFER_LEN (1024UL)
#define NET_TX_BUFFER_LEN (1024UL)

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

#define NET_FRAME_HEADER_SIZE   (7UL)
#define NET_FRAME_BODY_MAX_SIZE (32UL)
#define NET_FRAME_MAX_SIZE (NET_FRAME_HEADER_SIZE + NET_FRAME_BODY_MAX_SIZE)

typedef struct
{
    uint8_t  source;
    uint8_t  destination;
    uint8_t  flags;           // TODO bitfield
    uint8_t  id;
    uint8_t  body_length;
    uint8_t  body_sum;
    uint8_t  header_sum;
} FrameHeader;

typedef enum {
  STATE_START,
  STATE_WAIT,
  STATE_RECV_HEADER,
  STATE_RECV_PAYLOAD,
  STATE_HANDLE_FRAME,
  STATE_UNKNOWN
} FrameState;

typedef struct
{
    uint8_t address;
    FrameState state;
} NetContext;

void net_init(NetContext* context, uint8_t address);

// Update context state and handle data
void net_tick(NetContext* context);

// Callback for device read complete.
void net_on_read(uint8_t d);

// Callback for device write complete.
void net_on_write();

// Validates frame header data
// TODO may require context, e.g. addresses, flags, etc.
uint8_t net_validate_header(FrameHeader* header);

// Validates payload data
uint8_t net_validate_payload(uint8_t* payload, size_t length, uint8_t sum);

#endif /* ICEPOOL_NET_H_ */