#!/bin/bash

if (( $# != 0 )) ; then 
    echo "errore: init.sh non accetta argomenti da riga di comando"
    exit 1
fi 

#VIC: qui andava bene se dichiaravi d'ambiente la variabile LUNGHEZZA
# dovevi mettere   export LUNGHEZZA=4
export LUNGHEZZA=4

./forsericorsione.sh 
