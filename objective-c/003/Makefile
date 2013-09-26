CC=clang

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=003.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o 003

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)

clean:
	rm -f 003
