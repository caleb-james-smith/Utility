import os
import sys
import shutil
from pathlib import Path
from datetime import datetime

# creates directory if it does not exist
def makeDir(dir_name):
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)

# move file if it exists; if not, print error and exit
def moveFile(source, destination):
    print("Moving file...")
    print(f" - source: {source}")
    print(f" - destination: {destination}")
    try:
        shutil.move(source, destination)
    except FileNotFoundError:
        print(f"ERROR: Cannot move the file '{source}' as it was not found.")
        sys.exit(1)

# get list of all files (excluding directories) in a directory
def getFilesInDir(dir_name):
    directory = Path(dir_name)
    files = [f.name for f in directory.iterdir() if f.is_file()]
    files.sort()
    return files

# get the modification year of file
def getModificationYear(file_name):
    try:
        time_stamp = os.path.getmtime(file_name)
        time_stamp_object = datetime.fromtimestamp(time_stamp)
        year = time_stamp_object.year
        print(f"file_name: {file_name}, time_stamp: {time_stamp:.2f}, year: {year}")
        return year
    except FileNotFoundError:
        print(f"ERROR: Cannot get time stamp for the file '{file_name}' as it was not found.")
        sys.exit(1)

# append slash to path if path does not end in slash
def appendSlash(path):
    slash = "/"
    if path[-1] != slash:
        path += slash
    return path
