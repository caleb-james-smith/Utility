#!/bin/bash
# separate_pdf_png.sh
# separate pdf and png files into separate directories

path=$1

# if no argument entered for path, use . as default path

# one line method to set path=.
[ "${path}" = "" ] && path=.

if [[ -d ${path} ]]; then 
    mkdir ${path}/pdf
    mkdir ${path}/png
    mv ${path}/*.pdf ${path}/pdf
    mv ${path}/*.png ${path}/png
else
    echo "ERROR: The path '${path}' is not a directory."
    exit 1
fi

