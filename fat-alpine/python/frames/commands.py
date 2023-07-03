import curses, sys, time, logging

from datetime import datetime

def analyze_command(stdscr, command, mainFrame, commandFrame, infoFrame):
    
    if command != '':
        logging.info(f"Command: %s", command)
    
    if command == "clear" or command == "cls":
        clear(mainFrame)

    elif command == "exit" or command == "quit":
        exit_app(mainFrame)
    
    elif command == "help":
        help(stdscr, mainFrame)
        
    elif command == "time":
        time(mainFrame) 
        
    elif command == "date":
        date(mainFrame)
        
    elif command.startswith("load "):
        argument = command[command.index(' ') + 1: len(command)]
        load(argument, mainFrame, infoFrame)
    

def clear(mainFrame):
    mainFrame.clear()


def help(stdscr, mainFrame):
    mainFrame.clear()
    mainFrame.add_text("HELP:")
    mainFrame.add_text_xy(0, 1, "Commands:")
    mainFrame.add_text_xy(0, 2, "help, time, date, clear/cls, exit/quit")
    mainFrame.add_text_xy(0, 3, "load sword/jail")
    mainFrame.add_text_xy(0, -1, "Press any key to continue ...    ")
    stdscr.getch()
    mainFrame.clear()
    
    
def load(argument, mainFrame, infoFrame):
    logging.info(f"Loading %s", argument)
    file_path = "pics/" + argument + ".txt"

    try:
        with open(file_path, "r") as file:
            content = file.read()
            lines = content.splitlines()
            for i, line in enumerate(lines):
                mainFrame.add_text_xy(0, i, line + "   ")
            
    except FileNotFoundError:
        logging.error(f"File '{file_path}' not found.")
    except IOError:
        logging.error(f"Error reading file '{file_path}'.")


def time(mainFrame):
    current_time = datetime.now().strftime("%H:%M:%S")
    _write_date_time(mainFrame, current_time)


def date(mainFrame):
    today = datetime.now().strftime("%Y-%m-%d")
    _write_date_time(mainFrame, today)    


def exit_app(mainFrame):
    logging.info("BYE !")
    sys.exit(0)


def _write_date_time(mainFrame, current_time):
    logging.info(f"Current time: %s", current_time)
    formatted_time = f"{current_time}    "
    mainFrame.newline()
    mainFrame.add_text(formatted_time)
    