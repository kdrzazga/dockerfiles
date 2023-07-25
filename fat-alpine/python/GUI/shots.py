import pygame
import math
import time
import sys


pygame.init()

WIDTH, HEIGHT = 800, 600
GRAVITY = 9.81

WHITE = (255, 255, 255)
RED = (255, 0, 0)

screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Toss Animation")

def calculate_trajectory(angle_degrees, initial_speed):
    angle_radians = math.radians(angle_degrees)
    time_of_flight = (2 * initial_speed * math.sin(angle_radians)) / GRAVITY
    max_height = (initial_speed ** 2) * (math.sin(angle_radians) ** 2) / (2 * GRAVITY)
    distance = (initial_speed ** 2) * math.sin(2 * angle_radians) / GRAVITY

    trajectory_points = []
    time_interval = 0.05
    t = 0.0

    while t <= time_of_flight:
        x = initial_speed * math.cos(angle_radians) * t
        y = HEIGHT - (initial_speed * math.sin(angle_radians) * t - 0.5 * GRAVITY * t ** 2)
        trajectory_points.append((x, y))
        t += time_interval

    return trajectory_points

def draw_trajectory(angle_degrees, initial_speed, trajectory):
    screen.fill(WHITE)
    for i in range(len(trajectory) - 1):
        pygame.draw.line(screen, RED, trajectory[i], trajectory[i + 1], 2)
    info(angle_degrees, initial_speed, trajectory[-1][0])
    pygame.display.flip()


def info(angle_degrees, initial_speed, distance):
    font = pygame.font.Font(None, 24)
    angle_text = f"Angle: {angle_degrees} degrees"
    speed_text = f"Initial Speed: {initial_speed} m/s"
    distance_text = f"Distance: {distance:.2f} meters"

    angle_surface = font.render(angle_text, True, RED)
    speed_surface = font.render(speed_text, True, RED)
    distance_surface = font.render(distance_text, True, RED)

    screen.blit(angle_surface, (WIDTH // 2 - angle_surface.get_width() // 2, 10))
    screen.blit(speed_surface, (WIDTH // 2 - speed_surface.get_width() // 2, 40))
    screen.blit(distance_surface, (WIDTH // 2 - distance_surface.get_width() // 2, 70))


def main():
    angle_degrees = 77
    initial_speed = 99

    trajectory = calculate_trajectory(angle_degrees, initial_speed)

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()
        
        pause = 2
        draw_trajectory(angle_degrees, initial_speed, trajectory)
        time.sleep(pause)
        a = 45
        s = 88
        draw_trajectory(a, s, calculate_trajectory(a, s))
        time.sleep(pause)


if __name__ == "__main__":
    main()
