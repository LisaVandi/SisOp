#!/bin/bash

if (( $# != 2 )) ; then 
    echo "cercastudente.sh: numero di argomenti errato"
    exit 1
fi

EMAIL=$1
MATRICOLA=$2

RIGA=`cat ./matricola.txt | grep ${MATRICOLA}`
if [[ -z ${RIGA} ]] ; then 
    echo "cercastudente.sh: matricola non trovata dal file matricola.txt"
fi

# shellcheck disable=SC2006
NOME=`echo ${RIGA} | cut --delimiter=" " -f 1 `
COGNOME=`echo ${RIGA} | cut --delimiter=" " -f 2 `

echo "account ${EMAIL} appartiene allo studente ${NOME} ${COGNOME}"

exit 0