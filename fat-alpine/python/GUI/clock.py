import pygame
import math
import time

pygame.init()

window_width = 400
window_height = 400
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Analog Clock")

clock_radius = 150
clock_center = (window_width // 2, window_height // 2)
hour_hand_length = 100
minute_hand_length = 140
second_hand_length = 111

clock_font = pygame.font.Font(None, 28)

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    current_time = time.localtime()
    hour = current_time.tm_hour
    minute = current_time.tm_min
    second = current_time.tm_sec

    hour_angle = (hour % 12 + minute / 60) * 30
    minute_angle = (minute + second / 60) * 6
    second_angle = second * 6

    window.fill((255, 255, 255))

    pygame.draw.circle(window, (0, 0, 0), clock_center, clock_radius, 2)

    hour_hand_x = clock_center[0] + hour_hand_length * math.sin(math.radians(hour_angle - 90))
    hour_hand_y = clock_center[1] + hour_hand_length * math.cos(math.radians(hour_angle - 90))
    pygame.draw.line(window, (0, 0, 0), clock_center, (hour_hand_x, hour_hand_y), 4)

    minute_hand_x = clock_center[0] + minute_hand_length * math.sin(math.radians(minute_angle - 90))
    minute_hand_y = clock_center[1] + minute_hand_length * math.cos(math.radians(minute_angle - 90))
    pygame.draw.line(window, (0, 0, 0), clock_center, (minute_hand_x, minute_hand_y), 3)

    second_hand_x = clock_center[0] + second_hand_length * math.sin(math.radians(second_angle - 90))
    second_hand_y = clock_center[1] + second_hand_length * math.cos(math.radians(second_angle - 90))
    pygame.draw.line(window, (255, 0, 0), clock_center, (second_hand_x, second_hand_y), 2)

    for i in range(1, 13):
        angle = math.radians(i * 30 - 90)
        number_x = clock_center[0] + (clock_radius - 20) * math.sin(angle)
        number_y = clock_center[1] + (clock_radius - 20) * math.cos(angle)
        number_text = clock_font.render(str(i), True, (0, 0, 0))
        number_rect = number_text.get_rect(center=(number_x, number_y))
        window.blit(number_text, number_rect)

    pygame.display.update()
    pygame.time.Clock().tick(60)

pygame.quit()
