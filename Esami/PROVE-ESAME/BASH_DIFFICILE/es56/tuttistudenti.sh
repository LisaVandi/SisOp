#!/bin/bash

#email.txt
while read MATRICOLA EMAIL ; do 
if [[ -z ${MATRICOLA} || -z ${EMAIL} ]]; then 
    echo "tuttistudenti.sh: read found no data"
    exit 1
fi 
./cercastudente.sh ${EMAIL} ${MATRICOLA}
done < email.txt