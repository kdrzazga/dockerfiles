#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define ARRAY_SIZE 30
#define DELAY_MS 50000

void clearScreen() {
    printf("\033[2J\033[1;1H"); // ANSI escape sequence to clear the screen
}

void drawArray(int arr[], int size, int barHeight) {
    clearScreen();

    for (int i = 0; i < size; i++) {
        for (int j = 0; j < arr[i]; j++) {
            printf("=");
        }
        printf("\n");
    }

    usleep(DELAY_MS);
}

void selectionSort(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        int minIndex = i;

        for (int j = i + 1; j < size; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }

        int temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;

        drawArray(arr, size, 0);
    }
}

int main() {
    int arr[ARRAY_SIZE];

    // Initialize the array with random values
    for (int i = 0; i < ARRAY_SIZE; i++) {
        arr[i] = rand() % (ARRAY_SIZE - 1) + 1;
    }

    drawArray(arr, ARRAY_SIZE, 0);
    selectionSort(arr, ARRAY_SIZE);

    return 0;
}
