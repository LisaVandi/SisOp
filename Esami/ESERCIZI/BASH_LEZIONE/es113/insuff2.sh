#!/bin/bash

while read NOME COGNOME MATRICOLA VOTO ; do 
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${MATRICOLA} || -z ${VOTO} ]] ; then 
        echo "insuff.sh: read found no data"
        exit 1
    fi

    if (( ${VOTO} < 18 )) ; then
        LINES=`grep ${MATRICOLA} RisultatiProvaPratica1.txt | wc -l`
        if [[ "${LINES}" == 0 ]] ; then
            echo ${MATRICOLA} ${NOME} ${COGNOME} ${VOTO}
        fi
    fi
done < RisultatiProvaPratica2.txt | sort -k 3

exit 0