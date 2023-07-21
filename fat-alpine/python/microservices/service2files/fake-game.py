import logging
import msvcrt
import os

from gamemap import gamemap
from game import Game
from drawer import draw
from player import Player

game = Game()

def clear_screen():
    if os.name == 'nt':
        _ = os.system('cls')
    else:
        _ = os.system('clear')

def process_move(new_x, new_y):
    clear_screen()
    game.move(new_x, new_y)    
    draw(gamemap.get_map(), game.player)

    
def main():  
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
    
    gamemap.generate_map()
    draw(gamemap.get_map(), game.player)
    
    key = b''
    
    while key != b'q':
        key = msvcrt.getch()
    
        if key == b'7':
            process_move(game.player.x - 1, game.player.y - 1)
    
        elif key == b'4' or key == b'a':
            process_move(game.player.x, game.player.y - 1)
    
        elif key == b'1':
            process_move(game.player.x + 1, game.player.y - 1)
    
        elif key == b'8' or key == b'w':
            process_move(game.player.x - 1, game.player.y)
    
        elif key == b'2' or key == b's':
            process_move(game.player.x + 1, game.player.y)
    
        elif key == b'9':
            process_move(game.player.x - 1, game.player.y + 1)
    
        elif key == b'6' or key == b'd':
            process_move(game.player.x, game.player.y + 1)
    
        elif key == b'3':
            process_move(game.player.x + 1, game.player.y + 1)
            
        elif key == b'h':
            clear_screen()
            print(help())
            msvcrt.getch()
            clear_screen()
            draw(gamemap.get_map(), player)
        
        elif key == b'f':
            found_city('Pythonville')
            

if __name__ == '__main__':
    main()
    