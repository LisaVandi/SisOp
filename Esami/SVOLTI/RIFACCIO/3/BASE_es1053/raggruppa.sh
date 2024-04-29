#!/bin/bash

# Realizzare uno script bash che emette sullo standard output alcune righe. 
# In ciascuna riga compare un motivo della caduta e il numero delle volte che quella motivo è accaduto.
# Potrebbe essere utile usare qualche file temporaneo in cui salvare informazioni parziali.
# Per evitare ripetizioni di righe in output si può usare un comando uniq 
TEMP=tmp.txt

while read ANNO LUOGO MOTIVO DANNO; do
    if [[ -z ${ANNO} || -z ${LUOGO} || -z ${MOTIVO} ||-z ${DANNO} ]]; then 
        echo "raggruppa.sh: la read non ha letto dati"
        exit 1
    fi
    NUM=`grep ${MOTIVO} cadutevic.txt | wc -l`
    echo "${MOTIVO} ${NUM}" >> ${TEMP}
done < cadutevic.txt

uniq ${TEMP}
rm -f ${TEMP}