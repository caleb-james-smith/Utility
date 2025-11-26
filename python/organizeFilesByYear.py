import argparse
import sys
import tools

def main():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--directory", "-d", default="", help="Directory containing files to organize")
    options     = parser.parse_args()
    directory   = options.directory

    if not directory:
        print("Please provide a directory using the -d option.")
        sys.exit(1)
    
    organizeFilesByYear(directory)

def organizeFilesByYear(directory):
    directory = tools.appendSlash(directory)
    files = tools.getFilesInDir(directory)
    n_files = len(files)
    print(f"n_files: {n_files}")
    print(files)
    for file in files:
        file_path = directory + file
        year = str(tools.getModificationYear(file_path))
        dir_for_year = directory + year
        tools.makeDir(dir_for_year)
        tools.moveFile(file_path, dir_for_year)

if __name__ == "__main__":
    main()
