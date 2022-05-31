#!/bin/bash
# pdf_to_png.sh
# convert pdf files to png files

path=$1

# if no argument entered for path, use . as default path

# one line method to set path=.
[ "$path" = "" ] && path=.

if [[ -f $path ]]; then
    if [ ${path: -4} == ".pdf" ]; then
        pdf_file=$path
        png_file="${pdf_file%.*}.png"
        echo "Converting $pdf_file to $png_file"
        sips -s format png  $pdf_file --out $png_file
    else
        echo "ERROR: input file $path is not a .pdf file."
        exit 1
    fi
elif [[ -d $path ]]; then 
    for pdf_file in $path/*.pdf
    do
        png_file="${pdf_file%.*}.png"
        echo "Converting $pdf_file to $png_file"
        sips -s format png  $pdf_file --out $png_file
    done
else
    echo "ERROR: The path '$path' is not a file or directory."
    exit 1
fi
