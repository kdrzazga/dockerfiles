import logging
import msvcrt
import os

from gamemap import gamemap
from drawer import draw
from player import Player
from city import City

class Game:
    
    def __init__(self):
        self.turn = 1
        self.player = Player(30, 20)
        self.cities = []
    
    def move(self, new_x, new_y):
        logging.info('Move to (%d, %d)', new_x, new_y)
        
        try:
            if gamemap.get_map()[new_x][new_y] != 'sea' and new_x >=0 and new_y >=0:
                self.player.x, self.player.y = new_x, new_y
                return True
            else:
                logging.warning("Water or edge of area")
        except Exception:
            logging.error("Wrong move")  
        return False
    
    def end_turn(self):
        self.turn += 1
    
    def found_city(self, name):
        if self._checkCell(self.player.x, self.player.y):
            new_city = City(name, self.player, self.player.x, self.player.y)
            self.cities.append(new_city)
        
    def get_cities(self):
        return self.cities
        
    def get_player_cities(self, player_name):
        return [city for city in self.cities if city.owner.name == player_name]
    
    def help(self):
        return "PYVILIZATION - Civilization in Python\n\nq - quit game\nh - displays this help\n" \
            + "\n\nPress any key to continue"    
    
    def _checkCell(self, x, y):
        cell = gamemap.get_map()[x][y]
        logging.info('Terrain is {cell}')
        for city in self.cities:
            if city.x == x and city.y == y:
                logging.warning('Cell ({x},{y}) already occupied by a city.')
                return False
                
        return cell != 'mountain' and cell != 'sea'
