#!/bin/bash

# Lo script prende un numero variabile di argomenti, al massimo 9.
# Ciascun argomento è il nome di un file.
# Scrive sullo standard output il numero totale di righe dei file passati come argomenti di indice pari.
# Scrive sullo standard error il numero totale di righe dei file passati come argomenti di indice dispari.

INDEX=1

if (( "$#" > "9" )) ; then
    echo "numero di argomenti troppo elevato"
    exit 1
fi 

while (( "${INDEX}" <= "9" )); do
    if (( ${INDEX}%2=="0" )); then 
        NUMLINES=`wc -l ${!INDEX}`
        echo "number of lines for the file in position ${INDEX} is ${NUMLINES}"
        (( INDEX=${INDEX}+1 ))
    else 
        NUMLINES=`wc -l ${!INDEX}`
        echo "number of lines for the file in position ${INDEX} is ${NUMLINES}" 1>&2
        (( INDEX=${INDEX}+1 ))
    fi
done