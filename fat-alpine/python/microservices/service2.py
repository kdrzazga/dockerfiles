import subprocess

directory = 'service2files'

script_name = 'civilization.py'

command = f'python {directory}/{script_name}'

subprocess.run(command, shell=True)
