#!/bin/bash

TMP=filetemp.txt

while read ANNO LUOGO MOTIVO DANNO ; do 
    if [[ -z ${ANNO} || -z ${LUOGO} || -z ${MOTIVO} || -z ${DANNO} ]]; then 
        echo "raggruppa.sh: read found no data"
        exit 1
    fi
    RIPETIZIONI=`grep ${MOTIVO} cadutevic.txt | wc -l`
    echo "${MOTIVO} ${RIPETIZIONI}" >> ${TMP}
done < cadutevic.txt

sort ${TMP} | uniq
rm -f ${TMP}