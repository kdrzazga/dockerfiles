import logging
import pygame
import math

pygame.init()

window_width = 800
window_height = 600
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Pygame Spiral")

clock = pygame.time.Clock()

start_radius = 10
angle_increment = 0.3
distance_increment = 0.5
color = (128, 200, 255)
center_x = 0
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
    if angle %  3.14 > 0 and angle % 3.15 < 4:
        angle_increment = -2 * angle_increment

    if angle > 2*3.14:
        angle = 0.01
    
    distance += distance_increment
    B = abs(int(255 * math.sin(angle)) - 1)
    center_x += 1
    center_y += 3.5 * math.sin(angle/10)
    color = (128, 200, B)
    
    pygame.display.update()

    clock.tick(178)

pygame.quit()
