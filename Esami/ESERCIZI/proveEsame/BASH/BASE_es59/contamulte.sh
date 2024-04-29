#!/bin/bash

CONT=0
VALOREMULTAPRECEDENTE=""

while read NOME COGNOME COSTO GIORNO MESE ANNO ; do 
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${COSTO} || -z ${GIORNO} || -z ${MESE} || -z ${ANNO} ]] ; then 
        echo "read found no data"
        exit 1
    fi

    # setto il primo valore
    if [[ ${VALOREMULTAPRECEDENTE} == "" ]] ; then  
        VALOREMULTAPRECEDENTE=${COSTO}
        CONT=1
    else 
        # se ho trovato un valore uguale alla riga precedente, incremento
        if [[ "${VALOREMULTAPRECEDENTE}" == "${COSTO}" ]] ; then 
            (( CONT=${CONT}+1 ))
        else 
            # se il valore è diverso, stampo il precedente 
            echo "${COSTO} ${CONT}"
            # e imposto alla situazione di partenza
            VALOREMULTAPRECEDENTE=${COSTO}
			CONT=1
        fi
    fi
done

if [[ "${VALOREMULTAPRECEDENTE}" != "" ]] ; then
	# nel file c'era qualche riga
	echo "${VALOREMULTAPRECEDENTE} ${CONT}"
fi

exit 0