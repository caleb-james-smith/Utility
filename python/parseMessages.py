import argparse
import json
import sys
import tools

def main():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("--input_file",     "-i", default="", help="Input JSON file to read messages")
    parser.add_argument("--output_file",    "-o", default="", help="Output text file to write messages")
    
    options = parser.parse_args()
    input_file = options.input_file
    output_file = options.output_file

    if not input_file:
        print("Please provide an input JSON file using the -i option.")
        sys.exit(1)

    if not output_file:
        print("Please provide an output text file using the -o option.")
        sys.exit(1)

    parseMessages(input_file, output_file)

def parseMessages(input_file, output_file):
    try:
        data = tools.readJson(input_file)
    except Exception:
        print(f"Failed to read JSON file '{input_file}'.")

if __name__ == "__main__":
    main()
