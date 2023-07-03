import curses, sys, time, logging

def analyze_command(stdscr, command, mainFrame, commandFrame, infoFrame):
    
    if command != '':
        logging.info(f"Command: %s", command)
    
    if command == "clear" or command == "cls":
        clear(mainFrame)

    elif command == "exit" or command == "quit":
        exit_app(mainFrame)
    
    elif command == "help":
        help(stdscr, mainFrame)
    

def clear(mainFrame):
    mainFrame.clear()


def help(stdscr, mainFrame):
    mainFrame.clear()
    mainFrame.add_text("HELP:")
    mainFrame.add_text_xy(0, 1, "Commands:")
    mainFrame.add_text_xy(0, 2, "help, clear/cls, exit/quit")
    mainFrame.add_text_xy(0, -1, "Press any key to continue ...    ")
    stdscr.getch()
    mainFrame.clear()
    

def exit_app(mainFrame):
    logging.info("BYE !")
    sys.exit(0)

