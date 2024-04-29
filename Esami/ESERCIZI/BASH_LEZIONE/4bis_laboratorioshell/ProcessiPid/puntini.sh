#!/bin/bash
if (( $# != 1 )) ; then 
    echo "numero di argomenti errato: solo 1"
    exit 1
fi 

if (( $1 < 0 )) ; then 
    echo "errore: argomento deve essere positivo"
    exit 1
fi

SEC=$1
PID=$$

for (( i=0; i<${SEC} ; i=${i}+1 )) ; do
    sleep 1
    echo -n ". ${PID} "
done