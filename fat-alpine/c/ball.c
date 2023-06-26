#include <stdio.h>
#include <unistd.h>

#define MAX_X 80
#define MAX_Y 20

void clearScreen() {
    printf("\033[2J\033[1;1H"); // ANSI escape sequence to clear the screen
}

void drawBall(int x, int y) {
    printf("\033[%d;%dH@", y, x); // ANSI escape sequence to position the cursor and draw the ball
    fflush(stdout);
}

int main() {
    int x = 1, y = 1;
    int dx = 1, dy = 1;

    while (1) {
        clearScreen();
        drawBall(x, y);

        // Update the ball's position
        x += dx;
        y += dy;

        // Check for collision with the walls
        if (x <= 1 || x >= MAX_X)
            dx = -dx;
        if (y <= 1 || y >= MAX_Y)
            dy = -dy;

        usleep(100000); // Pause for a short time (100 milliseconds)
    }

    return 0;
}
