#include <stdio.h>

#include "net/interface_termios.h"

#define HEADER_LENGTH (NET_FRAME_HEADER_SIZE)
#define BODY_LENGTH (13)

static void write_raw(NetInterface* iface, uint8_t* data, size_t length);
static void read_raw(NetInterface* iface, uint8_t* data, size_t length);
static void assert_buffers_are_equal(uint8_t* a, uint8_t* b, size_t length);

int main(int argc, char* argv[])
{
  uint8_t rx_buffer[1024] = { 0 };

  uint8_t message[HEADER_LENGTH + BODY_LENGTH] = {
    // Header
    0x0, 0x1, 0x0, 0x0, 0xD, 0x92, 0x5F,
    // Body
    'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!'
  };

  uint8_t message_ACK_expected[HEADER_LENGTH] = {
    // Header-only
    0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xF8
  };

  uint8_t message_echo_expected[HEADER_LENGTH + BODY_LENGTH] = {
    // Header
    0x1, 0x0, 0x0, 0x0, 0xD, 0x92, 0x5F,
    // Body
    'H', 'e', 'l', 'l', 'o', ',', ' ', 'W', 'o', 'r', 'l', 'd', '!'
  };
  uint8_t message_echo_ACK[HEADER_LENGTH] = {
    0x0, 0x1, 0x2, 0x0, 0x0, 0x0, 0xF8
  };

  // Initialize interface
  NetInterface iface;

  net_interface_termios_init(&iface, "/dev/ttyUSB0", 9600);

  // Send message
  write_raw(&iface, message, HEADER_LENGTH + BODY_LENGTH);

  // Wait for ACK
  read_raw(&iface, rx_buffer, HEADER_LENGTH);

  // -- check ACK
  assert_buffers_are_equal(rx_buffer, message_ACK_expected, HEADER_LENGTH);

  // Wait for echo
  read_raw(&iface, rx_buffer, HEADER_LENGTH + BODY_LENGTH);

  // -- check echo 
  assert_buffers_are_equal(rx_buffer, message_echo_expected, HEADER_LENGTH + BODY_LENGTH);

  // Send ACK for echo
  write_raw(&iface, message_echo_ACK, HEADER_LENGTH);

  return EXIT_SUCCESS;
}

void write_raw(NetInterface* iface, uint8_t* data, size_t length)
{
  fprintf(stdout, "Writing...\n");
  for(size_t n; n < length; n++) {
    iface->write(iface, data[n]);
    fprintf(stdout, "%02X ", data[n]);
  }
  fprintf(stdout, "\n");
}

void read_raw(NetInterface* iface, uint8_t* data, size_t length)
{
  fprintf(stdout, "Reading...\n");
  for(size_t n; n < length; n++) {
    data[n] = iface->read(iface);
    fprintf(stdout, "%02X ", data[n]);
  }
  fprintf(stdout, "\n");
}

void assert_buffers_are_equal(uint8_t* a, uint8_t* b, size_t length)
{
  for(size_t n; n < length; n++)
  {
    if (a[n] != b[n]) {
      fprintf(stderr, "Buffers differ at %zu: %02X != %02X\n", n, a[n], b[n]);
      exit(EXIT_FAILURE);
    }
  }

  fprintf(stdout, "OK!\n");
}
