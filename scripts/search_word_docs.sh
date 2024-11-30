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

# Check if PATTERN is empty.
if [[ -z "$PATTERN" ]]; then
    echo "ERROR: PATTERN is empty."
    echo "Please provide a pattern to search for as the first argument."
    exit 1
fi

echo "Searching Word documents for the pattern '${PATTERN}' (case insensitive)."

# create temporary directory
mkdir -p ${TEMP_DIR}

# loop over Word files
for file in *.docx; do
    # confirm that file exists; fixes issue when no files are present
    if [[ -f "$file" ]]; then
        # remove extension from file name
        name="${file%.*}"
        
        #echo " - Processing file: ${file}; name: ${name}"
        mkdir -p ${TEMP_DIR}/${name}
        cd ${TEMP_DIR}/${name}
        unzip -qq ../../${file}
        
        # use grep and wc to find number of lines
        # containing the pattern in xml files
        num_matches=$(grep -i ${PATTERN} word/*.xml | wc -l)
        #echo "Number of matches: ${num_matches}"
        
        # determine if file contains the pattern
        if (( $num_matches > 0)); then
            echo " - ${file}"
            NUM_MATCHING_FILES=$((NUM_MATCHING_FILES + 1))
        fi
        cd ../..
    fi
done

# determine if any matching files where found
if (( $NUM_MATCHING_FILES > 0 )); then
    echo "Found ${NUM_MATCHING_FILES} file(s) containing the pattern '${PATTERN}'."
else
    echo "Found no files containing the pattern '${PATTERN}'."
fi

# remove temporary directory
rm -r ${TEMP_DIR}

echo "Done!"

