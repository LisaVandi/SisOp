#!/bin/bash
if (( $# > 9 )) ; then 
    echo "numero di argomenti elevato"
    exit 1
fi

INDICEPARI=0
INDICEDISPARI=0

for (( i=1; i<=$#; i++ )) ; do
    LINES=`wc -l ${!i}` # conta numero righe del file
    LINES=${LINES%% *}
    if (( ${i}%2 == 0 )) ; then 
        (( INDICEPARI=${INDICEPARI}+${LINES} ))
    else 
        (( INDICEDISPARI=${INDICEDISPARI}+${LINES} ))
    fi
done 
echo "righe totali dei file di indice pari = ${INDICEPARI}"
echo "righe totali dei file di indice dispari = ${INDICEDISPARI}" 1>&2