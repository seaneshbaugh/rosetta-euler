TARGET_NAME=004

SOURCE_FILE=\
	$(TARGET_NAME).sim

all: clean default

default: $(TARGET_NAME)

$(TARGET_NAME):
	cim -o $(TARGET_NAME) $(SOURCE_FILE)

clean:
	rm -f *.atr
	rm -f .o
	rm -f $(TARGET_NAME)
