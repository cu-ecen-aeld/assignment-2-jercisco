# Compiler settings
CC=aarch64-none-linux-gnu-gcc
CFLAGS := -Wall -Wextra -pedantic

# Target and sources
TARGET := writer
SRC := writer.c

# Object files
OBJ := $(SRC:.c=.o)

# Default target
all: $(TARGET)

# Build target
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Clean target
clean:
	rm -f $(TARGET) $(OBJ)
	

