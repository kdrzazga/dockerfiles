import pygame
import sys
import math

print("Use arrow keys or WSAD to rotate the cube")
print("+ . > =   increase anim speed")
print("- , < _   decrease")
print("r - reset")

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

def rotate_point_x(x, y, z, angle):
    angle_rad = math.radians(angle)
    new_y = y * math.cos(angle_rad) - z * math.sin(angle_rad)
    new_z = y * math.sin(angle_rad) + z * math.cos(angle_rad)
    return x, new_y, new_z

def rotate_point_y(x, y, z, angle):
    angle_rad = math.radians(angle)
    new_x = x * math.cos(angle_rad) - z * math.sin(angle_rad)
    new_z = x * math.sin(angle_rad) + z * math.cos(angle_rad)
    return new_x, y, new_z

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

    for edge in edges:
        start_x, start_y, start_z = rotated_vertices[edge[0]]
        end_x, end_y, end_z = rotated_vertices[edge[1]]
        pygame.draw.line(surface, WHITE, (start_x + SCREEN_WIDTH // 2, start_y + SCREEN_HEIGHT // 2),
                         (end_x + SCREEN_WIDTH // 2, end_y + SCREEN_HEIGHT // 2), 2)

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

    keys = pygame.key.get_pressed()
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

    screen.fill(BLACK)
    draw_cube(screen, angle_x, angle_y)

    pygame.display.flip()
    clock.tick(FPS)
