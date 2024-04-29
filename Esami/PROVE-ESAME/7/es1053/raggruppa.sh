#!/bin/bash

TEMP=file.txt
while read ANNO LUOGO MOTIVO DANNO ; do 
    if [[ -z ${ANNO} || -z ${LUOGO} || -z ${MOTIVO} || -z ${DANNO} ]] ; then 
        echo "raggruppa.sh: read found no data"
        exit 1
    fi 

    OCCORRENZE=`grep ${MOTIVO} cadutevic.txt | wc -l`
    echo "${MOTIVO} ${OCCORRENZE}" >> ${TEMP}

done < cadutevic.txt

sort ${TEMP} | uniq
rm -f ${TEMP}
