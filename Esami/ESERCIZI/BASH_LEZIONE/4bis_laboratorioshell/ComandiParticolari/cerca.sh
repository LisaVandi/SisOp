#!/bin/bash

if (( $# != 2 )); then 
    echo "cerca.sh: numero di argomenti errato: 2"
    exit 1
fi

PERCORSO=$1
PATTERN=$2

find "${PERCORSO}" -name "${PATTERN}" -print