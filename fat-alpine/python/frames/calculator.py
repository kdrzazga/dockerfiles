import curses

from frame_lib import Frame


def display_calculator(stdscr, expression, result):
    stdscr.clear()
    
    stdscr.addstr(1, 1, f" {expression:^25} ")
    stdscr.addstr(3, 1, f" {result:^25} ")
    
    stdscr.addstr(5, 1, "   1     2       3     /   ", curses.color_pair(2))
    stdscr.addstr(6, 1, "   4     5       6     *   ")
    stdscr.addstr(7, 1, "   7     8       9     +   ")
    stdscr.addstr(8, 1, "   .     0       AC    -   ")
    
    frame_expression.draw()
    frame_result.draw()
    frame_keyboard.draw()

    
def calculate(expression):
    try:
        result = eval(expression)
        return result
    except:
        return 'Error: Invalid expression'


def display_info(stdscr):
    stdscr.addstr(19, 1, "Press q to exit")
    stdscr.addstr(19, 7, "q", curses.color_pair(3))


def main(stdscr):
    global frame_expression
    global frame_result
    global frame_keyboard

    frame_expression = Frame(stdscr, 0, 0, 28, 2, 1)
    frame_result = Frame(stdscr, 0, 2, 28, 4, 1)
    frame_keyboard = Frame(stdscr, 0, 4, 28, 9, 1)

    expression = ""
    result = ""

    # Main program loop
    while True:
        display_calculator(stdscr, expression, result)
        display_info(stdscr)

        key = stdscr.getch()

        if key == 10 or key == ord('='):
            result = calculate(expression)
            expression = ""

        elif key == ord('q') or key == ord('Q'):
            break

        elif key == ord('c'):
            expression = ""

        elif key == ord('.'):
            expression += "."

        elif 48 <= key <= 57: 
            expression += chr(key)

        elif key in [ord('+'), ord('-'), ord('*'), ord('/')]:
            expression += chr(key)

        display_calculator(stdscr, expression, result)


if __name__ == '__main__':
    curses.wrapper(main)
