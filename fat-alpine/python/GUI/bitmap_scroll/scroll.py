import pygame

pygame.init()

canvas_width = 800
canvas_height = 200
screen = pygame.display.set_mode((canvas_width, canvas_height))
pygame.display.set_caption("Seemingly Infinite Scrolling with Animated Soldier")

background_bitmap = pygame.image.load("background_image.png").convert_alpha()

double_bitmap_width = background_bitmap.get_width() * 2
double_bitmap = pygame.Surface((double_bitmap_width, background_bitmap.get_height()))
double_bitmap.blit(background_bitmap, (0, 0))
double_bitmap.blit(background_bitmap, (background_bitmap.get_width(), 0))

background_x = 0

soldier_frames = [pygame.image.load(f"soldier_frame{i}.png").convert_alpha() for i in range(1, 6)]

soldier_x = 20
soldier_y = 98
current_frame = 0

running = True
clock = pygame.time.Clock()
scroll_speed = 5
soldier_anim_counter = 0

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))  # Black background

    screen.blit(double_bitmap, (background_x, 30))
    
    screen.blit(soldier_frames[current_frame], (soldier_x, soldier_y))

    background_x -= scroll_speed
    if background_x <= -background_bitmap.get_width():
        background_x = 0
    
    if soldier_anim_counter > 7:
        current_frame = (current_frame + 1) % len(soldier_frames)
        soldier_anim_counter = 0
    else:
        soldier_anim_counter += 1
    
    pygame.display.flip()
    clock.tick(60)

pygame.quit()

