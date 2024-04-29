#!/bin/bash
 
FILES=`find /usr/include/linux/ -mindepth 2 -name "*.h"`

for RECENTE in ${FILES} ; do 
    break
done 

for file in ${FILES} ; do 
    if [[ ${RECENTE} -ot ${file} ]] ; then 
        RECENTE=${file}
    fi 
done 
echo "file più recente trovato è ${RECENTE}"