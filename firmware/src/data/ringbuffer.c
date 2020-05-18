#include "ringbuffer.h"

// TODO handle null buffer

void ringbuffer_init(RingBuffer* self, uint8_t* buffer, size_t size)
{
    self->_head = 0;
    self->_tail = 0;
    self->_occupancy = 0;
    self->size = size;
    self->_buffer = buffer;
    // FUTURE self->_buffer = malloc(size);
}

void ringbuffer_clear(RingBuffer* self, uint8_t zero)
{
    // Clear buffer if requested
    if (zero != 0) {
        for (size_t i = 0; i < self->size; i++)
            self->_buffer[i] = 0;
    }
    
    // Reset buffer
    self->_head = 0;
    self->_tail = 0;
    self->_occupancy = 0;
}

void ringbuffer_deinit(RingBuffer* self)
{
    // FUTURE free(self->_buffer);
}

uint8_t ringbuffer_is_full(RingBuffer* self)
{
    return (self->_occupancy == self->size);
}

uint8_t ringbuffer_is_empty(RingBuffer* self)
{
    return (self->_occupancy == 0);
}

// Returns 0 if `self` cannot add `n` bytes of data. Otherwise returns non-zero.
uint8_t ringbuffer_has_vacancy(RingBuffer* self, size_t n)
{
    return ((self->size - self->_occupancy) >= n);
}

// Returns 0 if `self` does not contain `n` or more bytes. Otherwise returns non-zero.
uint8_t ringbuffer_has_occupancy(RingBuffer* self, size_t n)
{
    return (self->_occupancy >= n);
}

uint8_t ringbuffer_occupancy(RingBuffer* self)
{
    return self->_occupancy;
}

uint8_t ringbuffer_remove(RingBuffer* self)
{
    if (!ringbuffer_is_empty(self))
    {
        uint8_t item = self->_buffer[self->_tail];
        self->_tail = (self->_tail + 1) % self->size;
        self->_occupancy--;
        
        return item;
    }
    
    return 0;
}

void ringbuffer_add(RingBuffer* self, uint8_t item)
{
    if (!ringbuffer_is_full(self))
    {
        self->_buffer[self->_head] = item;
        self->_head = (self->_head + 1) % self->size;
        self->_occupancy++;
    }
}

void ringbuffer_remove_n(RingBuffer* self, uint8_t* dest, size_t length)
{
    if (length == 0)
    {
        // Nothing to do...
        return;
    }
    
    if (self->size < length || self->_occupancy < length)
    {
        // Not enough items in source buffer...
        return;
    }

    if (dest != NULL)
    {
        uint8_t* src = &self->_buffer[self->_tail];
        uint8_t* src_done = &self->_buffer[(self->_tail + length) % self->size];
        uint8_t* buffer_end = self->_buffer + self->size;
        
        // Copy `src` into `dest`
        while(src != src_done)
        {
            *dest = *src;
            dest++;
            src++;
            
            // Wrap `src` pointer to start of underlying buffer when the end is reached
            if (src == buffer_end) {
                src = self->_buffer;
            }
        }
        
    }
    
    // Advance tail
    self->_tail = (self->_tail + length) % self->size;
        
    // Update occupancy
    self->_occupancy -= length;
}

void ringbuffer_add_n(RingBuffer* self, uint8_t* src, size_t length)
{
    if (src == NULL || length == 0)
    {
        // Nothing to do...
        return;
    }
    
    if (self->size < length || !ringbuffer_has_vacancy(self, length))
    {
        // Not enough space in destination buffer...
        return;
    }
    
    uint8_t* dest = &self->_buffer[self->_head];
    uint8_t* dest_done = &self->_buffer[(self->_head + length) % self->size];
    uint8_t* buffer_end = self->_buffer + self->size;
    
    // Copy `src` into `dest`
    while(dest != dest_done)
    {
        *dest = *src;
        dest++;
        src++;
        
        // Wrap `dest` pointer to start of underlying buffer when the end is reached
        if (dest == buffer_end) {
            dest = self->_buffer;
        }
    }
    
    // Advance head
    self->_head = (self->_head + length) % self->size;
        
    // Update occupancy
    self->_occupancy += length;
}

uint8_t ringbuffer_at(RingBuffer* self, size_t index)
{
    // TODO handle index >= size
    // TODO handle index >= occupancy
    
    index = (index + self->_tail) % self->size;
    
    return self->_buffer[index];
}