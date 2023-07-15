class City:
    
    def __init__(self, name, x, y):
        self.name = name
        self.x = x
        self.y = y
        self.level = 1
        self.buildings = ['palace']
    
    def expand(self):
        self.level += 1
    