#!/bin/bash

# I voti della seconda prova li devo mettere tutti nello standard output
echo "voti seconda prova: "
cat esame2.txt

# Poi devo mettere nello standard output i voti della prima prova
# ottenuti dagli studenti che non hanno un voto nella seconda prova
echo "voti della prima prova degli studenti senza voto nella seconda: "
    
while read MATRICOLA VOTO ; do 
    if [[ -z ${MATRICOLA} || -z ${VOTO} ]] ; then
        echo "voti.sh: la read non ha trovato dati"
        exit 1
    fi 

    if [[ `grep ${MATRICOLA} esame2.txt | wc -l` == 0 ]] ; then 
        echo ${MATRICOLA} ${VOTO}
    fi

done < esame1.txt
