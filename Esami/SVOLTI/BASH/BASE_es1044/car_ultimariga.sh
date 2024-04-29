#!/bin/bash

# cerca tutti i file che posseggono tutte le seguenti caratteristiche:
#  1. hanno estensione .h
#  2. nel nome compare un carattere f
#  3.stanno nella directory /usr/include/linux/ senza cercare nelle sue sottodirectory.
# Per ciascun file trovato bisogna:
#  - trovare il numero delle righe che quel file contiene.
#  - se il numero delle righe di quel file e' compreso tra 10 e 100 allora
#  - bisogna stampare a video il numero di caratteri dell'ultima riga di quel file.

# shellcheck disable=SC2006
FILES=`find /usr/include/linux/ -maxdepth 1 -name "*f*.h" -print`
if [[ -z ${FILES} ]] ; then
    echo "no files found"
else 
    for name in ${FILES} ; do 
        NUMLINES=`wc -l ${name}`
        NUMLINES=${NUMLINES%% *} #rimuovo fino alla fine la sottostringa più lunga che inizia con lo spazio
        if [[ ${NUMLINES} -ge 10 && ${NUMLINES} -le 100 ]] ; then
            CAR=`tail -n 1 ${name} | wc -c`
            echo ${CAR}
        fi
    done
fi