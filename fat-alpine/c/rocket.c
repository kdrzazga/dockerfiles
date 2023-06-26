#include <stdio.h>
#include <unistd.h>

#define MAX_X 80
#define MAX_Y 20

void clearScreen() {
    printf("\033[2J\033[1;1H"); // ANSI escape sequence to clear the screen
}

void drawRocket(int x, int y) {
    printf("\033[%d;%dH", y, x); // ANSI escape sequence to position the cursor

    // ASCII art of a rocket
    printf("_\n");
	printf("\033[%d;%dH", y+1, x);
	printf("| \\_______________\n");
	printf("\033[%d;%dH", y+2, x);
    printf("Z                 \\\n");
	printf("\033[%d;%dH", y+3, x);    
	printf("Z  _______________/\n");
	printf("\033[%d;%dH", y+4, x);
    printf("|_/\n");
}

int main() {
    int x = 1, y = MAX_Y / 2;

    while (1) {
        clearScreen();
        drawRocket(x, y);
        // Update the rocket's position
        x++;

        // Check if the rocket has reached the right edge
        if (x >= MAX_X)
            x = 1;

        usleep(40000); // Pause for a short time (50 milliseconds)
    }

    return 0;
}
