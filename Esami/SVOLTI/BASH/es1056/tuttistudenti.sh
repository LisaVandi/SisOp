#!/bin/bash

# Lo script legge tutte le righe del file, da ciascuna riga estrae le informazioni EMAIL e MATRICOLA, 
# e per ciascuna riga chiama lo script cercastudente.sh 
# passandogli come argomenti la EMAIL e la MATRICOLA dello studente.

while read MATRICOLA MAIL ; do 
    if [[ -z ${MAIL} || -z ${MATRICOLA} ]] ; then 
        echo "tuttistudenti.sh: read found no data"
        exit 1
    fi

    ./cercastudente.sh ${MAIL} ${MATRICOLA}

done < email.txt

exit 0