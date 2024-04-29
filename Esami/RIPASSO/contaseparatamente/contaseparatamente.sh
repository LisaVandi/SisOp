#!/bin/bash

if (( $# > 9 )) ; then 
    echo "numero di argomenti troppo elevato"
    exit 1
fi 

PARI=0
DISPARI=0
INDICE=1

while (( ${INDICE} <= $# )) ; do 
    RIGHE=`wc -l ${!INDICE}`
    RIGHE=${RIGHE%% *}
    if (( ${INDICE}%2 == 0 )) ; then 
        (( PARI=${PARI}+${RIGHE} ))
    else 
        (( DISPARI=${DISPARI}+${RIGHE} ))
    fi
    (( INDICE=${INDICE}+1 ))
done

echo numero totale di righe dei file passati come argomenti di indice pari è ${PARI} 
echo numero totale di righe dei file passati come argomenti di indice dispari è ${DISPARI} 1>&2 
