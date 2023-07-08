import pygame
from PIL import Image

pygame.init()

window_width, window_height = 320, 200
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Commodore 64 UP UP AWAY")

gif_image = Image.open("uua.gif")
gif_image = gif_image.convert("RGB")
gif_image_width, gif_image_height = gif_image.size
gif_data = pygame.image.fromstring(gif_image.tobytes(), gif_image.size, gif_image.mode)

objects = [
    {"x": 100, "y": 100, "velocity_x": 1, "velocity_y": 1}
]

running = True
clock = pygame.time.Clock()

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    for obj in objects:
        obj["x"] += obj["velocity_x"]
        obj["y"] += obj["velocity_y"]

        if obj["x"] <= 0 or obj["x"] >= window_width - gif_image_width or obj["y"] <= 0 or obj["y"] >= window_height - gif_image_height:
            obj["x"] = 0
            obj["y"] = 0
        

    window.fill((51, 43, 204))

    for obj in objects:
        window.blit(gif_data, (obj["x"], obj["y"]))

    pygame.display.update()

    clock.tick(60)

pygame.quit()
