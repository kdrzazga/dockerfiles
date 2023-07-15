import colorama
from colorama import Fore, Style

def draw(map, player):
    colorama.init()
    
    symbols = {
        "sea": Fore.LIGHTBLUE_EX + "~",
        "meadow": Fore.GREEN + ".",
        "mountain": Fore.LIGHTBLACK_EX + "^",
        "desert": Fore.LIGHTYELLOW_EX + "d",
        "snow": Fore.WHITE + "'",
        "river": Fore.BLUE + "r",
        "city": Fore.RED + "C"
    }
    
    for x in range(len(map)):
        for y in range(len(map[x])):
            if x == player.x and y == player.y:
                print('X', end=" ")
            else:
                tile = map[x][y]
                print(symbols[tile], end=" ")
        print(Style.RESET_ALL)

