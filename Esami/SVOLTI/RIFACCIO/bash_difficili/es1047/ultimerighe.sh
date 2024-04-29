#!/bin/bash

if (( $# != 1 )) ; then 
    echo "numero argomenti errato" 1>&2
    exit 1
fi
if (( $# == 1 )) ; then 
    if [[ ! -e $1 ]] ; then 
        echo "argomento non file" 1>&2
        exit 2
    fi
    (sleep 2 ; echo `tail -n 3 $1` >> OUTPUT.TXT)
fi
exit 0