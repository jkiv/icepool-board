#include <stdio.h>
#include <stdlib.h>

#include "data/ringbuffer.h"
#include "net/interface.h"
#include "net/interface_fd.h"
#include "net/net.h"

static void print_ringbuffer(RingBuffer* buf, size_t count, const char* indent);
static void print_usage(const char* program);

static NetContext context;
static FrameHeader header;

static NetInterface interface;
static NetInterfaceFdParams iface_params;

int main(int argc, const char* argv[])
{
  if (argc < 2) {
    print_usage(argv[0]);
    exit(EXIT_FAILURE);
  }

  printf("Opening '%s'...\n", argv[1]);

  FILE* serial = fopen(argv[1], "w+b");

  if (serial == NULL) {
    fprintf(stderr, "Could not open '%s'.\n", argv[1]);
    exit(EXIT_FAILURE);
  }

  // Send a frame manually...
  printf("Sending data to '%s' manually...\n", argv[1]);
  fputc(0x00, serial); // source
  fputc(0x01, serial); // destination
  fputc(0x00, serial); // flags
  fputc(0x00, serial); // id
  fputc(0x00, serial); // body length
  fputc(0xFF, serial); // body sum
  fputc(0xFE, serial); // header sum

  printf("Waiting for ACK header...\n");
  for (size_t n = 0; n < sizeof(header); )
  {
    int c = fgetc(serial);

    if (c != EOF) {
      printf("%02X", c);
      n++;
    }
    else {
      fprintf(stderr, "fgetc() error: %d\n", ferror(serial));
      exit(EXIT_FAILURE);
    }
  }

  return EXIT_SUCCESS;
}

void print_usage(const char* program)
{
  fprintf(stderr, "Usage:\n  %s serial\n\n", program);
}
