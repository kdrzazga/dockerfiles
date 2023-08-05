import logging
import numpy as np

from collections import deque

class TextScreenMemory:
    sizeX = 40
    sizeY = 25

    def __init__(self):
        self.mem = np.full(TextScreenMemory.sizeX * TextScreenMemory.sizeY, ' ')
        self.start_address = 1024
        

    def read_value(self, index):
        if index < 1024 or index > 2048:
            logging.error("Wrong index " + index + ". Should be between 1024 and 2048.")
            return -1
        else:
            return self.mem[index - 1024]

    def set_value(self, value, index):
        logging.error("not implemented")

    def set_row(self, line_index, text):
        start_index = line_index * TextScreenMemory.sizeX
        for i in range(0, len(text)):
            self.mem[start_index + i] = text[i]

    def reset(self):
        logging.error("not implemented")

    def _check_value(self, value):
        logging.error("not implemented")
