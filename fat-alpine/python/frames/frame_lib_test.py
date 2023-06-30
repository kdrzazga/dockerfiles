import curses
import unittest

from frame_lib import Frame

class FrameTestCase(unittest.TestCase):
    def setUp(self):
        self.stdscr = curses.initscr()
        curses.noecho()
        curses.cbreak()
        self.stdscr.keypad(True)

    def tearDown(self):
        curses.nocbreak()
        self.stdscr.keypad(False)
        curses.echo()
        curses.endwin()

    def test_draw_frame(self):
        stdscr = self.stdscr
        left, top, right, bottom = 1, 1, 10, 5
        color = 1

        frame = Frame(stdscr, left, top, right, bottom, color)
        frame.draw()

        # Assert top frame line
        expected_top_line = "+" + "-" * (right - left - 1) + "+"
        self.assertEqual(stdscr.instr(top, left, right - left + 1), expected_top_line)

        # Assert vertical frame lines
        for row in range(top + 1, bottom):
            self.assertEqual(stdscr.instr(row, left, 1), "|")
            self.assertEqual(stdscr.instr(row, right, 1), "|")

        # Assert bottom frame line
        expected_bottom_line = "+" + "-" * (right - left - 1) + "+"
        self.assertEqual(stdscr.instr(bottom, left, right - left + 1), expected_bottom_line)

if __name__ == "__main__":
    unittest.main()
