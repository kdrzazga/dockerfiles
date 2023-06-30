import curses

class Frame:
    def __init__(self, stdscr, left, top, right, bottom, color):
        self.stdscr = stdscr
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
        self.color = color
        self._setup_screen()

    def _setup_screen(self):
        curses.curs_set(0)
        curses.start_color()
        curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)
        curses.init_pair(2, curses.COLOR_WHITE, curses.COLOR_BLACK)
        curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)

    def draw(self):
        stdscr = self.stdscr
        top, left, right, bottom = self.top, self.left, self.right, self.bottom
        color = self.color

        stdscr.addstr(top, left, "+" + "-" * (right - left - 1) + "+", curses.color_pair(color))
        for row in range(top + 1, bottom):
            stdscr.addstr(row, left, "|", curses.color_pair(color))
            stdscr.addstr(row, right, "|", curses.color_pair(color))
        stdscr.addstr(bottom, left, "+" + "-" * (right - left - 1) + "+", curses.color_pair(color))
