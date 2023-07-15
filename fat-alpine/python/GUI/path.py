import pygame
import random

WIDTH = 800
HEIGHT = 600

pygame.init()
screen = pygame.display.set_mode((WIDTH, HEIGHT))
clock = pygame.time.Clock()

WHITE = (255, 255, 255)
BLUE = (0, 0, 255)

start_x = WIDTH // 2
start_y = 0
cur_x = start_x
cur_y = start_y

path_width = WIDTH // 10

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    for i in range(-path_width // 2, path_width // 2 + 1):
        if 0 <= cur_x + i < WIDTH and 0 <= cur_y < HEIGHT:
            screen.set_at((cur_x + i, cur_y), BLUE)

    movement = random.randint(-12, 12)

    cur_x += movement
    cur_y += 1

    cur_x = max(0, min(cur_x, WIDTH - 1))
    cur_y = max(0, min(cur_y, HEIGHT - 1))

    if cur_y >= HEIGHT:
        cur_x = start_x
        cur_y = start_y

        screen.fill(WHITE)

    pygame.display.flip()
    clock.tick(60)

pygame.quit()
