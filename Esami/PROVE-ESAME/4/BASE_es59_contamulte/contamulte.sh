#!/bin/bash

TEMP=tmp.txt

while read NOME COGNOME AMMONTARE GIORNO MESE ANNO ; do 
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${AMMONTARE} || -z ${GIORNO} || -z ${MESE} || -z ${ANNO} ]] ; then 
        echo "contamulte.sh: read found no data"
        exit 1
    fi 
    OCCORRENZE=`grep ${AMMONTARE} multe.txt | wc -l`
    echo ${AMMONTARE} ${OCCORRENZE} >> ${TEMP}
done < multe.txt

uniq ${TEMP}
rm -f ${TEMP}