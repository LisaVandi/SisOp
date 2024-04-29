#!/bin/bash

FILES=`find /usr/include/linux/netfilter/ -name "*.h" -print`
if [[ -z ${FILES} ]] ; then 
    echo "cerca.sh: no file was found"
    exit 1
fi 

# --invert-match

for FILE in ${FILES} ; do 
    NAME=`grep -v int ${FILE}`
    echo ${NAME} 
done 

exit 0