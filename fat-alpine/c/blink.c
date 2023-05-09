#include <ncurses.h>
#include <unistd.h>

int main() {
    initscr(); // initialize the ncurses library
    cbreak();  // disable line buffering
    noecho();  // disable echoing of input

    while (1) {
        clear();       // clear the screen
        printw("Blink!"); // print a message
        refresh();     // refresh the screen
        usleep(500000);  // wait for 500ms (0.5 seconds)
        clear();       // clear the screen
        refresh();     // refresh the screen
        usleep(500000);  // wait for 500ms (0.5 seconds)
    }

    endwin(); // cleanup the ncurses library
    return 0;
}
