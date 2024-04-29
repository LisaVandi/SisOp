#!/bin/bash

# Per ciascun valore di multa presente in quel file multe.txt, 
# stampare una riga di testo contenente: 
# il valore della multa e il numero di volte che quel valore si ripete nel file.
NUM=0
FILETEMP=tmp.txt

while read NOME COGNOME VALOREMULTA GIORNO MESE ANNO ; do 
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${VALOREMULTA} || -z ${GIORNO} || -z ${MESE} || -z ${ANNO} ]] ; then
        echo "contamulte.sh: read found no data"
        exit 1
    fi
    NUM=`grep ${VALOREMULTA} multe.txt | wc -l` 
    echo ${VALOREMULTA} ${NUM} >>  ${FILETEMP}
done 

uniq ${FILETEMP}
rm -f ${FILETEMP}
