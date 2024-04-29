#!/bin/bash
COPIA=${PATH}
while [[ -n ${COPIA} ]]; do 
    PERCORSO=${COPIA%%:*} #rimuovo la stringa più lunga che inizia con : 
    echo ${PERCORSO}
    COPIAPRECEDENTE=${COPIA}
    COPIA=${COPIA#*:} #rimuovo la stringa più corta che termina con :
    if [[ ${COPIAPRECEDENTE} == ${COPIA} ]] ; then
        break
    fi
done