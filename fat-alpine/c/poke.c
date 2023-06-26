#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>

#define MEMORY_SIZE 0x100

void printMemorySegment(void *start_address, size_t length) {
    unsigned char *memory_ptr = (unsigned char *)start_address;

    for (size_t i = 0; i < length; i++) {
        if (i % 10 == 0) printf("\nAddress: %p ", (void *)memory_ptr);
        printf("%u  ", *memory_ptr);
        memory_ptr++;
    }
    printf("\nEnd address: %p\n", (void *)memory_ptr);
}

int main() {
    void *desired_address = (void *)0x10000000;  // Specify the desired address
    void *memory = mmap(desired_address, MEMORY_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);

    if (memory == MAP_FAILED) {
        printf("\nFailed to allocate memory.\n");
        return 1;
    }

    unsigned char *memory_ptr = (unsigned char *)memory;
    unsigned char *initial_ptr = (unsigned char *)memory;

    printMemorySegment(memory_ptr, MEMORY_SIZE);

    printf("\nStart address in RAM: %p\n", (void *)memory_ptr);

    for (int i = 0; i <= MEMORY_SIZE; i++) {
        memory_ptr[i] = (12 * i) % 255;
    }

    printf("\nPoking complete.\n");

    printMemorySegment(initial_ptr, MEMORY_SIZE);

    munmap(memory, MEMORY_SIZE);

    return 0;
}
