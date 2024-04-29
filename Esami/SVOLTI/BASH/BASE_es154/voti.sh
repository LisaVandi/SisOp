#!/bin/bash

# Nei commenti che seguono vedete dei suggerimenti sull'algoritmo da seguire per produrre l'output corretto.

# I voti della seconda prova li devo mettere tutti nello standard output
echo "VOTI DELLA SECONDA PROVA: "
cat esame2.txt

# Poi devo mettere nello standard output i voti della prima prova
# ottenuti dagli studenti che non hanno un voto nella seconda prova
echo ""
echo "VOTI DELLA PRIMA PROVA OTTENUTI DAGLI STUDENTI SENZA VOTO NELLA SECONDA: "
while read NUMMATRICOLA VOTO; do
    if [[ `grep ${NUMMATRICOLA} esame2.txt` == "" ]]; then
        echo "${NUMMATRICOLA} ${VOTO}"
    fi
done < esame1.txt