#!/bin/bash
FILES=`find /usr/include/linux/ -maxdepth 1 -name "*f*.h" -print`

if [[ -z ${FILES} ]] ; then 
    echo "car_ultimariga.sh: no file was found"
else
    for file in ${FILES} ; do 
        LINES=`wc -l ${file}`
        LINES=${LINES%% *}
        if [[ ${LINES} -gt 10 && ${LINES} -lt 100 ]] ; then 
            CAR=`tail -n 1 ${file} | wc -m`
            echo ${CAR}
        fi 
    done
fi 