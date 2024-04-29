#!/bin/bash

# comincia cercando tutti i file che 
#   hanno estensione .h
#   nel nome compare un carattere f
#   stanno nella directory /usr/include/linux/ senza cercare nelle sue sottodirectory

FILES=`find /usr/include/linux/ -maxdepth 2 -name "*f*.h" -print` 

# Per ciascun file trovato bisogna:
#   - trovare il numero delle righe che quel file contiene.
#   - se il numero delle righe di quel file e' compreso tra 10 e 100 allora
#   - bisogna stampare a video il numero di caratteri dell'ultima riga di quel file.
if [[ -z ${FILES} ]] ; then 
    echo "car_ultimariga.sh: no file found"
else 
    for FILE in $FILES; do 
        LINES=`wc -l ${FILE}`
        LINES=${LINES%% *} # rimuovo dalle righe gli spazi
        if [[ ${LINES} -gt 10 && ${LINES} -lt 100 ]] ; then 
            NUM=`tail -n 1 ${FILE} | wc -m`
            echo ${NUM}
        fi
    done
fi

exit 0