from screen_mem import TextScreenMemory

def create_start_screen():
    screen = TextScreenMemory()
    screen.set_row(1, "    **** commodore 64 basic v2 ****     ")
    screen.set_row(3, " 64k ram system  38911 basic bytes free ")
    screen.set_row(5, "ready")
    
    return screen
    