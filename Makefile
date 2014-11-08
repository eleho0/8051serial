CC = sdcc
FLAGS = -mmcs51 --model-small --std-c99
FILENAME = show

MAKEHEX = packihx


all: bin
	ls *.bin

bin: hex
	hex2bin $(FILENAME).hex

hex: 
	$(CC) $(FLAGS) $(FILENAME).c
	$(MAKEHEX) $(FILENAME).ihx >./$(FILENAME).hex

	
.PHONY: clean

clean:
	-rm *.hex *.ihx *.asm
	

fire:
	stcflash timer.bin  ###
	# I hate sudo
	#sudo stcflash timer.bin  ###
