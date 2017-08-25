main.bin: main.asm
	dasm main.asm -f3 -omain.bin -lmain.lst -smain.sym -d

clean:
	rm -f main.bin main.lst main.sym
