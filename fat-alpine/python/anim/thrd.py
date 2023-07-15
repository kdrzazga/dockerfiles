import threading
import keyboard
import platform
import logging
import curses
import time
import sys
import os

recent_key = None

def listen_keyboard():
    global recent_key
    keyboard.on_press(lambda event: on_key_press(event))
    keyboard.wait()

def on_key_press(event):
    global recent_key
    recent_key = event.name

def display():
    global recent_key
    while True:
        stdscr.clear()
        stdscr.addstr(1, 1, "Recently Pressed Key/Character:" + recent_key)
        time.sleep(0.15)

def main(stdscr):
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
    
    anim_thread = threading.Thread(target=display)
    anim_thread.daemon = True
    anim_thread.start()
    
    listen_keyboard()


if __name__ == '__main__':
    curses.wrapper(main)
    