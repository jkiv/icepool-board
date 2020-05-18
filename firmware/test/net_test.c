#include <stdio.h>

#define MUNIT_ENABLE_ASSERT_ALIASES
#include "munit.h"

#include "net/net.h"
#include "net/interface.h"

// Dummy NetInterface

void dummy_write(uint8_t x)
{
    //printf("\tdummy_write: %X\n", x);
}

uint8_t dummy_read()
{
    return 0; // TODO
}

void dummy_void()
{
    // ...
}

void net_interface_dummy_init(NetInterface* interface)
{
    interface->read = dummy_read;
    interface->write = dummy_write;
    interface->rx_enable = dummy_void;
    interface->rx_disable = dummy_void;
    interface->tx_enable = dummy_void;
    interface->tx_disable = dummy_void;
}

// TODO 

// Test initialize context + buffers

// Test recv good header, no payload, not for us
// Test recv good header, no payload, for us
// Test recv good header, no payload, for us, broadcast
// Test recv good header, bad payload 
// Test recv good header, good payload
// Test recv good header, good payload, not for us
// Test recv good header, good payload, for us
// Test recv good header, good payload, for broadcast

// Test recv bad header
// Test recv bad header, with payload
// Test recv bad header, with incomplete payload

// FUTURE Test dynamic addressing

MunitResult net_init_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    assert(context.address == NET_FRAME_ADDR_GUEST_UNSET);
    assert(context.interface == &interface);
    assert(context.state == STATE_START);

    return MUNIT_OK;
}

MunitResult net_initial_state_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    assert(context.state == STATE_START);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    return MUNIT_OK;
}

MunitResult net_good_header_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    // Should be a valid header
    uint8_t header_data[NET_FRAME_HEADER_SIZE] =
    {
      0x00, // src
      0xFF, // dst
      0x00, // flags
      0x5A, // id
      0x00, // body length
      0xFF, // body sum
      0x00  // header sum
    };

    // Compute sum for header
    header_data[6] = net_sum(header_data, 6);

    // Initialize context 

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    // Start tickin'

    assert(context.state == STATE_START);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    net_tick(&context); // redundant ticks
    net_tick(&context); //
    net_tick(&context); // 

    assert(context.state == STATE_WAIT);

    // Simulate reading in a frame from an interface

    net_on_interface_read(header_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[1], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[2], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[3], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[4], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[5], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[6], NULL);
    net_tick(&context);

    assert(context.state == STATE_HANDLE_FRAME);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    // TODO pull header from recv() and compare to buffer

    return MUNIT_OK;
}

MunitResult net_bad_header_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    // Should be a valid header
    uint8_t header_data[NET_FRAME_HEADER_SIZE] =
    {
      0x00, // src
      0xFF, // dst
      0x00, // flags
      0x5A, // id
      0x00, // body length
      0xFF, // body sum
      0x00  // header sum
    };

    // Compute <BAD> sum for header
    header_data[6] = ~net_sum(header_data, 6);

    // Initialize context 

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    // Start tickin'

    assert(context.state == STATE_START);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    // Simulate reading in a frame from an interface

    net_on_interface_read(header_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[1], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[2], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[3], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[4], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[5], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[6], NULL);
    net_tick(&context);

    assert(context.state == STATE_ERROR);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    return MUNIT_OK;
}

MunitResult net_good_frame_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    // Should be a valid header
    uint8_t header_data[NET_FRAME_HEADER_SIZE] =
    {
      0x00, // src
      0xFF, // dst
      0x00, // flags
      0x5A, // id
      0x00, // body length
      0x00, // body sum
      0x00  // header sum
    };

    uint8_t body_data[5] = {'H', 'e', 'l', 'l', 'o'};

    // Add body length and sum to header
    header_data[4] = 5;
    header_data[5] = net_sum(body_data, header_data[4]);

    // Compute sums for header
    header_data[6] = net_sum(header_data, 6);

    // Initialize context 

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    // Start tickin'

    assert(context.state == STATE_START);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    // Simulate reading in a frame from an interface

    net_on_interface_read(header_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[1], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[2], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[3], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[4], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[5], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[6], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[1], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[2], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[3], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[4], NULL);
    net_tick(&context);

    assert(context.state == STATE_HANDLE_FRAME);

    net_tick(&context);

    // TODO check ACK frame in tx buffer

    assert(context.state == STATE_WAIT);

    return MUNIT_OK;
}

MunitResult net_bad_frame_test(const MunitParameter params[], void* user_data_or_fixture)
{
    NetContext context;
    NetInterface interface;

    // Should be a valid header
    uint8_t header_data[NET_FRAME_HEADER_SIZE] =
    {
      0x00, // src
      0xFF, // dst
      0x00, // flags
      0x5A, // id
      0x00, // body length
      0x00, // body sum
      0x00  // header sum
    };

    uint8_t body_data[5] = {'H', 'e', 'l', 'l', 'o'};

    // Add body length and sum to header
    header_data[4] = 5;
    header_data[5] = net_sum(body_data, header_data[4]) + 1; // BAD sum

    // Compute sums for header
    header_data[6] = net_sum(header_data, 6);

    // Initialize context 

    net_interface_dummy_init(&interface);

    net_init(&context, &interface, NET_FRAME_ADDR_GUEST_UNSET);

    // Start tickin'

    assert(context.state == STATE_START);

    net_tick(&context);

    assert(context.state == STATE_WAIT);

    // Simulate reading in a frame from an interface

    net_on_interface_read(header_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[1], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[2], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[3], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[4], NULL);
    net_tick(&context);

    net_on_interface_read(header_data[5], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_HEADER);

    net_on_interface_read(header_data[6], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[0], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[1], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[2], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[3], NULL);
    net_tick(&context);

    assert(context.state == STATE_RECV_BODY);

    net_on_interface_read(body_data[4], NULL);
    net_tick(&context);

    assert(context.state == STATE_HANDLE_FRAME);

    net_tick(&context);

    // TODO check ERR frame in tx buffer

    assert(context.state == STATE_WAIT);

    return MUNIT_OK;
}

// Munit Test List

MunitTest net_tests[] = {
  {
    "/init", /* name */
    net_init_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/initial-state", /* name */
    net_initial_state_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/good-header", /* name */
    net_good_header_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/bad-header", /* name */
    net_bad_header_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/good-frame", /* name */
    net_good_frame_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  {
    "/bad-frame", /* name */
    net_bad_frame_test, /* test */
    NULL, /* setup */
    NULL, /* tear_down */
    MUNIT_TEST_OPTION_NONE, /* options */
    NULL /* parameters */
  },
  { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }
};

// Munit Test Suite

static const MunitSuite suite = {
  "/net", /* name */
  net_tests, /* tests */
  NULL, /* suites */
  1, /* iterations */
  MUNIT_SUITE_OPTION_NONE /* options */
};

int main (int argc, const char* argv[])
{
  return munit_suite_main(&suite, NULL, argc, (char * const *) argv);
}
