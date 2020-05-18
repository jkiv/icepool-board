cc = clang

ringbuffer_test: munit.c ringbuffer_test.c ../src/data/ringbuffer.h ../src/data/ringbuffer.c
	$(cc) -o ringbuffer_test --std=c99 munit.c ../src/data/ringbuffer.c ringbuffer_test.c -I../src/

net_test: munit.c net_test.c ../src/net/device.h ../src/net/net.h ../src/net/net.c ../src/data/ringbuffer.h ../src/data/ringbuffer.c
	$(cc) -o net_test --std=c99 munit.c ../src/data/ringbuffer.c ../src/net/net.c net_test.c -I../src/

test: ringbuffer_test net_test
	./ringbuffer_test
	./net_test

clean:
	rm -f ringbuffer_test
	rm -f net_test
