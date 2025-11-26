import os
from pathlib import Path

# creates directory if it does not exist
def makeDir(dir_name):
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)

# get list of all files (excluding directories) in a directory
def getFilesInDir(dir_name):
    directory = Path(dir_name)
    files = [f.name for f in directory.iterdir() if f.is_file()]
    return files
