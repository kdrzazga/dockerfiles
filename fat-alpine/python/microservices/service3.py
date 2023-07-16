import subprocess

directory = 'service3files'

script_name = 'tech_tree_srv.py'

command = f'python {directory}/{script_name}'

subprocess.run(command, shell=True)
