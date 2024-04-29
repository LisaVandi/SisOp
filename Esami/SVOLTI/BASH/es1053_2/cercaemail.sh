#!/bin/bash

if (( $# != 3 )); then 
    echo "cercaemail.sh: numero di argomenti errato"
    exit 1
fi

NOME=$1
COGNOME=$2
MATRICOLA=$3

RIGA=`cat email.txt | grep ${MATRICOLA}`
EMAIL=`echo ${RIGA} | cut --delimiter=" " -f 2`

echo "la email dello studente ${NOME} ${COGNOME} ${MATRICOLA} è ${EMAIL}"
exit 0 