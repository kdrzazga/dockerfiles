#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MAX_LINE_LENGTH 256

void clearScreen() {
    printf("\033[2J\033[H");
    fflush(stdout);
}

void displayFile(const char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        printf("Failed to open file: %s\n", filename);
        return;
    }

    clearScreen();

    char line[MAX_LINE_LENGTH];
    while (fgets(line, MAX_LINE_LENGTH, file) != NULL) {
        printf("%s", line);
    }

    fclose(file);
    fflush(stdout);
}

int main() {
    displayFile("c.ansi.txt");
    sleep(2);
    clearScreen();

    displayFile("linguin.ansi.txt");
    sleep(2);
    clearScreen();

    system("mc");

    return 0;
}
