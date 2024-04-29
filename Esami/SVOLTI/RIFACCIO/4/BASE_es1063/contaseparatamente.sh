#!/bin/bash

# Lo script prende un numero variabile di argomenti, al massimo 9.
# Ciascun argomento è il nome di un file.
# Lo script scrive sullo standard output il numero totale di righe dei file passati come argomenti di indice pari.
# Lo script scrive sullo standard error il numero totale di righe dei file passati come argomenti di indice dispari.

if (( $# > 9 )) ; then
    echo "contaseparatamente.sh: numero di argomenti elevato"
    exit 1
fi

if (( $# == 0 )); then 
    echo echo "contaseparatamente.sh: numero di argomenti basso"
    exit 1
fi

NUMARGOMENTI=1
PARI=0
DISPARI=0

while (( NUMARGOMENTI <= $# )) ; do
    RIGHE=`wc -l ${!NUMARGOMENTI}`
    RIGHE=${RIGHE%% *} #rimuovo le righe che iniziano con spazio vuoto

    if (( ${NUMARGOMENTI}%2 == 0 )); then 
        (( PARI=${PARI}+${RIGHE} ))
    else 
        (( DISPARI=${DISPARI}+${RIGHE} ))
    fi
    (( NUMARGOMENTI=${NUMARGOMENTI}+1 ))
done

echo "numero totale di righe passate in indice pari è ${PARI}"
echo "numero totale di righe passate in indice pari è ${DISPARI}" 1>&2

exit 0