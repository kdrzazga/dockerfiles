import curses

from frame_lib import Frame

def main(stdscr):
    global mainFrame
    color_set = 10
    
    stdscr.clear()
    stdscr.bkgd(' ', curses.color_pair(color_set))    
    
    mainFrame = Frame(stdscr, 0, 0, 70, 12, color_set)
    commandFrame = Frame(stdscr, 0, 12, 50, 18, color_set)
    infoFrame = Frame(stdscr, 50, 12, 70, 18, color_set)
    
    mainFrame.draw()
    commandFrame.draw()
    infoFrame.draw()
    
    #commandFrame.add_text("L1tw0 Ojc2y2No. moj@")
    #mainFrame.add_text("12345689012345678901234567890")
    key = stdscr.getch()
    
    #mainFrame.add_text_xy(2, 1, "abcdefghojklmnopqrstuvw123455678")
    #mainFrame.add_text_xy(6, 3, "23455678")
    infoFrame.add_text_xy(0, 0, "Press Q or E")
    infoFrame.add_text_xy(0, 1, "(capital)")
    infoFrame.add_text_xy(0, 2, "to exit")
    
    expression = ""
    command = ""
    result = ""
    
    while True:

        key = stdscr.getch()

        if key == 10:
            commandFrame.clear()
            mainFrame.add_text(expression)
            command = ""

        elif key == ord('E') or key == ord('Q'):
            break

        elif ord('a') <= key <= ord('z') or key == 32: 
            command += chr(key)
            expression += chr(key)
            commandFrame.clear()
            commandFrame.add_text(command)
    
if __name__ == '__main__':
    curses.wrapper(main)
    