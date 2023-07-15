import curses

class Crosshair:
    
    def __init__(self, stdscr, x, y):
        self.x = x
        self.y = y
        self.stdscr = stdscr
        
    def move_left():
        self.x -=1
        
    def move_right():
        self.x +=1
        
    def move_up():
        self.y -=1
        
    def move_right():
        self.y +=1
        
    def draw():
        stdscr.addstr(self.x, self.y, "X")
    