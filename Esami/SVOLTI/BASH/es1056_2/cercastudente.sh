#!/bin/bash

if (( $# != 2 )); then 
    echo "cercastudente.sh: numero di argomenti errato"
    exit 1
fi

EMAIL=$1
MATRICOLA=$2

RIGA=`cat ./matricola.txt | grep ${MATRICOLA}`
NOME=`echo ${RIGA} | cut --delimiter=" " -f 1`
COGNOME=`echo ${RIGA} | cut --delimiter=" " -f 2`

echo "lo studente ${NOME} ${COGNOME} ha mail ${EMAIL}"
exit 0