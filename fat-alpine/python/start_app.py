import multiprocessing
import subprocess
import os


def start_server():
    server_script = os.path.join(os.getcwd(), 'microservices', 'service1.py')
    subprocess.call(['python', server_script])


def start_ui():
    ui_script = os.path.join(os.getcwd(), 'frames', 'frames.py')
    subprocess.call(['python', ui_script])


if __name__ == '__main__':
    server_process = multiprocessing.Process(target=start_server)
    server_process.start()

    start_ui()

    server_process.join()
