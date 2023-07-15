import random
import os
import time
import platform

# Set up the screen size and the number of trees
SCREEN_WIDTH = 80
SCREEN_HEIGHT = 24
NUM_TREES = 6



def clear_screen():
    os_name = platform.system()
    command = 'cls' if os_name == "Windows" else 'clear'
    os.system(command)
    

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


clear_screen()



try:
    while True:
        # Move and display the snowflakes
        for flake in snowflakes:
            flake.move()
            flake.display()
        
        # Display the trees
        display_trees(trees)
        
        time.sleep(0.05)
        # Display the snowman
       
except:
    print("error")
    