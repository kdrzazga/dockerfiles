#!/usr/bin/env python

import art, sys, os

from colorama import Fore

welcome = art.text2art("H E L L O !")
print(f"{Fore.CYAN}{welcome}{Fore.RESET}")

for msg in ("This image is a kind of adding custom commands to Linux.", "Those custom commands are in fact python programs, set to be ran by python interepreter automatically by typing their name.", "This was achieved by adding run header (#!/usr/bin/env python) to the scripts and adding the scripts directory to the PATH.", ""):
    print(msg)

for msg in ("Available commands:", "", "program1", "program2", "comic", "intro - displays this intro", ""):
    print(msg)
    
if len(sys.argv) > 1 and sys.argv[1] == "up":
    print("\nCURRENT USER: ")
    os.system('whoami')
    os.system('bash')
