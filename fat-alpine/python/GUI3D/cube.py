import pygame
import sys
import math

from _3d import rotate_point_x, rotate_point_y

print("Use arrow keys or WSAD to rotate the cube")
print("+ . > =   increase anim speed")
print("- , < _   decrease")
print("i o   zoom in/out")
print("r   reset")
print("e x   exit")

pygame.init()

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600

WHITE = (255, 255, 255)
BLACK = (0, 0, 0)
FPS = 60
angle_x = 0
angle_y = 0

screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Cube Animation")
clock = pygame.time.Clock()

def draw_cube(surface, angle_x, angle_y):
    vertices = [
        (100, 100, 100),
        (100, -100, 100),
        (-100, -100, 100),
        (-100, 100, 100),
        (100, 100, -100),
        (100, -100, -100),
        (-100, -100, -100),
        (-100, 100, -100),
    ]

    rotated_vertices = [rotate_point_x(*rotate_point_y(*vertex, angle_x), angle_y) for vertex in vertices]

    edges = [
        (0, 1),
        (1, 2),
        (2, 3),
        (3, 0),
        (4, 5),
        (5, 6),
        (6, 7),
        (7, 4),
        (0, 4),
        (1, 5),
        (2, 6),
        (3, 7),
    ]

    zoomed_vertices = [(int(vertex[0] * zoom_level), int(vertex[1] * zoom_level), int(vertex[2] * zoom_level))
                       for vertex in rotated_vertices]

    for edge in edges:
        start_x, start_y, start_z = zoomed_vertices[edge[0]]
        end_x, end_y, end_z = zoomed_vertices[edge[1]]
        pygame.draw.line(surface, WHITE, (start_x + SCREEN_WIDTH // 2, start_y + SCREEN_HEIGHT // 2),
                         (end_x + SCREEN_WIDTH // 2, end_y + SCREEN_HEIGHT // 2), 2)

zoom_level = 1.0
zoom_step = 0.03

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    keys = pygame.key.get_pressed()

    if keys[ord('q')] or keys[ord('x')]:
        pygame.quit()
        sys.exit()
        print("BYE !")
    if keys[pygame.K_LEFT] or keys[ord('a')]:
        angle_x -= 2
    if keys[pygame.K_RIGHT] or keys[ord('d')]:
        angle_x += 2
    if keys[pygame.K_UP] or keys[ord('w')]:
        angle_y -= 2
    if keys[pygame.K_DOWN] or keys[ord('s')]:
        angle_y += 2
    if keys[ord('=')] or keys[ord('+')] or keys[ord('.')]:
        FPS += 1
        print("FPS:", FPS)
    if keys[ord('-')] or keys[ord(',')]:
        if FPS > 1:
            FPS -= 1
            print("FPS:", FPS)
    if keys[ord('r')]:
        angle_x = 0
        angle_y = 0
        FPS = 60
        print("Resetted. FPS:", FPS)
    if keys[ord('i')]:
        zoom_level += zoom_step
        print("Zoom IN. ZOOM = ", zoom_level)
    if keys[ord('o')]:
        zoom_level -= zoom_step
        if zoom_level < 3 * zoom_step:  # Make sure zoom_level doesn't go negative
            zoom_level = 3 * zoom_step
        print("Zoom OUT. ZOOM = ", zoom_level)

    screen.fill(BLACK)
    draw_cube(screen, angle_x, angle_y)

    pygame.display.flip()
    clock.tick(FPS)