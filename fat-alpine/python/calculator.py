import curses

def display_calculator(stdscr, expression, result):
    stdscr.clear()
    stdscr.addstr(0, 0, "+" + "-"*27 + "+", curses.color_pair(1))
    stdscr.addstr(1, 0, f"| {expression:^25} |")
    stdscr.addstr(2, 0, "+" + "-"*27 + "+", curses.color_pair(1))
    stdscr.addstr(3, 0, f"| {result:^25} |")
    stdscr.addstr(4, 0, "+" + "-"*27 + "+", curses.color_pair(1))
    stdscr.addstr(5, 1, "   1     2       3     /   ", curses.color_pair(2))
    stdscr.addstr(6, 1, "   4     5       6     *   ")
    stdscr.addstr(7, 1, "   7     8       9     +   ")
    stdscr.addstr(8, 1, "   .     0       AC    -   ")
    
    for i in [1, 3]:
        stdscr.addstr(i, 0, "|", curses.color_pair(1))
        stdscr.addstr(i, 27+1, "|", curses.color_pair(1))
        
    for i in range(5, 9):
        stdscr.addstr(i, 0, "|", curses.color_pair(1))
        stdscr.addstr(i, 27+1, "|", curses.color_pair(1))
    
    stdscr.addstr(9, 0, "+" + "-"*27 + "+", curses.color_pair(1))
    

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
    # Set up the screen
    curses.curs_set(0)
    stdscr.nodelay(1)
    stdscr.timeout(100)
    
    curses.start_color()
    curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_WHITE, curses.COLOR_BLACK)  
    curses.init_pair(3, curses.COLOR_CYAN, curses.COLOR_BLACK)   

    expression = ""
    result = ""

    # Main program loop
    while True:
        # Display the calculator frame
        display_calculator(stdscr, expression, result)
        display_info(stdscr)

        # Get user input
        key = stdscr.getch()

        if key == 10 or key == ord('='):  # Enter key
            # User pressed Enter, perform calculation
            result = calculate(expression)
            expression = ""

        elif key == ord('q') or key == ord('Q'):
            # User pressed 'q', quit the program
            break

        elif key == ord('c'):
            # User pressed 'c', clear the expression
            expression = ""

        elif key == ord('.'):
            # User pressed '.', add it to the expression
            expression += "."

        elif 48 <= key <= 57:  # Digits 0-9
            # User pressed a digit, add it to the expression
            expression += chr(key)

        elif key in [ord('+'), ord('-'), ord('*'), ord('/')]:
            # User pressed an operator, add it to the expression
            expression += chr(key)

        # Display the result
        display_calculator(stdscr, expression, result)

if __name__ == '__main__':
    curses.wrapper(main)
