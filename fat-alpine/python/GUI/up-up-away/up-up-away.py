import pygame
import ast
import sys
import os
from PIL import Image, ImageFont, ImageDraw

parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.append(parent_dir)

from c64colors import get_color

LIGHT_BLUE = ast.literal_eval(get_color("light blue")['rgb'])
BLUE = ast.literal_eval(get_color("blue")['rgb'])

window_width, window_height = 320, 200


def load_hot_air_baloon():
    gif_image = Image.open("uua.gif")
    gif_image = gif_image.convert("RGB")
    gif_image_width, gif_image_height = gif_image.size
    
    return gif_image_width, gif_image_height, pygame.image.fromstring(gif_image.tobytes(), gif_image.size, gif_image.mode)    

def write_out_banner(window):
    font_path = os.path.join("..", "C64_Pro_Mono-STYLE.ttf")
    caption_font = ImageFont.truetype(font_path, 8)
    caption_text = "\n    **** COMMODORE 64 BASIC V2 ****\n\n 64K RAM SYSTEM  38911 BASIC BYTES FREE\n\nREADY"
    caption_text_color = LIGHT_BLUE
    caption_text_background = BLUE
    caption_text_height = 64

    caption_image = Image.new("RGB", (window_width, caption_text_height), caption_text_background)
    draw = ImageDraw.Draw(caption_image)
    draw.text((0, 0), caption_text, font=caption_font, fill=caption_text_color)

    caption_surface = pygame.image.fromstring(caption_image.tobytes(), caption_image.size, caption_image.mode)
    window.blit(caption_surface, (0, 0))    

def main():
    pygame.init()        
    
    window = pygame.display.set_mode((window_width, window_height))
    pygame.display.set_caption("UP UP AWAY - C64")
    
    gif_image_width, gif_image_height, gif_data = load_hot_air_baloon()
    
    sprites = [
        {"x": 100, "y": 100, "velocity_x": 1, "velocity_y": 1}
    ]
    
    running = True
    clock = pygame.time.Clock()
    
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
    
        for obj in sprites:
            obj["x"] += obj["velocity_x"]
            obj["y"] += obj["velocity_y"]
    
            if obj["x"] <= 0 or obj["x"] >= window_width - gif_image_width or obj["y"] <= 0 or obj["y"] >= window_height - gif_image_height:
                obj["x"] = 0
                obj["y"] = 0
            
    
        window.fill(BLUE)
    
        write_out_banner(window)
        
        for obj in sprites:
            window.blit(gif_data, (obj["x"], obj["y"]))
            
        pygame.display.update()
    
        clock.tick(60)
    
    pygame.quit()


if __name__ == '__main__':
    main()
    