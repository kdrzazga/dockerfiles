import sys
import os

current_directory = os.path.dirname(os.path.realpath(__file__))
parent_directory = os.path.abspath(os.path.join(current_directory, ".."))
sys.path.append(parent_directory)

from c64colors import get_color

class Sprite():

    width = 24
    height = 21

    def __init__(self, x, y, color):
        self.x = x
        self.y = y
        self.color = get_color(color)
        self.data = [0b11111111] * (3*21)
        
    def convert_to_points(self):
        active_pixels = []
        for row_index, row_data in enumerate(self.data):
            for col_index in range(Sprite.width):
                bit = (row_data >> (Sprite.width - 1 - col_index)) & 1
                if bit:  # If the bit is 1 (color on), add the pixel position to the active_pixels list
                    active_pixels.append((self.x + col_index, self.y + row_index))
        return active_pixels
