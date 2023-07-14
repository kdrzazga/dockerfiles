import random

tiles = ["meadow", "mountain", "desert", "snow", "river", "sea", "city"]
sizeX = 70
sizeY = 47
map = [["sea" for _ in range(sizeX)] for _ in range(sizeY)]

def generate_map():
    row = int(0.36 * sizeY)
    
    start_col = int(0.2 * sizeX)
    end_col = int(0.8 * sizeX)

    for col in range(start_col, end_col + 1):
        map[row][col] = "meadow"
        map[row + 1][col + 3] = "meadow"
        map[row + 2][col - 3] = "meadow"
        map[row + 12][col] = "meadow"
        map[row + 13][col] = "meadow"
    
    for col in range(sizeX):
        map[0][col] = "snow"
        map[1][col] = "snow"
        map[sizeY - 1][col] = "snow"
    
    for col in range(sizeX):
        if col % 10 < 8:
            map[2][col] = "snow"
            map[sizeY - 2][col] = "snow"
        else:
            map[2][col] = "sea"
            map[sizeY - 2][col] = "sea"
    
    for col in range(sizeX):
        if col % 10 < 2 or col % 10 > 5:
            map[3][col] = "sea"
            map[sizeY - 3][col] = "sea"
        else:
            map[3][col] = "snow"
            map[sizeY - 3][col] = "snow"
    
    for col in range(sizeX):
        if col % 10 < 2 or col % 10 > 4:
            map[4][col] = "sea"
            map[sizeY - 4][col] = "sea"
        else:
            map[4][col] = "snow"
            map[sizeY - 4][col] = "snow"
    
    snow_tiles = random.sample(range(sizeX), 10)
    for col in snow_tiles:
        map[4][col] = "snow"
        map[sizeY - 4][col] = "snow"
    
    island(map, int(sizeX/3) + 2, int(sizeY/2) + 8, int(sizeX/6), int(6 * sizeY/10))
    island(map, int(sizeX/3) + 2, int(2 * sizeY/3) + 5, int(sizeX/6), int(sizeY/5))
    island(map, int(sizeX/3 + 6 * random.random()), int(sizeY/12 + 1 + 6 * random.random()), int(sizeX/4), int(sizeY/3 * random.random()))
    island(map, int(sizeX/3 - 6 * random.random()), int(sizeY/12 + 1 - 6 * random.random()), int(sizeX/ (4 + 3 * random.random())), int(sizeY/7))
    
    return map


def island(map, x, y, sizeX, sizeY):
    probabilities = {
        "meadow": 0.6,
        "desert": 0.1,
        "mountain": 0.2,
        "river": 0.1
    }
    
    for i in range(x - sizeX, x + sizeX + 1):
        for j in range(y - sizeY, y + sizeY + 1):
            if ((i - x) / sizeX) ** 2 + ((j - y) / sizeY) ** 2 <= 1:
                rand_num = random.random()
                cumulative_prob = 0
                for tile, prob in probabilities.items():
                    cumulative_prob += prob
                    if rand_num <= cumulative_prob:
                        map[i][j] = tile
                        break


def get_map():
    return map


generate_map()
get_map()
