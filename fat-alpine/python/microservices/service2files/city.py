class City:
    
    def __init__(self, name, owner, x, y):
        self.name = name
        self.owner = owner
        self.x = x
        self.y = y
        self.level = 1
        self.buildings = ['palace']
    
    def expand(self):
        self.level += 1
        
    def gets_conquered(self, new_owner):
        self.level -= 1
        self.owner = new_owner
