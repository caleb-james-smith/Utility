import argparse
import sys
import tools

def organizeFilesByYear(directory):
    files = tools.getFilesInDir(directory)
    n_files = len(files)
    print(f"n_files: {n_files}")

def main():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--directory", "-d", default="", help="Directory containing files to organize")
    options     = parser.parse_args()
    directory   = options.directory

    if not directory:
        print("Please provide a directory using the -d option.")
        sys.exit(1)
    
    organizeFilesByYear(directory)

if __name__ == "__main__":
    main()
