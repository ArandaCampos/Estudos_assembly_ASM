code=hello

build:
	nasm -f elf64 $(code).asm -o $(code).o
	ld -s $(code).o -o $(code)

clear:
	rm $(code) $(code).o
