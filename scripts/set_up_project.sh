#!/bin/bash
# set_up_project.sh

AUTHOR=$1

# check if AUTHOR is empty
if [[ -z "$AUTHOR" ]]; then
    echo "ERROR: AUTHOR is empty."
    echo "Please provide an author for the project."
    exit 1
fi

echo "Bonjour, ${USER}!"

echo "Setting up project..."

mkdir -p ${AUTHOR}

mkdir -p ${AUTHOR}/00_${AUTHOR}_RAW
mkdir -p ${AUTHOR}/01_${AUTHOR}_PEtoCE
mkdir -p ${AUTHOR}/02_${AUTHOR}_CEtoAU
mkdir -p ${AUTHOR}/03_${AUTHOR}_AUtoCE
mkdir -p ${AUTHOR}/04_${AUTHOR}_CEtoPE
mkdir -p ${AUTHOR}/05_${AUTHOR}_PEtoDES
mkdir -p ${AUTHOR}/06_${AUTHOR}_PROOF

echo "Done!"

