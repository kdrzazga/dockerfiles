import pygame
import random
import time

pygame.init()

canvas_width = 800
canvas_height = 600

GREY = (180, 180, 180)
BLACK = (0, 0, 0)
TRASH_COLOR = (150, 75, 0)

trash_width = 30
trash_height = 30
num_slots = 20
slot_width = canvas_width // num_slots

pile_x = canvas_width // 2
pile_y = canvas_height - trash_height

class Trash:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def update(self):
        self.y += 5

class Pile:
    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.slots = [canvas_width // num_slots * i for i in range(num_slots)]
        self.heights = [0] * num_slots  # Initialize heights for each slot to zero


    def accumulate(self, slot):
        self.heights[slot] += trash_height

class Board:
    def __init__(self, pile_x, pile_y):
        self.pile = Pile(pile_x - trash_width // 2, pile_y)
        self.falling_trash = []

    def add_trash(self, slot):
        trash_x = self.pile.slots[slot]
        self.falling_trash.append(Trash(trash_x, 0))

    def update(self):
        new_falling_trash = []
        for trash in self.falling_trash:
            trash.update()
            if trash.y >= self.pile.y - trash_height:
                slot = min(range(num_slots), key=lambda i: abs(trash.x - self.pile.slots[i]))
                self.pile.accumulate(slot)
            else:
                new_falling_trash.append(trash)

        self.falling_trash = new_falling_trash

    def draw(self, screen):
        screen.fill(BLACK)

        for slot_x, pile_height in zip(self.pile.slots, self.pile.heights):
            pygame.draw.rect(screen, GREY, (slot_x, self.pile.y - pile_height, trash_width, pile_height))

        for trash in self.falling_trash:
            pygame.draw.rect(screen, TRASH_COLOR, (trash.x, trash.y, trash_width, trash_height))

screen = pygame.display.set_mode((canvas_width, canvas_height))
pygame.display.set_caption("Tower of Rubble")

clock = pygame.time.Clock()
fall_interval = 1000

board = Board(pile_x, pile_y)

running = True
last_fall_time = 0

while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    
    current_time = pygame.time.get_ticks()

    if current_time - last_fall_time >= fall_interval:
        slot = random.randint(0, num_slots - 1)
        board.add_trash(slot)
        last_fall_time = current_time

    board.update()
    board.draw(screen)

    pygame.display.flip()
    clock.tick(180)

pygame.quit()
