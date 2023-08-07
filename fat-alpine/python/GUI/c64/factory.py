from screen_mem import TextScreenMemory

def create_start_screen():
    screen = TextScreenMemory()
    screen.set_row(1, "    **** COMMODORE 64 BASIC V2 ****     ")
    screen.set_row(3, " 64K RAM SYSTEM  38911 BASIC BYTES FREE ")
    screen.set_row(5, "READY")
    
    return screen
    
def create_solid_sprite():
    pass
    