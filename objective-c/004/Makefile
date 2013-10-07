CC=clang

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=004.m

CFLAGS=-Wall -Werror -g -v $(SOURCE)
LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=-o 004

all:
	$(CC) $(CFLAGS) $(LDFLAGS) $(OUT)

clean:
	rm -f 004
