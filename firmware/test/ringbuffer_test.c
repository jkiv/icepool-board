#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

#define MUNIT_ENABLE_ASSERT_ALIASES
#include "munit.h"

#include "data/ringbuffer.h"

MunitResult ringbuffer_init_test(const MunitParameter params[], void* user_data_or_fixture)
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

  return MUNIT_OK;
}

MunitResult ringbuffer_add_test(const MunitParameter params[], void* user_data_or_fixture)
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

  return MUNIT_OK;
}

MunitResult ringbuffer_remove_test(const MunitParameter params[], void* user_data_or_fixture)
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

  return MUNIT_OK;
}

MunitResult ringbuffer_add_n_test(const MunitParameter params[], void* user_data_or_fixture)
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

  return MUNIT_OK;
}

MunitResult ringbuffer_remove_n_test(const MunitParameter params[], void* user_data_or_fixture)
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

  return MUNIT_OK;
}

// Munit Test List

MunitTest ringbuffer_tests[] = {
  {
    "/init", /* name */
    ringbuffer_init_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/add", /* name */
    ringbuffer_add_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/remove", /* name */
    ringbuffer_remove_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/add-n", /* name */
    ringbuffer_add_n_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/remove-n", /* name */
    ringbuffer_remove_n_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }
};

// Munit Test Suite

static const MunitSuite suite = {
  "/ringbuffer", /* name */
  ringbuffer_tests, /* tests */
  NULL, /* suites */
  1, /* iterations */
  MUNIT_SUITE_OPTION_NONE /* options */
};

int main (int argc, const char* argv[])
{
  return munit_suite_main(&suite, NULL, argc, (char * const *) argv);
}
