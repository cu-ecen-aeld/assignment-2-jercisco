# Compiler and compiler options
CC := gcc
CFLAGS := -Wall -Wextra -std=c11
LDFLAGS := -L/usr/lib/x86_64-linux-gnu $(LDFLAGS)


# Cross-compiler options
ifdef CROSS_COMPILE
    CC := $(CROSS_COMPILE)gcc
    LDFLAGS := $(LDFLAGS) -static
endif

# Source and object files
SRC := writer.c
OBJ := writer.o

# Targets
.PHONY: all clean

all: writer

writer: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f writer $(OBJ)

