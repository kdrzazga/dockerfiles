import os


def find_project_root(root_marker='README.md'):
    """
    Find the root directory of the current Python project by looking for a file or folder that
    serves as a root marker.

    :param root_marker: the name of a file or folder that serves as a root marker (default: 'README.md')
    :return: the absolute path of the root directory as a string
    """
    # get the absolute path of the current Python file
    current_file = os.path.abspath(__file__)

    # start with the directory containing the current file
    current_dir = os.path.dirname(current_file)

    # keep going up the directory tree until we find the root marker
    while True:
        if root_marker in os.listdir(current_dir):
            root_dir = current_dir
            break
        parent_dir = os.path.dirname(current_dir)
        if parent_dir == current_dir:
            # we've reached the root directory of the file system
            raise Exception('Root directory not found!')
        current_dir = parent_dir

    return root_dir
