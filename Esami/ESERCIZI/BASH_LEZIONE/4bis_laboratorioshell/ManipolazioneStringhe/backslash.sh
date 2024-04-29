#!/bin/bash
while read RIGA ; do 
    INDICE=0
    ACCUMULATO=""
    while (( ${INDICE} < ${#RIGA} )); do
    CARATTERE=${RIGA:${INDICE}:1}
        if [[ ${CARATTERE} == "*" || ${CARATTERE} == "?" || ${CARATTERE} == "[" || ${CARATTERE} == "]" ]] ; then 
            ACCUMULATO="${ACCUMULATO}\\${CARATTERE}"
        else 
            ACCUMULATO="${ACCUMULATO}${CARATTERE}"
        fi  
        (( INDICE=${INDICE}+1 ))
    done 
    echo ${ACCUMULATO}
done