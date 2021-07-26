CC = gcc
ASMFLAGS = -f elf32
CFLAGS = -Os -s -m32 -nostdlib -fno-stack-protector

CFOLDER = src/C/
ASMFOLDER = src/asm/

demo: $(ASMFOLDER)/test.asm $(CFOLDER)/demo.c
	nasm $(ASMFLAGS) -o test.o src/asm/test.asm
	$(CC) $(CFLAGS) -o demo.o -c src/C/demo.c

	ld -m elf_i386 -o demo test.o demo.o

	sstrip -z demo
