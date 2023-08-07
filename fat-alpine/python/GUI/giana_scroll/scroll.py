import pygame

pygame.init()

canvas_width = 800
canvas_height = 368
screen = pygame.display.set_mode((canvas_width, canvas_height))
pygame.display.set_caption("GIANA SISTERS")

background_bitmap = pygame.image.load("giana_scroll.png")

double_bitmap_width = background_bitmap.get_width() * 2
double_bitmap = pygame.Surface((double_bitmap_width, background_bitmap.get_height()))
double_bitmap.blit(background_bitmap, (0, 0))
double_bitmap.blit(background_bitmap, (background_bitmap.get_width(), 0))

background_x = 0

running = True
clock = pygame.time.Clock()
scroll_speed = 5
soldier_anim_counter = 0

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))  # Black background

    screen.blit(double_bitmap, (background_x, 0))

    background_x -= scroll_speed
    if background_x <= -background_bitmap.get_width():
        background_x = 0
   
    pygame.display.flip()
    clock.tick(60)

pygame.quit()

