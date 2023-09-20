import logging
import pygame

from lib import Constants
from hand import Hand
from table import Table

class UI:

    def __init__(self):
        
        logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        background_path = "img/bkgnd.png"
        
        self.background_bitmap = pygame.image.load(background_path)
        self.screen = pygame.display.set_mode((Constants.WIDTH, Constants.HEIGHT))
        
        self.hand = Hand(self.screen)
        self.table = Table(self.screen)

    def draw_all(self):
        self.screen.blit(self.background_bitmap, (0, 0))
        pygame.display.update()
        
        self.hand.draw(self.read_hand())
        self.hand.draw(self.read_table())

    def run(self):
        running = True
        
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False
            
            self.draw_all()
            
            keys = pygame.key.get_pressed()
            if keys[pygame.K_ESCAPE] - keys[ord('q')] != 0:
                running = False
        

    def read_hand(self):
        return []  # TODO        

    def read_table(self):
        return []  # TODO

if __name__ == "__main__":
    
    ui = UI()
    
    pygame.init()

    ui.run()

    pygame.quit()
