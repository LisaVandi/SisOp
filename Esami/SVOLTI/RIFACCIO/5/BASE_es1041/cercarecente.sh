#!/bin/bash

# cercando tutti i file con estensione .h in tutte le sottodirectory della directory /usr/include/linux/ 
# escludendo i files che si trovano direttamente nella directory /usr/include/linux/
# Confrontare la data di ultima modifica dei file così trovati e stampare a video il nome del file modificato più recentemente.

FILES=`find /usr/include/linux/ -mindepth 2 -name "*.h" -print` 
if [[ -z ${FILES} ]]; then  
    echo "cercarecente.sh: nessun file trovato"
    exit 1
fi

RECENTE=""
for RECENTE in ${FILES} ; do
    break;
done

for name in ${FILES}; do
    if [[ ${RECENTE} -ot ${name} ]]; then
        RECENTE=${name}
    fi
done

echo "il file trovato più recente è ${RECENTE}"