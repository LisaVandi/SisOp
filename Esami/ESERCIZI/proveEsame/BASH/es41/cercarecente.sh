#!/bin/bash

RECENTE=""
FILES=`find /usr/include/linux/ -mindepth 2 -name "*.h" -print`
if [[ -z ${FILES} ]] ; then 
    echo "cercarecente.sh: no file found"
else 
    for RECENTE in ${FILES} ; do
        break;
    done
    for FILE in ${FILES}; do
        if [[ ${RECENTE} -ot ${FILE} ]]; then 
            RECENTE=${FILE}
        fi
    done
fi

echo "most recent file found was ${RECENTE}"