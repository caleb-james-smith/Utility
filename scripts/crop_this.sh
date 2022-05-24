#!/bin/bash
# crop_this.sh
# crop pdf files

# TODO: add support for png files

path=$1

# if no argument entered for path, use . as default path

# one line method to set path=.
[ "$path" = "" ] && path=.

if [[ -f $path ]]; then
    if [ ${path: -4} == ".pdf" ]; then
        pdf_file=$path
        pdfcrop $pdf_file
    else
        echo "ERROR: input file $path is not a .pdf file."
        exit 1
    fi
elif [[ -d $path ]]; then 
    for pdf_file in $path/*.pdf
    do
        pdfcrop $pdf_file
    done
else
    echo "ERROR: The path '$path' is not an file or directory."
    exit 1
fi
