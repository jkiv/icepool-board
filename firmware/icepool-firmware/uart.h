#ifndef ICEPOOL_UART_H__
#define ICEPOOL_UART_H__

#include <stdint.h>
#include <stddef.h>

#include "system.h"

// Initializes the UART hardware.
// FUTURE supply UART configuration structure, SERCOM reference, etc.
void uart_init(uint32_t baudrate);

// Enables the UART.
void uart_enable();

// Disables the UART.
void uart_disable();

// Enables interrupts for the UART.
void uart_enable_interrupts();

// Disables interrupts for the UART.
void uart_disable_interrupts();

// Reads a single byte from the UART.
uint8_t uart_read();

// Writes a single byte to the UART.
void uart_write(uint8_t data);

// Reads `length` bytes from the UART into `buffer`. Blocks until completed.
// Returns the actual number of bytes read.
size_t uart_read_n(uint8_t* buffer, size_t length);

// Writes `length` bytes from `buffer` to the UART. Blocks until completed.
// Returns the actual number of bytes written.
size_t uart_write_n(const uint8_t* buffer, size_t length);

// Set callback for when a byte is sent.
// An optional `param` is passed to the callback when called.
void uart_set_on_write(void (*on_write)(void*), void* param);

// Set callback for when a byte is read. The byte is passed to the callback.
// An optional `param` is also passed to the callback when called.
void uart_set_on_read(void (*on_read)(uint8_t, void*), void* param);

#endif