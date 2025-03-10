#!/bin/bash
# rename_files.sh 

# Input: input directory and file extension
# Output: renames files with specific extension in directory

# Example:
# ./rename_files.sh directory extension

INPUT_DIR=$1
EXTENSION=$2

# Check if INPUT_DIR is empty
if [[ -z "$INPUT_DIR" ]]; then
    echo "ERROR: INPUT_DIR is empty."
    echo "Please provide an existing input directory as the first argument."
    exit 1
fi

# Check if EXTENSION is empty
if [[ -z "$EXTENSION" ]]; then
    echo "ERROR: EXTENSION is empty."
    echo "Please provide a file extension as the second argument."
    exit 1
fi

# Check if directory does not exist
if [[ ! -d "$INPUT_DIR" ]]; then
    echo "ERROR: The input directory '${INPUT_DIR}' does not exist."
    echo "Please provide an existing input directory as the first argument."
    exit 1
fi

# Loop over files with extension in directory
for file in ${INPUT_DIR}/*.${EXTENSION}; do
    # Confirm that file exists; fixes issue when no files are present.
    if [[ -f "$file" ]]; then
        echo " - ${file}"
    fi
done


