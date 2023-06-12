#How to compile and build:

nasm -f elf64 HelloAsm.asm -o hello.o
ld hello.o  -o hello

or

source cmpl.sh filename    (without .asm extension)
