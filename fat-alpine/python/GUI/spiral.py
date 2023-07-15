import pygame
import math

pygame.init()

window_width = 800
window_height = 600
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Pygame Spiral")

clock = pygame.time.Clock()

start_radius = 10
angle_increment = 0.1
distance_increment = 0.1
color = (128, 128, 0)
center_x = window_width // 2
center_y = window_height // 2

running = True
angle = 0
distance = start_radius
prev_x = center_x
prev_y = center_y
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    x = center_x + distance * math.cos(angle)
    y = center_y + distance * math.sin(angle)

    pygame.draw.line(window, color, (int(prev_x), int(prev_y)), (int(x), int(y)))

    prev_x = x
    prev_y = y

    angle += angle_increment
    distance += distance_increment
    
    pygame.display.update()

    clock.tick(178)

pygame.quit()
