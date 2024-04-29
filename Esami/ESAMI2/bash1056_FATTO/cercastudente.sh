#!/bin/bash
EMAIL=$1
MATRICOLA=$2

NOME=`grep ${MATRICOLA} matricola.txt | cut --delimiter=" " -f 1`
COGNOME=`grep ${MATRICOLA} matricola.txt | cut --delimiter=" " -f 2`

echo lo studente ${NOME} ${COGNOME} ha mail ${EMAIL}