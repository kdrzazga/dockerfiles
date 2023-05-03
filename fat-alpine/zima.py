import random
import os
import time

# Set up the screen size and the number of trees
SCREEN_WIDTH = 80
SCREEN_HEIGHT = 24
NUM_TREES = 6

# Define the ASCII art for the trees
TREE_TOP = "\033[32m    ^    \033[0m"
TREE_MID = "\033[32m   / \\   \033[0m"
TREE_BOT = "\033[32m  /___\\  \033[0m"

# Define the ASCII art for the falling snow
SNOWFLAKES = ["\033[37m*\033[0m", "\033[37m.\033[0m", "\033[37m+\033[0m", "\033[37mo\033[0m"]

# Define the ASCII art for the snowman
SNOWMAN = "\033[36m_===_\n( o o )\n(  >  )\n'--'--'\033[0m"

# Define a class for each falling snowflake
class Snowflake:
    def __init__(self):
        self.x = random.randint(0, SCREEN_WIDTH-1)
        self.y = random.randint(0, SCREEN_HEIGHT-1)
        self.char = random.choice(SNOWFLAKES)
        self.speed = random.randint(1, 3)
        
    # Move the snowflake down the screen
    def move(self):
        self.y += self.speed
        if self.y >= SCREEN_HEIGHT:
            self.y = 0
            self.x = random.randint(0, SCREEN_WIDTH-1)
            
    # Display the snowflake at its current position
    def display(self):
        print("\033[{};{}H{}".format(self.y, self.x, self.char), end="")
        

# Define a function to create the trees
def create_trees():
    trees = []
    for i in range(NUM_TREES):
        x = random.randint(0, SCREEN_WIDTH-1)
        trees.append({"x": x, "y": SCREEN_HEIGHT-6})
    return trees

# Define a function to display the trees
def display_trees(trees):
    for tree in trees:
        x = tree["x"]
        y = tree["y"]
        print("\033[{};{}H{}".format(y, x, TREE_TOP))
        print("\033[{};{}H{}".format(y+1, x, TREE_TOP))
        print("\033[{};{}H{}".format(y+2, x, TREE_TOP))
        print("\033[{};{}H{}".format(y+3, x, TREE_MID))
        print("\033[{};{}H{}".format(y+4, x, TREE_MID))
        print("\033[{};{}H{}".format(y+5, x, TREE_BOT))

# Define a function to display the snowman
def display_snowman():
    x = random.randint(0, SCREEN_WIDTH-8)
    y = SCREEN_HEIGHT-7
    print("\033[{};{}H{}".format(y, x, SNOWMAN))

# Clear the screen
os.system('clear')

# Create the trees and the snowflakes
trees = create_trees()
snowflakes = [Snowflake() for i in range(20)]

try:
    while True:
        # Move and display the snowflakes
        for flake in snowflakes:
            flake.move()
            flake.display()
        
        # Display the trees
        display_trees(trees)
        
        # Display the snowman
       
except:
    print("error")