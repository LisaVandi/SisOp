#!/bin/bash

# Ciascun processo figlio ogni secondo verifica se esiste
# nella directory corrente un file che si chiama come il
# proprio indice. Se non lo trova riprova dopo un secondo.
# Se lo trova allora:
# - cancella quel file che si chiama come il proprio indice.
# - crea il file che si chiama come l'indice del figlio successivo
#   cioe' (il proprio indice piu 1) modulo 3.
# - stampa a video il proprio indice.
# In tal modo i figli si scambiano una specie di turno,
# stampando uno dopo l'altro il proprio indice.
# Dopo avere stampato a video 3 volte il proprio indice
# allora ciascun processo figlio termina.


indice=$1
echo inizia figlio indice ${indice}
#AGGIUNGERE CODICE DA QUI 

CONT=0 #contatore per il max numero di stampe
while true ; do 
    sleep 1 #aspetta 1 secondo
    if [[ -e ${indice} ]] ; then 
        rm -f ${indice}
        touch $(( (${indice} + 1) % 3 ))
        echo ${indice}
        (( CONT=${CONT}+1 )) #incremento il contatore per il max numero di stampe
    fi 
    if (( CONT==3 )) ; then 
        break
    fi
done 

# FINE AGGIUNTA CODICE
echo figlio indice ${indice} finisce