import logging
import msvcrt
import os

from map import generate_map, get_map
from drawer import draw
from player import Player

player = Player(35, 25)

def clear_screen():
    if os.name == 'nt':
        _ = os.system('cls')
    else:
        _ = os.system('clear')


def process_move(new_x, new_y):
    logging.info('Move to (%d, %d)', new_x, new_y)
    
    try:
        if get_map()[new_x][new_y] != 'sea':
            player.x, player.y = new_x, new_y
        else:
            logging.warning("You cannot swim")
    except Exception:
        logging.error("Wrong move")
    
    clear_screen()
    draw(get_map(), player)
    
    
def main():  
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
    
    generate_map()
    draw(get_map(), player)
    
    key = b''
    
    while key != b'q':
        key = msvcrt.getch()
    
        if key == b'7':
            process_move(player.x - 1, player.y - 1)
    
        elif key == b'8' or key == b'w':
            process_move(player.x, player.y - 1)
    
        elif key == b'9':
            process_move(player.x + 1, player.y - 1)
    
        elif key == b'4' or key == b'a':
            process_move(player.x - 1, player.y)
    
        elif key == b'6' or key == b'd':
            process_move(player.x + 1, player.y)
    
        elif key == b'1':
            process_move(player.x - 1, player.y + 1)
    
        elif key == b'2' or key == b's':
            process_move(player.x, player.y + 1)
    
        elif key == b'3':
            process_move(player.x + 1, player.y + 1)
            

if __name__ == '__main__':
    main()
  