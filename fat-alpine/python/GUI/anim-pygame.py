import pygame

pygame.init()

window_width = 800
window_height = 600
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Pygame Animation")

clock = pygame.time.Clock()

x = 50
y = 50
velocity_x = 5
velocity_y = 2

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    x += velocity_x
    y += velocity_y

    if x <= 0 or x >= window_width:
        velocity_x = -velocity_x
    if y <= 0 or y >= window_height:
        velocity_y = -velocity_y

    window.fill((255, 255, 255))

    pygame.draw.circle(window, (255, 0, 0), (x, y), 20)

    pygame.display.update()

    clock.tick(60)

pygame.quit()
