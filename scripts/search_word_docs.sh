#!/bin/bash
# search_word_docs.sh

# Search all MS Word documents in the current directory for a text pattern.
# In each Word file, search the body, footnotes, endnotes, etc. for the pattern.

# input:  text pattern
# output: file names and file count for the MS Word files that contain the given pattern

PATTERN=$1
NUM_MATCHING_FILES=0

echo "Searching all Word documents in the current directory for the pattern '${PATTERN}'."

# loop over Word files
for file in *.docx; do
    echo $file
done

echo "Number of matching files: ${NUM_MATCHING_FILES}"

echo "Done!"

