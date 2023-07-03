import curses, sys, time, logging

from datetime import datetime
from memory import poke, print_memory, low_mem, hi_mem


def analyze_command(stdscr, command, mainFrame, commandFrame, infoFrame):
    
    if command != '':
        logging.info(f"Command: %s", command)
    
    try:
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
            
        elif command.startswith("printz "):
            argument = command[command.index(' ') + 1: len(command)]
            printz(low_mem, int(argument), mainFrame, infoFrame)
            
        elif command.startswith("poke ") or command.startswith("mov "):
            argument1 = command[command.index(' ') + 1: command.index(',')]
            argument2 = command[command.index(',') + 1: len(command)]
            poke(low_mem, int(argument1), int(argument2), mainFrame, infoFrame)
            
        elif command == "mem" or command == "memory":
            print_memory(low_mem, mainFrame)
    
    except Exception as e:
        logging.error(f"Error occured: {str(e)}")
    

def clear(mainFrame):
    mainFrame.clear()


def help(stdscr, mainFrame):
    mainFrame.clear()
    mainFrame.add_text("HELP:")
    mainFrame.add_text_xy(0, 1, "Commands:")
    mainFrame.add_text_xy(0, 2, "help, time, date, clear/cls, mem/memory, exit/quit")
    mainFrame.add_text_xy(0, 3, "load sword/jail")
    mainFrame.add_text_xy(0, 4, "poke/mov 1,255")
    mainFrame.add_text_xy(0, 5, "printz 30 - prints chars according to their ASCII code, starting from")
    mainFrame.add_text_xy(0, 6, " address 30, till meeting value 0 (zero-terminated string)")
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
    
    
def printz(mem_bank, argument, mainFrame, infoFrame):
    char_tab = []
    
    logging.info(f"Start address: %s", argument)
     
    while mem_bank[argument] != 0 and argument < len(mem_bank):
        char_tab.append(chr(mem_bank[argument]))
        argument += 1        
    
    caption = "".join(char_tab)
    
    if len(caption) > 0:
        mainFrame.newline
        mainFrame.add_text(caption)
        
    logging.info(f"End address: %s", argument)
    logging.info(f"Read string %s", )
    