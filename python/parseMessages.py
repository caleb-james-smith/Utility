import argparse
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
    print(f"Reading data from {input_file}")
    try:
        data = tools.readJson(input_file)
    except Exception:
        print(f"Failed to read JSON file '{input_file}'.")
        return
    
    print(f"Writing data to {output_file}")
    writeMessages(data, output_file)

def writeMessages(data, output_file):
    n_messages = 0
    separator = "-" * 20
    with open(output_file, "w") as file:
        file.write(separator + "\n")
        for entry in data:
            n_messages += 1

            # Write message to output file
            file.write(entry["userName"] + "\n")
            file.write("\n")
            file.write(entry["content"] + "\n")
            file.write(separator + "\n")
    
    print(f"Number of messages: {n_messages}")

if __name__ == "__main__":
    main()
