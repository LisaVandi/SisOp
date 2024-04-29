#!/bin/bash

# a cui vengono passati 3 argomenti, rispettivamente il NOME, il COGNOME e la MATRICOLA di uno studente. 
# Lo script usa al suo interno il file email.txt, scopre la EMAIL dello studente i cui dati sono stati passati come argomenti, 
# e stampa a video la stringa:
# la email dello studente NOME COGNOME MATRICOLA e' EMAIL
# dove NOME COGNOME MATRICOLA e EMAIL sono rispettivamente il nome, il cognome, la matricola e la email dello studente.

if (( $# != 3 )); then 
    echo "cercamail.sh: numero di argomenti errato"
    exit 1
fi 
MATRICOLA=$3

# shellcheck disable=SC2006
RIGA=`cat ./email.txt | grep ${MATRICOLA}`

EMAIL=`echo ${RIGA} | cut --delimiter=" " -f 2`

echo "la email dello studente $1 $2 $3 è ${EMAIL}"
exit 0
