import curses
import time
import random

# Labyrinth representation
labyrinth = [
    "###############",
    "#    . . .    #",
    "# .## ####. . #",
    "# #        # .#",
    "# ######## # #",
    "#   P      # G#",
    "# ######## # #",
    "# .        # .#",
    "# ###### ### .#",
    "#         #  .#",
    "###############"
]

# Character symbols
PACMAN = "P"
GHOST = "G"
WALL = "#"

# Positions of Pac-Man and ghosts
pacman = (5, 5)
ghosts = [(2, 10), (4, 2), (8, 8), (10, 5)]

# Initialize curses
stdscr = curses.initscr()
curses.curs_set(0)
stdscr.nodelay(1)
stdscr.timeout(200)

# Function to draw the labyrinth and characters
def draw_labyrinth():
    for row in range(len(labyrinth)):
        for col in range(len(labyrinth[row])):
            if (row, col) == pacman:
                stdscr.addstr(row, col, PACMAN)
            elif (row, col) in ghosts:
                stdscr.addstr(row, col, GHOST)
            else:
                stdscr.addstr(row, col, labyrinth[row][col])

# Animation loop
while True:
    stdscr.clear()
    draw_labyrinth()
    stdscr.refresh()

    # Update ghost positions (random movement)
    for i in range(len(ghosts)):
        row, col = ghosts[i]
        direction = random.choice([-1, 1])
        if random.random() < 0.5:
            new_row = row + direction
            if labyrinth[new_row][col] != WALL and (new_row, col) not in ghosts:
                ghosts[i] = (new_row, col)
        else:
            new_col = col + direction
            if labyrinth[row][new_col] != WALL and (row, new_col) not in ghosts:
                ghosts[i] = (row, new_col)

    # Check collision between Pac-Man and ghosts
    if pacman in ghosts:
        stdscr.addstr(len(labyrinth) + 1, 0, "Game Over!")
        stdscr.refresh()
        break

    # Handle keyboard input to control Pac-Man
    key = stdscr.getch()
    if key == curses.KEY_UP and labyrinth[pacman[0] - 1][pacman[1]] != WALL:
        pacman = (pacman[0] - 1, pacman[1])
    elif key == curses.KEY_DOWN and labyrinth[pacman[0] + 1][pacman[1]] != WALL:
        pacman = (pacman[0] + 1, pacman[1])
    elif key == curses.KEY_LEFT and labyrinth[pacman[0]][pacman[1] - 1] != WALL:
        pacman = (pacman[0], pacman[1] - 1)
    elif key == curses.KEY_RIGHT and labyrinth[pacman[0]][pacman[1] + 1] != WALL:
        pacman = (pacman[0], pacman[1] + 1)

    time.sleep(0.1)

curses.endwin()
