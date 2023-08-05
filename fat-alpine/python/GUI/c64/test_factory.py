from factory import create_start_screen
from screen_mem import TextScreenMemory

screen = create_start_screen()

print("#" * (screen.sizeX + 2))

for y in range (screen.sizeY):
    print("#", end="")
    for x in range (screen.sizeX):
        print(screen.mem[y * TextScreenMemory.sizeX + x], end="")
        
    print("#")
    
print("#" * (screen.sizeX + 2))
