CC=clang

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=001.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o 001

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)

clean:
	rm -f 001
