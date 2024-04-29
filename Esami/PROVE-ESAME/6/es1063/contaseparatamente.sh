#!/bin/bash

if (( $# > 9 )) ; then 
    echo "contaseparatamente.sh: numero di argomenti troppo elevato"
    exit 1
fi 

PARI=0
DISPARI=0
INDICE=1

while (( ${INDICE} <= $# )) ; do 
    LINES=`wc -l ${!INDICE}`
    LINES=${LINES%% *}
    if (( ${INDICE}%2 == 0 )); then   
        (( PARI=${PARI}+${LINES} )) 
    else 
        (( DISPARI=${DISPARI}+${LINES} ))
    fi 
    (( INDICE=${INDICE}+1 ))
done 

echo "totale righe dei file di indice pari = ${PARI}" 
echo "totale righe dei file di indice pari = ${DISPARI}" 1>&2
 