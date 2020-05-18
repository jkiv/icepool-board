echo: echo.c ../../src/net/net.h\
             ../../src/net/net.c\
			 ../../src/net/interface.h\
			 ../../src/net/interface_fd.h\
			 ../../src/net/interface_fd.c\
			 ../../src/data/ringbuffer.h\
			 ../../src/data/ringbuffer.c
	clang -o echo echo.c ../../src/data/ringbuffer.c ../../src/net/net.c ../../src/net/interface_fd.c -I../../src/

test_send: test_send.c ../../src/net/net.h\
  					   ../../src/net/net.c\
					   ../../src/net/interface.h\
					   ../../src/net/interface_fd.h\
					   ../../src/net/interface_fd.c\
					   ../../src/data/ringbuffer.h\
					   ../../src/data/ringbuffer.c
	clang --std=c99 -O1 -o test_send test_send.c ../../src/data/ringbuffer.c ../../src/net/net.c ../../src/net/interface_fd.c -I../../src/
