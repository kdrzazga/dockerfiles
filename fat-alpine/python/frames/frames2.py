import curses

from frame_lib import Frame

def main(stdscr):
    global frame1

    frame1 = Frame(stdscr, 5, 4, 28, 9, 1)
    stdscr.clear()
       
    frame1.draw()
    
    frame1.add_text("Jerzy z Bialowiezy")
    frame1.add_text("12345689012345678901234567890")
    key = stdscr.getch()
    frame1.add_text_xy(2, 1, "abcdefghojklmnopqrstuvw123455678")
    frame1.add_text_xy(6, 3, "23455678")
    key = stdscr.getch()
    
    
if __name__ == '__main__':
    curses.wrapper(main)
    