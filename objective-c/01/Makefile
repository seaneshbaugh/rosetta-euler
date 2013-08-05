CC=clang

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=01.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o 01

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)

clean:
	rm -f 01
