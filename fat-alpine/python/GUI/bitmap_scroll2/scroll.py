import pygame

pygame.init()

canvas_width = 640
canvas_height = 600
screen = pygame.display.set_mode((canvas_width, canvas_height))
pygame.display.set_caption("COMMANDO MAP SCROLLING")

background_bitmap = pygame.image.load("CommandoMap.png")

double_bitmap_width = background_bitmap.get_width()
double_bitmap_height = background_bitmap.get_height() * 2
double_bitmap = pygame.Surface((double_bitmap_width, double_bitmap_height))
double_bitmap.blit(background_bitmap, (0, 0))
double_bitmap.blit(background_bitmap, (0, background_bitmap.get_height()))

background_y = 0

running = True
clock = pygame.time.Clock()
scroll_speed = 5

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))

    screen.blit(double_bitmap, (0, background_y))

    background_y += scroll_speed
    if background_y >= 0:
        background_y = -background_bitmap.get_height()

    pygame.display.flip()
    clock.tick(90)

pygame.quit()
