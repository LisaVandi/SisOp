#!/bin/bash
NOME=$1
COGNOME=$2
MATRICOLA=$3

MAIL=`grep ${MATRICOLA} email.txt | cut --delimiter=" " -f 2`
echo la email dello studente ${NOME} ${COGNOME} ${MATRICOLA} è ${MAIL}