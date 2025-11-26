import os
import sys
from pathlib import Path
from datetime import datetime

# creates directory if it does not exist
def makeDir(dir_name):
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)

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
