#!/bin/bash

indice=$1
echo inizia figlio indice ${indice}

#AGGIUNGERE CODICE DA QUI
# Ciascun processo figlio ogni secondo verifica se esiste
# nella directory corrente un file che si chiama come il
# proprio indice. Se non lo trova riprova dopo un secondo.
# Se lo trova allora:
# - cancella quel file che si chiama come il proprio indice.
# - crea il file che si chiama come l'indice del figlio successivo
#   cioe' (il proprio indice piu 1) modulo 3.
# - stampa a video il proprio indice.
# Dopo avere stampato a video 3 volte il proprio indice
# allora ciascun processo figlio termina.
NUMSTAMPE=0

while true; do 
    sleep 1
    if [[ -e ${indice} ]] ; then 
        rm -f ${indice}
        touch $(( (${indice} +1) %3 ))
        echo ${indice}
        (( NUMSTAMPE=${NUMSTAMPE}+1 ))
        if (( ${NUMSTAMPE} == 3 )) ; then 
            break
        fi
    fi
done

# FINE AGGIUNTA CODICE
echo figlio indice ${indice} finisce
