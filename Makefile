CC	= arm-none-eabi-gcc
AS	= $(CC)
RM	= rm -f

CFLAGS	= -ansi -pedantic -Wall -Wextra -Werror \
	  -Ofast -mthumb -march=armv6-m -mcpu=cortex-m0plus
LDFLAGS	= 

C_SRCS	= main.c
AS_SRCS	= cpu.S
OBJS	= $(AS_SRCS:.S=.o) $(C_SRCS:.c=.o)


all: emu.bin

emu.bin: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	$(RM) $(OBJS)

.PHONY: all clean

