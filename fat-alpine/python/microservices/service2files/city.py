class City:

    city_count = 0
    
    def __init__(self, name, owner, x, y):
        self.id = City.city_count
        City.city_count += 1
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

    def to_string(self):
        return str(self.id) + '. ' + self.name + '[' + str(self.level) + ']' + ' position(' + str(self.x) + ' ,' + str(self.y) + ') ' + 'ruler: ' + self.owner.name + ' [' + ', '.join(self.buildings) + ']'
