#!/bin/bash

ARGOMENTI=$#
if (( ${ARGOMENTI} != 1 )) ; then 
    echo "numero di argomenti errato"
    exit 1
fi 
# $1 è sostituibile con ${!ARGOMENTI}
if [[ ! -e $1 ]]; then 
        echo "argomento non file" 1>&2
        exit 2
fi
( sleep 2; tail -n 3 $1 >> OUTPUT.txt)

exit 0