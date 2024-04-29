#!/bin/bash

PRIMO=$1
SECONDO=$2
if (( $# != 2 )) ; then 
    echo "numero argomenti errato" 1>&2
    exit 1
else 
    if [[ ! -e "${PRIMO}" ]] ; then 
        echo "argomento non file" 1>&2
        exit 2
    else
        ( sleep 2 ;  grep ${SECONDO} ${PRIMO} | wc -l >> output.txt ) &
    fi
fi
exit 0