TARGET_NAME=003

SOURCE_FILE=\
	$(TARGET_NAME).sim

all: clean default

default: $(TARGET_NAME)

$(TARGET_NAME):
	cim -S -o bignum.atr ../lib/bignum.sim/src/bignum.sim
	cim -o bignum.o ../lib/bignum.sim/src/bignum.sim
	sleep 1
	cim -S -o bignum_list.atr ../lib/bignum_list.sim
	cim -o obignum_list.o ../lib/bignum_list.sim
	mv bignum_list.atr bignumlist.atr
	mv bignum_list.o bignumlist.o
	sleep 1
	cim -o $(TARGET_NAME) $(SOURCE_FILE)

clean:
	rm -f *.atr
	rm -f .o
	rm -f $(TARGET_NAME)
