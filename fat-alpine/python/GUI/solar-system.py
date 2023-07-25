import pygame
import math

print("INNER SOLAR SYSTEM")
print("\nThe following animation keeps proportions among planet sizes: Venus is slightly smaller than Earth, Moon is 6 times smaller than Earth, and Mercury is slightly bigger than the Moon.")
print("Satellites of Mars: Phobos (larger and closer) and Deimos (smaller and further) are pretty tiny and  irregularly shaped.")
print("The Moon rotates around the Eath ca 12 times a year.")
print("Year on Merury is ca 1/4 of Earth's, Venus - 0.6 and Mars ca 1.8-2 ")
print("\nThe Sun is in fact much bigger - 110 times the diameter of the Earth")

pygame.init()

window_width = 800
window_height = 800
window = pygame.display.set_mode((window_width, window_height))
pygame.display.set_caption("Inner Solar System")

clock = pygame.time.Clock()

black = (0, 0, 0)
yellow = (255, 255, 0)
red = (255, 0, 0)
green = (0, 255, 0)
blue = (0, 0, 255)
white = (255, 255, 255)

sun_radius = 50
sun_x = window_width // 2
sun_y = window_height // 2

mercury_radius = 7
mercury_distance = 100
mercury_angle = 0
mercury_speed = 0.03

venus_radius = 23
venus_distance = 200
venus_angle = 0
venus_speed = 0.02

earth_radius = 25
earth_distance = 300
earth_angle = 0
earth_speed = 0.01

moon_radius = 5
moon_distance = 40
moon_angle = 0
moon_speed = 0.1

mars_radius = 15
mars_distance = 400
mars_angle = 0
mars_speed = 0.006

# Moons for Mars
moon1_radius = 2

moon1_distance = 30
moon1_angle = 0
moon1_speed = 0.15

moon2_radius = 1
moon2_distance = 50
moon2_angle = 0
moon2_speed = 0.08

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    window.fill(black)

    # Draw the sun
    pygame.draw.circle(window, yellow, (sun_x, sun_y), sun_radius)

    # Calculate the positions of the planets
    mercury_x = sun_x + mercury_distance * math.cos(mercury_angle)
    mercury_y = sun_y + mercury_distance * math.sin(mercury_angle)
    venus_x = sun_x + venus_distance * math.cos(venus_angle)
    venus_y = sun_y + venus_distance * math.sin(venus_angle)
    earth_x = sun_x + earth_distance * math.cos(earth_angle)
    earth_y = sun_y + earth_distance * math.sin(earth_angle)
    mars_x = sun_x + mars_distance * math.cos(mars_angle)
    mars_y = sun_y + mars_distance * math.sin(mars_angle)

    # Draw the planets
    pygame.draw.circle(window, red, (int(mercury_x), int(mercury_y)), mercury_radius)
    pygame.draw.circle(window, green, (int(venus_x), int(venus_y)), venus_radius)
    pygame.draw.circle(window, blue, (int(earth_x), int(earth_y)), earth_radius)
    pygame.draw.circle(window, red, (int(mars_x), int(mars_y)), mars_radius)

    # Calculate the positions of the moons
    moon_x = earth_x + moon_distance * math.cos(moon_angle)
    moon_y = earth_y + moon_distance * math.sin(moon_angle)
    moon1_x = mars_x + moon1_distance * math.cos(moon1_angle)
    moon1_y = mars_y + moon1_distance * math.sin(moon1_angle)
    moon2_x = mars_x + moon2_distance * math.cos(moon2_angle)
    moon2_y = mars_y + moon2_distance * math.sin(moon2_angle)

    # Draw the moons
    pygame.draw.circle(window, white, (int(moon_x), int(moon_y)), moon_radius)
    pygame.draw.circle(window, white, (int(moon1_x), int(moon1_y)), moon1_radius)
    pygame.draw.circle(window, white, (int(moon2_x), int(moon2_y)), moon2_radius)

    mercury_angle += mercury_speed
    venus_angle += venus_speed
    earth_angle += earth_speed
    moon_angle += moon_speed
    mars_angle += mars_speed
    moon1_angle += moon1_speed
    moon2_angle += moon2_speed

    pygame.display.update()
    clock.tick(60)

pygame.quit()
