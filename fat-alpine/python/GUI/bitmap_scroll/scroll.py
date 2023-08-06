import pygame

pygame.init()

canvas_width = 800
canvas_height = 200
screen = pygame.display.set_mode((canvas_width, canvas_height))
pygame.display.set_caption("Seemingly Infinite Scrolling with Animated Soldier")

# Load the scrolling background bitmap
background_bitmap = pygame.image.load("background_image.png")  # Replace "background_image.png" with your image file path

# Create a surface to hold two copies of the scrolling background side by side
double_bitmap_width = background_bitmap.get_width() * 2
double_bitmap = pygame.Surface((double_bitmap_width, background_bitmap.get_height()))
double_bitmap.blit(background_bitmap, (0, 0))  # Copy the original background
double_bitmap.blit(background_bitmap, (background_bitmap.get_width(), 0))  # Copy the original background again next to it

background_x = 0

# Load the animated soldier frames
soldier_frames = [pygame.image.load(f"soldier_frame{i}.png").convert_alpha() for i in range(1, 5)]  # Assumes files named soldier_frame1.png, soldier_frame2.png, ...

soldier_x = 20
soldier_y = 98
current_frame = 0
animation_speed = 8  # Adjust this value to control the animation speed

running = True
clock = pygame.time.Clock()
scroll_speed = 5  # Adjust this value to control the scrolling speed
soldier_anim_counter = 0

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    screen.fill((0, 0, 0))  # Black background

    # Draw the scrolling background
    screen.blit(double_bitmap, (background_x, 30))  # You can adjust the y-coordinate (30 in this case)

    # Draw the animated soldier
    screen.blit(soldier_frames[current_frame], (soldier_x, soldier_y))

    # Update the scrolling background position
    background_x -= scroll_speed
    if background_x <= -background_bitmap.get_width():
        background_x = 0

    # Update the animated soldier frame
    
    if soldier_anim_counter > 7:
        current_frame = (current_frame + 1) % len(soldier_frames)
        soldier_anim_counter = 0
    else:
        soldier_anim_counter += 1
    
    pygame.display.flip()
    clock.tick(60)

pygame.quit()

