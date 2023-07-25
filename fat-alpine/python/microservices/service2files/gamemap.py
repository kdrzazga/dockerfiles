import random
import heapq


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
        
        self.island(self.sizeX // 3 + 2, self.sizeY //2 + 8, self.sizeX // 3, 6 * self.sizeY//5)
        self.island(self.sizeX // 3 + 2, int(2 * self.sizeY/3) + 5, self.sizeX // 3, self.sizeY // 3)
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
 
    def find_route(self, x1, y1, x2, y2):#Dijkstra algorithm
        heap = [(0, x1, y1)]
        visited = set()
        
        while heap:
            total_cost, x, y = heapq.heappop(heap)
            
            if x == x2 and y == y2:
                return total_cost
            
            if (x, y) in visited:
                continue
            
            visited.add((x, y))
            
            for nx, ny in self.get_neighbors(x, y):
                cost_to_move = self.get_movement_cost(nx, ny)
                heapq.heappush(heap, (total_cost + cost_to_move, nx, ny))
        
        return None

    def get_neighbors(self, x, y):
        neighbors = []
        if x > 0:
            neighbors.append((x - 1, y))
        if x < self.sizeX - 1:
            neighbors.append((x + 1, y))
        if y > 0:
            neighbors.append((x, y - 1))
        if y < self.sizeY - 1:
            neighbors.append((x, y + 1))
        return neighbors
        
    def get_movement_cost(self, x, y):
        cost = {"meadow" : 2, "mountain": 7, "desert" : 3, "snow" : 3, "river" : 2, "sea" : 9999, "city" : 1}

        result = cost[self.map[x][y]] if x >= 0 and y >= 0 and x < self.sizeX and y < self.sizeY else -1
        
        return result

    def get_map(self):
        return self.map

gamemap = GameMap()
    