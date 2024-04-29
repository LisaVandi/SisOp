#!/bin/bash

#Se invece quel file esiste, allora lo script deve far eseguire in background una sequenza di comandi , o di script, che:
#prima aspetta 2 secondi, e poi
#seleziona le ultime 3 righe del file e aggiunge quelle righe al file OUTPUT.txt nella directory
#in cui viene lanciato lo script.
#Nel frattempo lo script sara' terminato restituendo 0.
#Infine, scrivere uno script chiama.sh che esegue

NUMARGOMENTI=$#

if (( ${NUMARGOMENTI} != 1 )) ; then 
    echo "numero argomenti errato" 1>&2
    exit 1
else 
    if [[ ! -e $1 ]] ; then
        echo "argomento non file" 1>&2
        exit 2
    else
        ( sleep 2 ; echo `tail -n 3 $1` >> output.txt ) &
    fi
fi
exit 0
