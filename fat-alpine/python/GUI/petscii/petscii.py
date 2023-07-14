import pygame
import sys
import os

parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.append(parent_dir)

from c64colors import get_color

pygame.init()

width, height = 640, 480
screen = pygame.display.set_mode((width, height))

font = pygame.font.Font("../C64_Pro_Mono-STYLE.ttf", 20)

H_LINE = 0xE063
V_LINE = 0xE0C2
JOINT_H_UP = 0xE0B1
JOINT_H_DOWN = 0xE0B2
LB_CORNER = 0xE0AD
RT_CORNER = 0xE0AE
LT_CORNER = 0xE0B0
RB_CORNER = 0xE0BD

RT_TRIANGLE = 0xE07F
RB_TRIANGLE = 0x25E2
LB_THICK_CORNER = 0x2599
LT_THICK_CORNER = 0x259B

BTM_LINE4 = 0x2584
BTM_LINE3 = 0x2583
BTM_LINE2 = 0x2582
BTM_LINE1 = 0x2581
TOP_LINE4 = 0x00DF
TOP_LINE3 = 0xE1F8
TOP_LINE2 = 0xE1F7
TOP_LINE1 = 0xE0E3

def write(x, y, lines):
    
    for code in lines:
        if code == 10:
            x = 20
            y += 20
            continue
        
        char = chr(code)
        text = font.render(char, True, text_color)
        screen.blit(text, (x, y))
        x += 19
    
    return x, y


background_color = (0, 0, 0)
text_color = (255, 255, 255)
screen.fill(background_color)

y = 5
x = 20
x, y = write(x, y, [LT_CORNER, H_LINE, JOINT_H_DOWN, RT_CORNER, 10\
            , V_LINE, 32, V_LINE, V_LINE, 10 \
            , LB_CORNER, H_LINE, JOINT_H_UP, RB_CORNER, 10])

x, y = write(x, y, [RT_TRIANGLE, LB_THICK_CORNER, BTM_LINE4, BTM_LINE4, BTM_LINE4, BTM_LINE4, BTM_LINE4, BTM_LINE3, BTM_LINE2, BTM_LINE1, 10\
                   , RB_TRIANGLE, LT_THICK_CORNER, TOP_LINE4, TOP_LINE4, TOP_LINE4, TOP_LINE4, TOP_LINE4, TOP_LINE3, TOP_LINE2, TOP_LINE1, 10])


pygame.display.flip()

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

pygame.quit()
