#!/bin/bash

EMAIL=$1
MATRICOLA=$2

# matricola.txt
# RIGA=`grep ${MATRICOLA} matricola.txt`
NOME=`grep ${MATRICOLA} matricola.txt | cut --delimiter=" " -f 1`
COGNOME=`grep ${MATRICOLA} matricola.txt | cut --delimiter=" " -f 2`
echo "lo studente ${NOME} ${COGNOME} con matricola ${MATRICOLA} ha mail ${EMAIL}" 