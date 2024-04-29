#!/bin/bash

if (( $# != 2 )) ; then 
    echo "numero di argomenti errato: deve essere 2"
    exit 1
fi

LARGMINIMA=$1
ALTMAX=$2

while read NOME LARGHEZZA ALTEZZA PROFONDITA ; do 
    if [[ -z ${NOME} || -z ${LARGHEZZA} || -z ${ALTEZZA} || -z ${PROFONDITA} ]] ; then 
        echo "divani.sh: read found no data"
        exit 1
    fi

    if (( ${LARGHEZZA} >= ${LARGMINIMA} && ${ALTEZZA} <= ${ALTMAX} )); then 
        echo "${NOME} ${LARGHEZZA} ${ALTEZZA} ${PROFONDITA}"
    fi
    
done < ./divani.txt