import os
import sys
import art
import time
import subprocess
from colorama import Fore

def start_server(script_path):
    subprocess.call(['python', script_path])

def start_microservices():
    directory = "/usr/python-stuff/microservices"
    scripts = ["service1.py", "service2.py", "service3.py", "service4.py", "service5.py"]
    processes = []

    for script in scripts:
        script_path = os.path.join(directory, script)
        process = multiprocessing.Process(target=start_server, args=(script_path,))
        process.start()
        processes.append(process)
        print("Started microservice: " + script)

    for process in processes:
        process.join()


text_wall = ("Installed user soft:", 
             "nethack - A classic roguelike game with procedurally generated dungeons", 
             "ranger", 
             "", 
             "Available games are:", 
             "alpine - A text-based email client with support for multiple accounts", 
             "cmatrix - A program that displays a scrolling matrix-like screen", 
             "dialog - A program that creates dialog boxes in the terminal", 
             "elinks - A text-based web browser with support for frames and tables", 
             "figlet - A program that creates large letters out of ordinary text", 
             "fortune - A program that displays random quotes and aphorisms", 
             "gnuplot - A program for plotting graphs and charts in the terminal", 
             "inxi - A program that displays system information", 
             "lynx - A text-based web browser", 
             "mc - A file manager with a text-based user interface", 
             "mutt - A text-based email client with support for multiple accounts", 
             "nano - A text editor with a simple user interface", 
             "ncdu - A disk usage analyzer with a text-based user interface", 
             "sc - A spreadsheet program with a text-based user interface", 
             "screen - A program that allows multiple terminal sessions",  
             "sl - A joke program that displays an ASCII art steam locomotive when you mistype \"ls\", command", 
             "tree - A program for displaying directory structures in a tree format", 
             "units - A program for converting between different units of measurement", 
             "w3m - A text-based web browser with support for images and tables", 
             "wget - A command-line program for downloading files from the internet",
             "deluge qbittorrent - torrent clients",
             "antiword - displays doc files",
             "aria2 - downloader",
             "zhs", 
             "curl", 
             "git",
             "",
             "python info.py - prints this message")

text_wall_python_programs = ("Some PYTHON games in folder /usr/python-stuff",
                             "JAVA stuff in directories /srv/java-stuff/11 and /srv/java-stuff/17",
                             "And also programs in following languages:",
                             "Ada, Assembler, c, D, Fortran, Go, Haskell, LISP, NodeJS, Perl, Prolog, R"
                            )

os.system('clear')
os.system('uname -a')

output = subprocess.check_output(['cat', '/etc/alpine-release'])
version = output.decode('utf-8').strip()
print('Alpine Linux', version)

if len(sys.argv) > 1 and sys.argv[1] == "up":
    start_microservices()

time.sleep(2)

welcome = art.text2art("welcome !")
print(f"{Fore.MAGENTA}{welcome}{Fore.RESET}")

time.sleep(2)
 
for text in text_wall:
    parts = text.split(" - ")

    message = f"{Fore.YELLOW}{parts[0]}{Fore.RESET}"
    if len(parts) == 2:
        message += f" - {Fore.CYAN}{parts[1]}{Fore.RESET}"
    
    print(message)
    
time.sleep(2)

for text in text_wall_python_programs:
    print(text)


if len(sys.argv) > 1 and sys.argv[1] == "up":
    print("\nCURRENT USER: ")
    os.system('whoami')
    os.system('mc')
