#!/bin/bash

if (( $# != 2 )) ; then 
	echo "errore: servono 2 argomenti: larghezza_minima  altezza_massima"
	exit 1
fi

LARGMIN=$1
ALTMAX=$2

# ORA nelle due variabili ci sono i parametri
# passati a riga di comando.
# Da qui in poi aggiungete quello che serve.
# Leggete il contenuto del file ./divani.txt
# ed usatelo opportunamente.

#Lo script deve stampare a video l'elenco dei divani che rispettano due proprietà:
# 1) la loro larghezza è maggiore o uguale della larghezza passata come primo argomento;
# 2) la loro altezza è minore o uguale della altezza passata come secondo argomento allo script;

while read NOME LARGHEZZA ALTEZZA PROFONDITA ; do
	if [[ ${LARGHEZZA} -ge ${LARGMIN} && ${ALTEZZA} -le ${ALTMAX} ]]; then
		echo "${NOME} ${LARGHEZZA} ${ALTEZZA} ${PROFONDITA}";
	fi
done < divani.txt