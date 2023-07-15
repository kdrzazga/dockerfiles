import pygame
import sys

pygame.init()

window_width, window_height = 800, 600
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Tower Defense")

BLACK = (0, 0, 0)
WHITE = (255, 255, 255)

clock = pygame.time.Clock()

maze_coordinates = [
    [(100, 100), (700, 100)],
    [(700, 100), (700, 250)],
    [(700, 250), (200, 250)],
    [(200, 250), (200, 400)],
    [(200, 400), (700, 400)],
    [(700, 400), (700, 500)],
    [(700, 500), (100, 500)],
    [(100, 500), (100, 100)]
]


turret_coordinates = [
    (200, 200),
    (400, 215),
    (600, 440)
]

def draw_maze():
    for coords in maze_coordinates:
        pygame.draw.line(window, WHITE, coords[0], coords[1], 10)

def draw_turrets():
    for coords in turret_coordinates:
        pygame.draw.circle(window, WHITE, coords, 20)


def game_loop():
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

        window.fill(BLACK)

        draw_maze()
        draw_turrets()

        pygame.display.flip()

        clock.tick(60)

game_loop()
