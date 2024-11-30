#!/bin/bash
# search_word_docs.sh

# Search all MS Word documents in the current directory for a text pattern.
# In each Word file, search the body, footnotes, endnotes, etc. for the pattern.

# input:  text pattern
# output: file names and file count for the MS Word files that contain the given pattern

# Example:
# ./search_word_docs.sh SomePattern

PATTERN=$1
NUM_MATCHING_FILES=0
TEMP_DIR=search_temp

# create temporary directory
mkdir -p ${TEMP_DIR}

echo "Searching Word documents for the pattern '${PATTERN}'."

# loop over Word files
for file in *.docx; do
    # confirm that file exists; fixes issue when no files are present
    if [[ -f "$file" ]]; then
        name="${file%.*}"
        echo " - Processing file: ${file}; name: ${name}"
        mkdir -p ${TEMP_DIR}/${name}
        cd ${TEMP_DIR}/${name}
        unzip ../../${file}
        grep -i ${PATTERN} word/*.xml | wc -l
        cd ../..
    fi
done

echo "Number of matching files: ${NUM_MATCHING_FILES}"

# remove temporary directory
rm -r ${TEMP_DIR}

echo "Done!"

