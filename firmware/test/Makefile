ringbuffer_test: ringbuffer_test.c ../src/data/ringbuffer.c ../src/data/ringbuffer.h
	clang -o ringbuffer_test --std=c99 ../src/data/ringbuffer.c ringbuffer_test.c -I../src/

test: ringbuffer_test
	./ringbuffer_test
