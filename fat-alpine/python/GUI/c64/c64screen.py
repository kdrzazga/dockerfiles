import os
import sys
import ast
import pygame
from PIL import Image, ImageDraw, ImageFont

from screen_mem import TextScreenMemory
from factory import create_start_screen
from sprites import Sprite

current_directory = os.path.dirname(os.path.realpath(__file__))
parent_directory = os.path.abspath(os.path.join(current_directory, ".."))
sys.path.append(parent_directory)

from c64colors import get_color

LIGHT_BLUE = ast.literal_eval(get_color("light blue")['rgb'])
BLUE = ast.literal_eval(get_color("blue")['rgb'])

FRAME_THICKNESS = 30
WINDOW_WIDTH = 320 + 2 *FRAME_THICKNESS
WINDOW_HEIGHT = 200 + 2 * FRAME_THICKNESS

class C64Screen:
    def __init__(self, width, height):
        pygame.init()
        self.window = pygame.display.set_mode((width, height))
        pygame.display.set_caption("Commodore 64")
        icon = pygame.image.load("c64.ico")
        pygame.display.set_icon(icon)
        
        self.font_path = os.path.join("..", "C64_Pro_Mono-STYLE.ttf")
        self.caption_font = ImageFont.truetype(self.font_path, 8)

        self.caption_text_color = LIGHT_BLUE
        self.caption_text_background = BLUE

    def draw_frame(self):
        pygame.draw.rect(self.window, BLUE, (FRAME_THICKNESS, FRAME_THICKNESS, WINDOW_WIDTH - 2 * FRAME_THICKNESS, WINDOW_HEIGHT - 2 * FRAME_THICKNESS))
    
    def draw_screen(self, text_screen_memory):
        self.caption_text_height = 8 * TextScreenMemory.sizeY
        
        caption_text = ""
        for i in range(TextScreenMemory.sizeY):
            caption_text += text_screen_memory.get_row(i)
            caption_text += "\n"
        
        caption_image = Image.new("RGB", (WINDOW_WIDTH - 2 * FRAME_THICKNESS, self.caption_text_height), self.caption_text_background)
        
        draw = ImageDraw.Draw(caption_image)
        draw.text((0, 0), caption_text, font=self.caption_font, fill=self.caption_text_color)

        caption_surface = pygame.image.fromstring(caption_image.tobytes(), caption_image.size, caption_image.mode)
        self.window.blit(caption_surface, (FRAME_THICKNESS, FRAME_THICKNESS))
    
    def clear(self):
        self.draw_frame(self)
        
    def draw_sprite(self, screen, sprite):

        active_pixels = sprite.convert_to_points()
        for x, y in active_pixels:
            print(x, ",", y, end="| ")
            pygame.draw.line(screen, (255, 0, 0), (x,y), (x+1, y+1))

    def run(self):
        running = True
        while running:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    running = False

            self.window.fill(LIGHT_BLUE)
            self.draw_frame()
            screen = create_start_screen()
            self.draw_screen(screen)

            square_sprite = Sprite(100, 100, "white")
            self.draw_sprite(pygame.Surface((Sprite.width, Sprite.height)), square_sprite)
            
            pygame.display.flip()

        pygame.quit()
    

if __name__ == "__main__":
    c64_screen = C64Screen(WINDOW_WIDTH, WINDOW_HEIGHT)
    c64_screen.run()

