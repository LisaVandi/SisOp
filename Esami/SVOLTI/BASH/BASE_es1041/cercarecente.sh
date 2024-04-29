#!/bin/bash

# Scrivere uno script bash cercarecente.sh che comincia cercando tutti i file con estensione .h in
# tutte le sottodirectory della directory /usr/include/linux/ escludendo i files che si trovano
# direttamente nella directory /usr/include/linux/
# Confrontare la data di ultima modifica dei file così trovati e stampare a video il nome del file
# modificato più recentemente.

FILES=`find /usr/include/linux/ -mindepth 2 -name "*.h" -print`

for name in ${FILES} ; do
    RECENTE=""
done

for name in ${FILES} ; do 
    if [[ ${RECENTE} -ot ${name} ]] ; then 
        RECENTE=${name}
    fi
done

echo "il file più recente trovato è ${RECENTE}"
exit 0