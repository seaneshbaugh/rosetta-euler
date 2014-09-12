CC=clang
CFLAGS=-std=c11 -Wall -g

TARGET_NAME=010

SOURCE_FILES=\
	$(TARGET_NAME).c

INCLUDE_DIRECTORIES=-I../lib/generic_array/src

SYMBOLS=

all: clean default

default: $(TARGET_NAME)

$(TARGET_NAME):
	$(CC) $(CFLAGS) $(INCLUDE_DIRECTORIES) $(SYMBOLS) $(SOURCE_FILES) -o $(TARGET_NAME)

valgrind:
	which valgrind > /dev/null 2>&1
	if [ $$? -eq 0 ]; then valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET_NAME); else echo "Valgrind not found."; fi

clean:
	rm -f $(TARGET_NAME)
	rm -rf $(TARGET_NAME).dSYM
