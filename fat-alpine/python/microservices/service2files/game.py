import logging
import msvcrt
import os

from gamemap import get_map
from drawer import draw
from player import Player
from city import City

class Game:
    
    def __init__(self):
        self.player = Player(35, 25)
        self.cities = []
    
    def move(self, new_x, new_y):
        logging.info('Move to (%d, %d)', new_x, new_y)
        
        try:
            if get_map()[new_x][new_y] != 'sea' and new_x >=0 and new_y >=0:
                self.player.x, self.player.y = new_x, new_y
                return True
            else:
                logging.warning("Water or edge of area")
        except Exception:
            logging.error("Wrong move")  
        return False
        
    
    def help(self):
        return "PYVILIZATION - Civilization in Python\n\nq - quit game\nh - displays this help\n" \
            + "\n\nPress any key to continue"
        
    
    def found_city(self, name):
        new_city = City(name, self.player, self.player.x, self.player.y)
        self.cities.append(new_city)
        
    def get_cities(self):
        return self.cities
    