import os

current_directory = os.path.dirname(os.path.realpath(__file__))
parent_directory = os.path.abspath(os.path.join(current_directory, ".."))
sys.path.append(parent_directory)

from c64colors import get_color

class Sprite():

    def __init__(self, x, y, color):
        self.x = x
        self.y = y
        self.color = get_color[color]
        
    def convert_to_points(self):
        