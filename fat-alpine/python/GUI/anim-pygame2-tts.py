import pygame
import random
import time

pygame.init()

sprite_number = 15
window_width = 800
window_height = 600
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Pygame Animation")

image = pygame.image.load("tts.jpg")
image_width, image_height = image.get_size()

# Define font properties
font = pygame.font.Font(None, 24)
font_color = (255, 255, 255)

clock = pygame.time.Clock()

objects = []
for i in range(sprite_number):
    x = random.randint(0, window_width - image_width)
    y = random.randint(0, window_height - image_height)
    velocity_x = random.randint(-5, 5)
    velocity_y = random.randint(-5, 5)
    objects.append({"x": x, "y": y, "velocity_x": velocity_x, "velocity_y": velocity_y, "id": i + 1})

log = []

def handle_collisions():
    for i in range(len(objects)):
        for j in range(i + 1, len(objects)):
            obj1 = objects[i]
            obj2 = objects[j]
            if abs(obj1["x"] - obj2["x"]) < image_width and abs(obj1["y"] - obj2["y"]) < image_height:
                collision = f"{time.time()}: collision: {obj1['id']} & {obj2['id']}"
                log.append(collision)

running = True
collision_timer = time.time()
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    for obj in objects:
        obj["x"] += obj["velocity_x"]
        obj["y"] += obj["velocity_y"]

        if obj["x"] <= 0 or obj["x"] >= window_width - image_width:
            obj["velocity_x"] = -obj["velocity_x"]
        if obj["y"] <= 0 or obj["y"] >= window_height - image_height:
            obj["velocity_y"] = -obj["velocity_y"]

    if time.time() - collision_timer >= 4:
        handle_collisions()
        collision_timer = time.time()

    window.fill((255, 255, 255))

    for obj in objects:
        window.blit(image, (obj["x"], obj["y"]))
        # Render and display the sprite number
        text = font.render(str(obj["id"]), True, font_color)
        text_rect = text.get_rect(center=(obj["x"] + image_width // 2, obj["y"] + image_height // 2))
        window.blit(text, text_rect)

    pygame.display.update()

    clock.tick(150)

for entry in log:
    print(entry)

pygame.quit()
