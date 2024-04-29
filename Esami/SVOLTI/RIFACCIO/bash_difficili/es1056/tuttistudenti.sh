#!/bin/bash

# utilizza al suo interno il file email.txt. 
# Lo script legge una dopo l'altra tutte le righe del file, 
# da ciascuna riga estrae le informazioni EMAIL e MATRICOLA, 
# e per ciascuna riga chiama lo script cercastudente.sh 
# passandogli come argomenti la EMAIL e la MATRICOLA dello studente.

while read MATRICOLA EMAIL ; do 
    if [[ -z ${MATRICOLA} || -z ${EMAIL} ]]; then 
        echo "tuttistudenti.sh: read non ha trovato dati"
        exit 1
    fi

    ./cercastudente.sh ${EMAIL} ${MATRICOLA}

done < email.txt

exit 0