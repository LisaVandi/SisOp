#!/bin/bash

# I voti della seconda prova li devo mettere tutti nello standard output
cat esame2.txt
echo 
# Poi devo mettere nello standard output i voti della prima prova
# ottenuti dagli studenti che non hanno un voto nella seconda prova
echo "voti degli studenti nella prima prova che non hanno un voto nella seconda prova: "
while read MATRICOLA VOTO ; do 
    if [[ -z ${MATRICOLA} || -z ${VOTO} ]] ; then 
        echo "voti.sh: read found no data"
        exit 1
    fi
    # shellcheck disable=SC2006
    LEGGO=`grep ${MATRICOLA} esame2.txt | wc -l`
    if [[ ${LEGGO} == 0 ]] ; then 
        echo ${MATRICOLA} ${VOTO}
    fi
    
done < esame1.txt
exit 0