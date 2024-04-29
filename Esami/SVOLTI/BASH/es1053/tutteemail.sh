#!/bin/bash

while read NOME COGNOME MATRICOLA CORSO; do 
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${MATRICOLA} || -z ${CORSO} ]]; then
        echo "read found no data"
        exit 1
    fi
    ./cercamail.sh ${NOME} ${COGNOME} ${MATRICOLA}
done < matricola.txt
exit 0