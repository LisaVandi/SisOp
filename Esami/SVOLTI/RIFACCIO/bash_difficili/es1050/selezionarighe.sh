#!/bin/bash

if [[ $# != 2 ]] ; then 
    echo "selezionarighe.sh: numero argomenti errato" 1>&2
    exit 1
fi

if [[ $# == 2 ]]; then 
    if [[ ! -e $1 ]]; then 
        echo "selezionarighe.sh: argomento non file" 1>&2
        exit 2
    fi
    ( sleep 2; echo `grep $2 $1 | wc -l` >> ./OUTPUT.txt ) &
fi
exit 0