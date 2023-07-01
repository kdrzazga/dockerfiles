import curses

def main(stdscr):
    # Initialize curses
    curses.curs_set(0)
    stdscr.nodelay(1)

    # Get the dimensions of the screen
    height, width = stdscr.getmaxyx()

    # Calculate the dimensions for the frames
    frame1_height = height * 3 // 4
    frame1_width = width

    frame2_height = height // 4
    frame2_width = width * 3 // 4

    frame3_height = height // 4
    frame3_width = width // 4

    # Create the frames
    frame1 = stdscr.subwin(frame1_height, frame1_width, 0, 0)
    frame2 = stdscr.subwin(frame2_height, frame2_width, frame1_height, 0)
    frame3 = stdscr.subwin(frame3_height, frame3_width, frame1_height, frame2_width)

    # Initialize text buffer variables
    buffer1 = []
    buffer2 = []
    buffer3 = []

    # Function to append text to the buffer
    def appendText(text, frameNumber):
        nonlocal buffer1, buffer2, buffer3

        if frameNumber == 1:
            buffer1.extend(text.split('\n'))
        elif frameNumber == 2:
            buffer2.extend(text.split('\n'))
        elif frameNumber == 3:
            buffer3.extend(text.split('\n'))

    # Draw the frames
    frame1.box()
    frame2.box()
    frame3.box()

    # Main loop
    while True:
        # Refresh the frames
        frame1.clear()
        frame2.clear()
        frame3.clear()

        frame1.box()
        frame2.box()
        frame3.box()

        # Update and display the buffer content
        lines_to_display = min(frame1_height - 2, len(buffer1))
        for i, line in enumerate(buffer1[-lines_to_display:]):
            frame1.addnstr(i + 1, 1, line[:frame1_width - 2], frame1_width - 2)

        frame2.addnstr(1, 1, buffer2[-frame2_width + 2:], frame2_width - 2)
        frame3.addnstr(1, 1, buffer3[-frame3_width + 2:], frame3_width - 2)

        frame1.refresh()
        frame2.refresh()
        frame3.refresh()

        # Get user input
        key = stdscr.getch()

        # Exit the loop if 'q' is pressed
        if key == ord('q'):
            break

        # Append text based on user input
        if key == ord('1'):
            appendText("This is text for Frame 1.\nAnother line for Frame 1.\nAnd another line.\n", 1)
        elif key == ord('2'):
            appendText("This is text for Frame 2.\n", 2)
        elif key == ord('3'):
            appendText("This is text for Frame 3.\n", 3)

# Run the main function
curses.wrapper(main)
