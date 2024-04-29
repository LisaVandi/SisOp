#!/bin/bash
if (( $# != 1 )) ; then 
    echo "lanciaricorsivo.sh: 1 argomento solo"
    exit 1
fi

for (( i=0; i<$1; i=${i}+1 )); do
    if (( $1 > 0 )) ; then 
        ./lanciaricorsivo.sh $(( $1 - 1 )) & 
        echo "pid del figlio = $!"
        wait $!
    fi
done