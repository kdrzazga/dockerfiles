#include <stdio.h>

extern void assembly_function();

int main() {
    printf("Before calling assembly function.\n");

    assembly_function();

    printf("After calling assembly function.\n");

    return 0;
}
