src=../../src

net_deps=$(src)/net/net.h $(src)/net/net.c
ringbuffer_deps=$(src)/data/ringbuffer.h $(src)/data/ringbuffer.c
interface_deps=$(src)/net/interface.h
termios_deps=net/interface_termios.h net/interface_termios.c

echo_simple: $(net_deps) $(ringbuffer_deps) $(interface_deps) $(termios_deps) echo_simple.c
	clang -v -g --std=c99 -O1 -o $@ \
	  -I$(src) -I. \
	  echo_simple.c \
	  net/interface_termios.c \
	  $(src)/data/ringbuffer.c

host: $(net_deps) $(ringbuffer_deps) $(interface_deps) $(termios_deps) example.c
	clang --std=c99 -O1 -o $@ \
	  -I$(src) -I. \
	  example.c \
	  net/interface_termios.c \
	  $(src)/net/net.c \
	  $(src)/data/ringbuffer.c

default: echo_simple
