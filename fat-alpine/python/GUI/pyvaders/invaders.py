import pygame
import random

pygame.init()

width = 800
height = 600

black = (0, 0, 0)
white = (255, 255, 255)

screen = pygame.display.set_mode((width, height))
pygame.display.set_caption("Space Shooter")

player_img = pygame.image.load("player.png")
player_width = 64
player_height = 64

enemy_img = pygame.image.load("enemy.png")
enemy_width = 64
enemy_height = 64

bullet_img = pygame.image.load("bullet.png")
bullet_width = 32
bullet_height = 32

player_x = width // 2 - player_width // 2
player_y = height - player_height - 10
player_speed = 5

bullet_x = 0
bullet_y = player_y - player_height
bullet_speed = 10
bullet_state = "ready"

enemy_x = random.randint(0, width - enemy_width)
enemy_y = random.randint(50, 200)
enemy_speed = 3

score = 0

running = True
clock = pygame.time.Clock()

def player(x, y):
    screen.blit(player_img, (x, y))

def enemy(x, y):
    screen.blit(enemy_img, (x, y))

def fire_bullet(x, y):
    global bullet_state
    bullet_state = "fire"
    screen.blit(bullet_img, (x + 16, y + 10))

def is_collision(enemy_x, enemy_y, bullet_x, bullet_y):
    distance = ((enemy_x - bullet_x) ** 2 + (enemy_y - bullet_y) ** 2) ** 0.5
    if distance < 27:
        return True
    return False

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE and bullet_state == "ready":
                bullet_x = player_x
                fire_bullet(bullet_x, bullet_y)

    keys = pygame.key.get_pressed()
    if keys[pygame.K_LEFT] and player_x > 0:
        player_x -= player_speed
    if keys[pygame.K_RIGHT] and player_x < width - player_width:
        player_x += player_speed

    screen.fill(black)

    player(player_x, player_y)

    if bullet_y <= 0:
        bullet_y = player_y - player_height
        bullet_state = "ready"

    if bullet_state == "fire":
        fire_bullet(bullet_x, bullet_y)
        bullet_y -= bullet_speed

    collision = is_collision(enemy_x, enemy_y, bullet_x, bullet_y)
    if collision:
        bullet_y = player_y - player_height
        bullet_state = "ready"
        score += 1
        enemy_x = random.randint(0, width - enemy_width)
        enemy_y = random.randint(50, 200)

    enemy(enemy_x, enemy_y)
    enemy_x += enemy_speed

    if enemy_x > width - enemy_width or enemy_x < 0:
        enemy_speed *= -1
        enemy_y += enemy_height

    pygame.display.update()
    clock.tick(60)

pygame.quit()
