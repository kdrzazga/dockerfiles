import curses

class Frame:
    def __init__(self, stdscr, left, top, right, bottom, color):
        self.stdscr = stdscr
        
        self.left, self.top = left, top        
        self.right, self.bottom = right, bottom
        self.color = color
        self.cursor_x, self.cursor_y = 0, 0
        self._setup_screen()

    def _setup_screen(self):
        curses.curs_set(0)
        curses.start_color()
        curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)
        curses.init_pair(2, curses.COLOR_WHITE, curses.COLOR_BLACK)
        curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)
        curses.init_pair(10, curses.COLOR_WHITE, curses.COLOR_BLUE)
        curses.init_pair(11, curses.COLOR_YELLOW, curses.COLOR_BLUE)
        curses.init_pair(12, curses.COLOR_CYAN, curses.COLOR_BLUE)        

    def draw(self):
        stdscr = self.stdscr
        top, left, right, bottom = self.top, self.left, self.right, self.bottom
        color = self.color

        stdscr.addstr(top, left, "+" + "-" * (right - left - 1) + "+", curses.color_pair(color))
        for row in range(top + 1, bottom):
            stdscr.addstr(row, left, "|", curses.color_pair(color))
            stdscr.addstr(row, right, "|", curses.color_pair(color))
        stdscr.addstr(bottom, left, "+" + "-" * (right - left - 1) + "+", curses.color_pair(color))

    def add_text(self, text):
        x = self.left + self.cursor_x
        y = self.top + self.cursor_y
        
        if x >= self.right or y >= self.bottom:
            return
        
        self.stdscr.addstr(y + 1, x + 1, self._truncate_string(text, self.right - x - 1))
    
    def add_text_xy(self, x, y, text):
        self.cursor_x = x
        self.cursor_y = y
        self.add_text(text)
        
    def clear(self):
        for y in range(0, self.bottom - self.top - 1):
            self.add_text_xy(0, y, self.right * " ");
        
        self.cursor_x, self.cursor_y = 0, 0

    def newline(self):
        self.cursor_x = 0
        self.cursor_y = self.cursor_y + 1 if self.cursor_y < self.bottom - self.top - 2 else self.cursor_y
    
    def fill_with_list(self, lst):
        self.clear()
        frame_lines = self.bottom - self.top
        if frame_lines < len(lst):
            for index, item in enumerate(lst[-frame_lines:]):#, start=self.top):
                self.add_text_xy(0, index, item)
        else:
            for index, item in enumerate(lst[-frame_lines:]):#, start=self.top):
                self.add_text_xy(0, index, item)
    
    def _truncate_string(self, string, length):
        if len(string) <= length:
            return string
        else:
            return string[:length]
    