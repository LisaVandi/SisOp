#!/bin/bash

if (( $# > 9 )) ; then 
    echo "numero di argomenti errato: devono essere <9"
    exit 1
fi

# Lo script scrive sullo standard output il numero totale di righe dei file passati come argomenti di indice pari.
# Lo script scrive sullo standard error il numero totale di righe dei file passati come argomenti di indice dispari.
PARI=0
DISPARI=0
NUM=1

while (( ${NUM} <= $# )); do 
    RIGHE=`wc -l ${!NUM}`
    RIGHE=${RIGHE%% *}

    if (( ${NUM} % 2 == 0 )); then 
        (( PARI=${PARI} + ${RIGHE} ))
    else 
        (( DISPARI=${DISPARI} + ${RIGHE} ))
    fi
    (( NUM=${NUM} + 1 ))
done

echo "righe totali dei file di indice pari = ${PARI}"
echo "righe totali dei file di indice dispari = ${DISPARI}" 1>&2