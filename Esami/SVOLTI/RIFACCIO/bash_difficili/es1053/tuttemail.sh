#!/bin/bash

# Lo script legge una dopo l'altra tutte le righe del file matricola.txt, 
# estrae le informazioni NOME COGNOME MATRICOLA di ciascuno studente, 
# e per ciascuno studente chiama lo script cercaemail.sh passandogli come argomenti il NOME COGNOME MATRICOLA dello studente.

while read NOME COGNOME MATRICOLA CORSO; do
    if [[ -z ${NOME} || -z ${COGNOME} || -z ${MATRICOLA} || -z ${CORSO} ]] ; then 
        echo "tuttemail.sh: la read non ha letto niente dal file matricola.txt"
        exit 1
    fi 
    ./cercamail.sh ${NOME} ${COGNOME} ${MATRICOLA}
done < matricola.txt
