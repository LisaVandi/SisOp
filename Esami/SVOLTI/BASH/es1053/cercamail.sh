#!/bin/bash

NOME=$1
COGNOME=$2
MATRICOLA=$3

if (( $# != 3 )) ; then 
    echo "numero argomenti errato: ne servono tre"
    exit 1
fi

# shellcheck disable=SC2006
RIGA=`cat email.txt | grep ${MATRICOLA}`

if [[ -z ${RIGA} ]]; then 
    echo "read found no data"
    exit 1
fi
    
# shellcheck disable=SC2006
MAIL=`echo ${RIGA} | cut --delimiter=" " -f 2`     

echo "la email dello studente ${NOME} ${COGNOME} ${MATRICOLA} è ${MAIL}"

exit 0