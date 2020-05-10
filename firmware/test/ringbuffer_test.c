#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "data/ringbuffer.h"

void ringbuffer_init_test()
{
  uint8_t _buf[10] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 10);

  // Is the structure initialized as expected?
  assert(rb._buffer == _buf);
  assert(rb.size == 10);
  assert(rb._occupancy == 0);
  assert(rb._head == 0);
  assert(rb._tail == 0);

  // Extra bonus checks
  assert(ringbuffer_is_empty(&rb) != 0);
  assert(ringbuffer_is_full(&rb) == 0);
  assert(ringbuffer_has_occupancy(&rb, 1) == 0);
  assert(ringbuffer_has_vacancy(&rb, 10) == 1);
}

void ringbuffer_add_test()
{
  uint8_t _buf[3] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 3);

  // Add 2 items
  ringbuffer_add(&rb, 'A');
  ringbuffer_add(&rb, 'B');

  // Is the structure initialized as expected?
  assert(rb._occupancy == 2);
  assert(rb._head == 2);
  assert(rb._tail == 0);

  assert(ringbuffer_is_empty(&rb) == 0);
  assert(ringbuffer_is_full(&rb) == 0);
  assert(ringbuffer_has_occupancy(&rb, 1) == 1);
  assert(ringbuffer_has_occupancy(&rb, 2) == 1);
  assert(ringbuffer_has_vacancy(&rb, 1) == 1);

  // Add 1 more item
  ringbuffer_add(&rb, 'C');

  assert(rb._occupancy == 3);
  assert(rb._head == 0);
  assert(rb._tail == 0);

  assert(ringbuffer_is_empty(&rb) == 0);
  assert(ringbuffer_is_full(&rb) == 1);
  assert(ringbuffer_has_occupancy(&rb, 3) == 1);
  assert(ringbuffer_has_vacancy(&rb, 1) == 0);

  // Add to a full buffer
  ringbuffer_add(&rb, 'X');

  // ... no change
  assert(rb._occupancy == 3);
  assert(rb._head == 0);
  assert(rb._tail == 0);

  assert(ringbuffer_is_empty(&rb) == 0);
  assert(ringbuffer_is_full(&rb) == 1);
  assert(ringbuffer_has_occupancy(&rb, 3) == 1);
  assert(ringbuffer_has_vacancy(&rb, 1) == 0); 
}

void ringbuffer_remove_test()
{
  uint8_t _buf[3] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 3);

  // Add 3 items
  ringbuffer_add(&rb, 'A');
  ringbuffer_add(&rb, 'B');
  ringbuffer_add(&rb, 'C');

  // Remove 2 items
  assert(ringbuffer_remove(&rb) == 'A');
  assert(ringbuffer_remove(&rb) == 'B');

  assert(rb._occupancy == 1);
  assert(rb._head == 0);
  assert(rb._tail == 2);

  // Add 1 item
  ringbuffer_add(&rb, 'D');

  assert(rb._occupancy == 2);
  assert(rb._head == 1);
  assert(rb._tail == 2);

  // Remove 2
  assert(ringbuffer_remove(&rb) == 'C');
  assert(ringbuffer_remove(&rb) == 'D');

  assert(rb._occupancy == 0);
  assert(rb._head == 1);
  assert(rb._tail == 1);

  // Removing from empty buffer
  assert(ringbuffer_remove(&rb) == 0);
}

void ringbuffer_add_n_test()
{
  const char* multibyte = "Hello, World!";
  size_t length = strlen(multibyte);

  uint8_t _buf[64] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 64);

  // Add multibyte element to ringbuffer
  ringbuffer_add_n(&rb, (uint8_t*) multibyte, length);

  assert(rb._occupancy == length);

  for(int i = 0; i < length; i++) {
    assert(ringbuffer_is_empty(&rb) == 0);
    assert(ringbuffer_remove(&rb) == multibyte[i]);
  }
}

void ringbuffer_remove_n_test()
{
  const char* multibyte = "Hello, World!";
  size_t length = strlen(multibyte);

  uint8_t _buf[64] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 64);

  // Add multibyte element to ringbuffer
  for(int i = 0; i < length; i++) {
    ringbuffer_add(&rb, multibyte[i]);
  }

  assert(rb._occupancy == length);

  // Remove and check

  uint8_t result[64] = { 0 };

  assert(ringbuffer_has_occupancy(&rb, length));

  ringbuffer_remove_n(&rb, result, length);

  assert(rb._occupancy == 0);
  assert(ringbuffer_is_empty(&rb) == 1);

  for(int i = 0; i < length; i++) {
    assert(result[i] == multibyte[i]);
  }
}

int main (int argc, const char* argv[])
{
  ringbuffer_init_test();
  ringbuffer_add_test();
  ringbuffer_remove_test();
  ringbuffer_add_n_test();
  ringbuffer_remove_n_test();

  printf("SUCCESS!");
}
