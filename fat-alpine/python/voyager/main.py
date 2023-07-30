import pygame
import math
import sys
import datetime

# Initialize Pygame
pygame.init()

# Constants
SCREEN_WIDTH, SCREEN_HEIGHT = 800, 600
PROBE_SPEED = 2  # Speed of the probes in pixels per step
MONTHS_PER_STEP = 1  # Number of months per step
PROBE_COLORS = {
    'Voyager 1': (255, 0, 0),
    'Voyager 2': (0, 255, 0),
    'New Horizons': (0, 0, 255)
}

# Set up the display
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Space Probe Animation")


class Probe:
    def __init__(self, name, launch_date):
        self.name = name
        self.launch_date = launch_date
        self.distance_covered = 0

    def update_distance(self):
        self.distance_covered += PROBE_SPEED * MONTHS_PER_STEP

    def get_position(self):
        return SCREEN_WIDTH // 2 + int(self.distance_covered / 1000)


class SolarSystem:
    def __init__(self):
        self.probes = []

    def add_probe(self, probe):
        self.probes.append(probe)


class DrawTool:
    @staticmethod
    def draw_probe(probe, screen):
        x = probe.get_position()
        y = SCREEN_HEIGHT // 2
        pygame.draw.circle(screen, PROBE_COLORS[probe.name], (x, y), 5)

    @staticmethod
    def draw_solar_system(screen):
        pygame.draw.circle(screen, (255, 255, 0), (SCREEN_WIDTH // 2, SCREEN_HEIGHT // 2), 150, 2)


def main():
    solar_system = SolarSystem()

    voyager1 = Probe('Voyager 1', datetime.date(1977, 9, 1))
    voyager2 = Probe('Voyager 2', datetime.date(1977, 9, 1))
    new_horizons = Probe('New Horizons', datetime.date(2006, 1, 19))

    solar_system.add_probe(voyager1)
    solar_system.add_probe(voyager2)
    solar_system.add_probe(new_horizons)

    current_date = datetime.date(1977, 9, 1)  # Start date

    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                sys.exit()

        # Update distances
        for probe in solar_system.probes:
            probe.update_distance()

        # Clear the screen
        screen.fill((0, 0, 0))

        # Draw the solar system
        DrawTool.draw_solar_system(screen)

        # Draw the probes
        for probe in solar_system.probes:
            DrawTool.draw_probe(probe, screen)

        # Draw current date
        font = pygame.font.SysFont(None, 24)
        date_text = font.render(f"Date: {current_date}", True, (255, 255, 255))
        screen.blit(date_text, (10, 10))

        # Update the display
        pygame.display.flip()

        # Wait for a while (simulate time passing)
        pygame.time.wait(100)

        # Update the current date
        current_date += datetime.timedelta(days=30 * MONTHS_PER_STEP)


if __name__ == "__main__":
    main()
