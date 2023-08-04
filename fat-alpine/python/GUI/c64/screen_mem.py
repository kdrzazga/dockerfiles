import logging

class TextScreenMemory:

    def __init__(self):
        self.sizeX = 40
        self.sizeX = 25
        self.mem = deque(maxlen = self.sizeX * self.sizeY)
        self.start_address = 1024

    def read_value(self, index):
        if index < 1024 or index > 2048:
            logging.error("Wrong index " + index + ". Should be between 1024 and 2048.")
            return -1
        else:
            return self.mem[index]
    
    def set_value(self, value, index):
        pass
    
    def reset(self):
        pass
   
    def _check_value(self, value):
        pass
    