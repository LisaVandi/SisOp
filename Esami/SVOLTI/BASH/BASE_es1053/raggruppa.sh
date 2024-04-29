#!/bin/bash

# emette sullo standard output alcune righe. 
# In ciascuna riga compare un motivo della caduta e il numero delle volte che quel motivo è accaduto.
# Potrebbe essere utile usare qualche file temporaneo in cui salvare informazioni parziali.
# Per evitare ripetizioni di righe in output si può usare un comando uniq che permette di eliminare le righe ripetute di un file. Usare il man per capire come funziona.
FILETEMP=temp.txt

while read ANNO LUOGO MOTIVO DANNO; do 
    if [[ -z ${ANNO} || -z ${LUOGO} || -z ${MOTIVO} || -z ${DANNO} ]]; then 
        echo "read found no data"
        exit 1
    else
        NUMVOLTE=`grep ${MOTIVO} cadutevic.txt | wc -l`
        echo "${MOTIVO} ${NUMVOLTE}" >> ${FILETEMP}
    fi
done < cadutevic.txt

uniq ${FILETEMP} #per eliminare righe duplicate
rm -f ${FILETEMP}