CC = ncc
FASM = fasm
CFLAGS = -Os -I.

all: start.o libc.a

%.o: %.s
	$(FASM) $^ $@
%.o: %.c
	$(CC) $(CFLAGS) $^
libc.a: syscall.o string.o malloc.o atoi.o ctype.o stdlib.o \
		stdarg.o stdio.o termios.o
	$(AR) rcs $@ $^

clean:
	rm -f *.o *.a
