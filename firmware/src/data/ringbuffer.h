#ifndef ICEPOOL_DATA_RINGBUFFER_H_
#define ICEPOOL_DATA_RINGBUFFER_H_

#include <stddef.h>
#include <stdint.h>

typedef struct {
    size_t _head;
    size_t _tail;
    size_t _occupancy;
    size_t size;
    uint8_t* _buffer;
} RingBuffer;

// Initializes ring buffer using provided `buffer` of `size` bytes.
// FUTURE - allocate buffer using malloc()
void ringbuffer_init(RingBuffer* self, uint8_t* buffer, size_t size);

// Cleans up ring buffer
// FUTURE - free underlying buffer using free()
void ringbuffer_deinit(RingBuffer*);

// Modifies the ring buffer to appear empty.
// The underlying buffer is zeroed if `zero` option is set.
//void ringbuffer_clear(struct RingBuffer*, uint8_t zero = 0);

// Returns 0 if `self` can store one or more bytes. Otherwise returns non-zero.
uint8_t ringbuffer_is_full(RingBuffer* self);

// Returns 0 if `self` contains data. Otherwise returns non-zero.
uint8_t ringbuffer_is_empty(RingBuffer* self);

// Returns 0 if `self` cannot add `n` bytes of data. Otherwise returns non-zero.
uint8_t ringbuffer_has_vacancy(RingBuffer* self, size_t n);

// Returns 0 if `self` does not contain `n` or more bytes. Otherwise returns non-zero.
uint8_t ringbuffer_has_occupancy(RingBuffer* self, size_t n);

// Adds a byte to the head of the buffer
void ringbuffer_add(RingBuffer* self, uint8_t item);

// Copies `length` bytes from `src` to the head and moves the head forward by `length`.
void ringbuffer_add_n(RingBuffer* self, uint8_t* src, size_t length);

// Removes and returns the byte from the tail of the buffer
uint8_t ringbuffer_remove(RingBuffer* self);

// Copies `length` bytes from the tail of the buffer into `dest` and moves the tail forward by `length`.
void ringbuffer_remove_n(RingBuffer* self, uint8_t* dest, size_t length);

#endif