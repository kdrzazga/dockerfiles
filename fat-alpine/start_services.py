import multiprocessing
import subprocess
import logging

services = ['service1.py', 'service2.py', 'service3.py', 'service4.py']


def start_service(service_script):
    subprocess.Popen(['python', service_script], creationflags=subprocess.CREATE_NEW_PROCESS_GROUP)


if __name__ == '__main__':
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')

    num_processes = len(services)
    processes = []

    logging.info("Starting service processes...")
    for service_script in services:
        process = multiprocessing.Process(target=start_service, args=(service_script,))
        process.start()
        processes.append(process)

    # Wait for the processes to start before exiting the main process
    for process in processes:
        process.join()
