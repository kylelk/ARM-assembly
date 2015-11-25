FILENAME=$(shell basename $(shell pwd))
all:
	echo $(FILENAME)
	arm-linux-gnueabihf-as $(FILENAME).s -o $(FILENAME).o
	arm-linux-gnueabihf-ld $(FILENAME).o -o $(FILENAME)
	objcopy -O binary $(FILENAME) $(FILENAME).bin

clean:
	rm $(FILENAME).o
	rm $(FILENAME).bin
	rm $(FILENAME)
