#include <stdlib.h>

#define MUNIT_ENABLE_ASSERT_ALIASES
#include "munit.h"

#include "data/ringbuffer.h"

// Adding items
// Removing items
// Adding to a full buffer
// Removing from an empty buffer
// Wrapping head works
// Wrapping tail works
// Wrap head into tail
// Wrap tail into head
// Multibyte add works
// Multibyte remove works

MunitResult ringbuffer_init_test(const MunitParameter params[], void* user_data_or_fixture)
{
  uint8_t _buf[10] = { 0 };
  RingBuffer rb;

  ringbuffer_init(&rb, _buf, 10);

  // Is the structure initialized as expected?
  assert_ptr_equal(rb._buffer, _buf);
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

MunitTest tests[] = {
  {
    "/init", /* name */
    ringbuffer_init_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }
};

static const MunitSuite suite = {
  "/ringbuffer", /* name */
  tests, /* tests */
  NULL, /* suites */
  1, /* iterations */
  MUNIT_SUITE_OPTION_NONE /* options */
};

int main (int argc, const char* argv[])
{
  return munit_suite_main(&suite, NULL, argc, (char * const *) argv);
}
