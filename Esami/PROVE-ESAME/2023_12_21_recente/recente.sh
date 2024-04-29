#!/bin/bash

# cercare la directory che verifica le tre seguenti proprieta':
# - sta nell'albero che parte da /usr/include/
# - contiene almeno una 'a' nel proprio nome
# - e' quella modificata piu' di recente tra tutte quelle che
#   verificano le due precedenti proprieta'.
#
# Suggerimento: per verificare se il vostro script funziona 
# creare una directory che risponda alle caratteristiche:
# essendo la directory creata piu' di recente, dovrebbe essere quella
# il risultato trovato dal vostro script.

FILES=`find /usr/include/ -name "*a*" -print`

RECENTE=""
for RECENTE in ${FILES} ; do 
    break
done

for file in ${FILES} ; do 
    if [[ ${RECENTE} -ot ${file} ]] ; then 
        RECENTE=${file}
    fi
done

echo "il file più recente con le proprietà richieste è: ${RECENTE}"