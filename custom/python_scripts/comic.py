#!/usr/bin/env python

import os
import curses
import random

from colorama import Fore

if os.name == 'nt':
    dir = ''
else:
    dir = '/usr/bin/scripts'

images = []

for filename in ('1.txt', '2.txt', '3.txt'):
    filepath = os.path.join(dir, 'data', filename)
    with open(filepath, 'r') as file:
        content = file.read()
        images.append(content)

current_image_index = 0

def display_image(stdscr):
    
    curses.start_color()
    curses.init_pair(1, curses.COLOR_CYAN, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_WHITE, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_YELLOW, curses.COLOR_BLACK)
    curses.init_pair(4, curses.COLOR_BLUE, curses.COLOR_BLACK)
    curses.init_pair(5, curses.COLOR_GREEN, curses.COLOR_BLACK)
    curses.init_pair(6, curses.COLOR_MAGENTA, curses.COLOR_BLACK)
    colors = [1, 2, 3, 4, 5, 6]
    
    global current_image_index
    while True:
        stdscr.clear()
        color_pair = random.choice(colors)
        stdscr.addstr(images[current_image_index], curses.color_pair(color_pair))
        stdscr.refresh()
        
        key = stdscr.getch()
        if key == curses.KEY_RESIZE:
            stdscr.clear()
            stdscr.addstr("Resized window!")
            stdscr.refresh()
            stdscr.getch()
        elif key == ord(' '): 
            current_image_index = (current_image_index + 1) % len(images)
        elif key == 27:
            stdscr.clear()
            stdscr.addstr("Exiting...\n")
            stdscr.refresh()
            stdscr.getch()
            break

curses.wrapper(display_image)