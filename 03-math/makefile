code=program

build:
	nasm -f elf64 $(code).asm -o $(code).o
	ld $(code).o -o $(code)

clear:
	rm $(code) $(code).o
