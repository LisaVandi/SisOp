#!/bin/bash
while read LINES ; do
    PRIMA="${LINES%% *}"
    echo ${PRIMA} 1>&2
    echo "EVVIVA" 0>&1
done 
exit 0