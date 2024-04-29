#!/bin/bash

# cerca tutti i file con estensione .h in tutte le sottodirectory della directory /usr/include/linux/ 
# escludendo i files che si trovano direttamente nella directory /usr/include/linux/
FILES=`find /usr/include/linux/ -mindepth 2 -name "*.h" -print`

if [[ -z ${FILES} ]] ; then 
    echo "cercarecente.sh: no file found"
    exit 1
fi 

RECENTE=""
for RECENTE in ${FILES} ; do 
    break 
done 

for file in ${FILES} ; do 
    if [[ ${RECENTE} -ot ${file} ]] ; then 
        RECENTE=${file}
    fi 
done

# Confrontare la data di ultima modifica dei file così trovati 
# e stampare a video il nome del file modificato più recentemente

echo "most recent file found is ${RECENTE}"