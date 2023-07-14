import colorama
from colorama import Fore, Style

def draw(map):
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
    
    for row in map:
        for tile in row:
            print(symbols[tile], end=" ")
        print(Style.RESET_ALL)

