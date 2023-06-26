gcc -c main.c
as assembly_function.s -o assembly_function.o
gcc main.o assembly_function.o -o ass -no-pie
