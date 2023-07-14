import logging
import msvcrt
import os

from gamemap import generate_map, get_map
from drawer import draw
from player import Player


def move(player, new_x, new_y):
    logging.info('Move to (%d, %d)', new_x, new_y)
    
    try:
        if get_map()[new_x][new_y] != 'sea' and new_x >=0 and new_y >=0:
            player.x, player.y = new_x, new_y
            return True
        else:
            logging.warning("Water or edge of area")
    except Exception:
        logging.error("Wrong move")  
    return False
    

def help():
    return "PYVILIZATION - Civilization in Python\n\nq - quit game\nh - displays this help\n" \
        + "\n\nPress any key to continue"
    

def found_city(name):
    pass
