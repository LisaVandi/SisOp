#!/bin/bash

# Scrivere uno script bash, avente nome contamulte.sh,
# che viene eseguito lanciando questa riga di comando ./contamulte.sh < multe.txt
# per ciascun valore di multa presente in quel file multe.txt, stampare una riga di testo contenente: 
#  - valore della multa  
#  - il numero di volte che quel valore si ripete nel file.

VALOREMULTAPRECEDENTE=""
CONTATORE=0

while read NOME COGNOME VALOREMULTA GIORNO MESE ANNO; do 

   if [[ -z ${NOME} || -z ${COGNOME} || -z ${VALOREMULTA} || -z ${GIORNO} || -z ${MESE} || -z ${ANNO} ]] ; then
        echo "read non ha trovato dati"
        exit 1
   fi

   if [[ "${VALOREMULTAPRECEDENTE}" == "" ]] ; then 
        #significa che sto leggendo il primo valore 
        VALOREMULTAPRECEDENTE=${VALOREMULTA}
        CONTATORE=1
        else 
            # se trovo due valori uguali, allora incremento il contatore
            if [[ "${VALOREMULTAPRECEDENTE}" == "${VALOREMULTA}" ]] ; then
                (( CONTATORE=${CONTATORE}+1 ))
            else 
                # altrimenti, stampo il precedente
                echo "${VALOREMULTAPRECEDENTE} ${CONTATORE}"

                # rinizio a contare perchè ho un valore diverso
                VALOREMULTAPRECEDENTE=${VALOREMULTA}
                CONTATORE=1
            fi
        fi
done 

# per stampare l'ultimo caso
if [[ "${VALOREMULTAPRECEDENTE}" != "" ]] ; then
    echo "${VALOREMULTAPRECEDENTE} ${CONTATORE}"
fi

exit 0