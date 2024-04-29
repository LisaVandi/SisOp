#!/bin/bash

if (( $# != 3 )) ; then 
    echo "cercaemail.sh: numero di argomenti errato"
    exit 1
fi

NOME=$1
COGNOME=$2
MATRICOLA=$3

EMAIL=`grep ${MATRICOLA} email.txt | cut --delimiter=" " -f 2`
echo "l'email dello studente ${NOME} ${COGNOME} ${MATRICOLA} è ${EMAIL}"
