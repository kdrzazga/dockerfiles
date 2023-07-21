import random


class GameMap:

    def __init__(self):        
        self.tiles = ["meadow", "mountain", "desert", "snow", "river", "sea", "city"]
        self.sizeX = 70
        self.sizeY = 47
        self.map = [["sea" for _ in range(self.sizeX)] for _ in range(self.sizeY)]
    
    def generate_map(self):
        row = int(0.36 * self.sizeY)
        
        start_col = int(0.2 * self.sizeX)
        end_col = int(0.8 * self.sizeX)
    
        for col in range(start_col, end_col + 1):
            self.map[row][col] = "meadow"
            self.map[row + 1][col + 3] = "meadow"
            self.map[row + 2][col - 3] = "meadow"
            self.map[row + 12][col] = "meadow"
            self.map[row + 13][col] = "meadow"
        
        for col in range(self.sizeX):
            self.map[0][col] = "snow"
            self.map[1][col] = "snow"
            self.map[self.sizeY - 1][col] = "snow"
        
        for col in range(self.sizeX):
            if col % 10 < 8:
                self.map[2][col] = "snow"
                self.map[self.sizeY - 2][col] = "snow"
            else:
                self.map[2][col] = "sea"
                self.map[self.sizeY - 2][col] = "sea"
        
        for col in range(self.sizeX):
            if col % 10 < 2 or col % 10 > 5:
                self.map[3][col] = "sea"
                self.map[self.sizeY - 3][col] = "sea"
            else:
                self.map[3][col] = "snow"
                self.map[self.sizeY - 3][col] = "snow"
        
        for col in range(self.sizeX):
            if col % 10 < 2 or col % 10 > 4:
                self.map[4][col] = "sea"
                self.map[self.sizeY - 4][col] = "sea"
            else:
                self.map[4][col] = "snow"
                self.map[self.sizeY - 4][col] = "snow"
        
        snow_tiles = random.sample(range(self.sizeX), 10)
        for col in snow_tiles:
            self.map[4][col] = "snow"
            self.map[self.sizeY - 4][col] = "snow"
        
        self.island(self.sizeX // 3 + 2, int(self.sizeY/2) + 8, int(self.sizeX/3), int(6 * self.sizeY/5))
        self.island(int(self.sizeX/3) + 2, int(2 * self.sizeY/3) + 5, int(self.sizeX/3), int(self.sizeY/3))
        self.island(int(self.sizeX/3 + 6 * random.random()), int(self.sizeY/12 + 1 + 6 * random.random()), int(self.sizeX/4), int(self.sizeY/3 * random.random()))
        self.island(int(self.sizeX/3 - 6 * random.random()), int(self.sizeY/12 + 1 - 6 * random.random()), int(self.sizeX/ (4 + 3 * random.random())), int(self.sizeY/7))
        
        return self.map
    
    
    def island(self, x, y, sizeX, sizeY):
        probabilities = {
            "meadow": 0.6,
            "desert": 0.1,
            "mountain": 0.2,
            "river": 0.1
        }
    
        for i in range(x - sizeX // 2, x + sizeX // 2 + 1):
            for j in range(y - sizeY // 2, y + sizeY // 2 + 1):
                if ((i - x) / (sizeX / 2)) ** 2 + ((j - y) / (sizeY / 2)) ** 2 <= 1:
                    rand_num = random.random()
                    cumulative_prob = 0
                    for tile, prob in probabilities.items():
                        cumulative_prob += prob
                        if rand_num <= cumulative_prob:
                            self.map[i][j] = tile
                            break

    
    
    def get_map(self):
        return self.map
    

gamemap = GameMap()
    