#!/bin/bash
# add_prefix.sh 

# Inputs: input directory, file extension, and prefix
# Output: adds prefix to matching files (files in directory with extension)

# Syntax:
# ./add_prefix.sh directory extension prefix

# Example:
# ./add_prefix.sh images png oll_
# 01.png ---> oll_01.png
# 02.png ---> oll_02.png
# 03.png ---> oll_03.png

INPUT_DIR=$1
EXTENSION=$2
PREFIX=$3

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

# Check if PREFIX is empty
if [[ -z "$PREFIX" ]]; then
    echo "ERROR: PREFIX is empty."
    echo "Please provide a prefix as the third argument."
    exit 1
fi

# Check if directory does not exist
if [[ ! -d "$INPUT_DIR" ]]; then
    echo "ERROR: The input directory '${INPUT_DIR}' does not exist."
    echo "Please provide an existing input directory as the first argument."
    exit 1
fi

echo "Input directory: ${INPUT_DIR}"
echo "File extension: ${EXTENSION}"
echo "Prefix: ${PREFIX}"

# Go to directory
cd ${INPUT_DIR}

# Loop over files with extension in directory
for file in *.${EXTENSION}; do
    # Confirm that file exists; fixes issue when no files are present.
    if [[ -f "$file" ]]; then
        # Add prefix to file name
        echo " - Moving ${file} to ${PREFIX}${file}"
        mv "${file}" "${PREFIX}${file}"
    fi
done

cd ..

echo "Done!"

