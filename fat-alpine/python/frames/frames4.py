import curses

from frame_lib import Frame

def main(stdscr):
   
    init(stdscr)
        
    expression = ""
    history = []
    command = ""
        
    while True:

        key = stdscr.getch()

        if key == 10:
            commandFrame.clear()
            mainFrame.add_text(expression)            
            #mainFrame.fill_with_list(history)
            command = ""
        
        elif key == 27 or key == ord('/'):
            mainFrame.newline()
            history.append(expression)
            command = ""
            expression = ""

        elif key == ord('E') or key == ord('Q'):
            break

        elif ord('a') <= key <= ord('z') or key == 32: 
            command += chr(key)
            expression += chr(key)
            commandFrame.clear()
            commandFrame.add_text(command)


def init(stdscr):
    global mainFrame
    global commandFrame
    global infoFrame
    
    color_set = 10
    
    stdscr.clear()
    stdscr.bkgd(' ', curses.color_pair(color_set))    
    
    mainFrame = Frame(stdscr, 0, 0, 70, 12, color_set)
    commandFrame = Frame(stdscr, 0, 12, 50, 18, color_set)
    infoFrame = Frame(stdscr, 50, 12, 70, 18, color_set)
    
    mainFrame.draw()
    commandFrame.draw()
    infoFrame.draw()
    
    infoFrame.add_text_xy(0, 0, "Press Q or E")
    infoFrame.add_text_xy(0, 1, "(capital)")
    infoFrame.add_text_xy(0, 2, "to exit")
    
if __name__ == '__main__':
    curses.wrapper(main)
    