#!/bin/bash

if (( $# != 2 )) ; then 
	echo "errore: servono 2 argomenti: larghezza_minima  altezza_massima"
	exit 1
fi

LARGMIN=$1
ALTMAX=$2

# Lo script deve stampare a video l'elenco dei divani che rispettano due proprietà:
#  1) la loro larghezza è maggiore o uguale della larghezza passata come primo argomento;
#  2) la loro altezza è minore o uguale della altezza passata come secondo argomento allo script.
while read NOME LARGHEZZA ALTEZZA PROFONDITA ; do 

	if [[ -z ${NOME} || -z ${LARGHEZZA} || -z ${ALTEZZA} || -z ${PROFONDITA} ]]; then	
		echo "divani.sh: read non ha trovato informazioni"
		exit 1
	fi

	if [[ ${LARGHEZZA} -gt ${LARGMIN} && ${ALTEZZA} -lt ${ALTMAX} ]]; then 
		echo "${NOME} ${LARGHEZZA} ${ALTEZZA} ${PROFONDITA}"
	fi

done < divani.txt

exit 0