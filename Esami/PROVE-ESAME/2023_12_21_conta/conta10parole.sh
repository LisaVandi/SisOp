#!/bin/bash

# stampare a video il numero di parole "int" totali
# trovate tra le prime 10 parole di ciascuna riga
# del file ./prova.txt
# Attenzione, le parole che includono int non vanno contate.
# Ad esempio, le parole inta e bint non vanno contate.
# Il file passato come argomento ha 9 di queste parole int
# percio' lo script deve stampare a video 9
CONT=0;

while read PAROLA1 PAROLA2 PAROLA3 PAROLA4 PAROLA5 PAROLA6 PAROLA7 PAROLA8 PAROLA9 ; do 
    for (( i=0; i<10; i++ )) ; do 
        nome=PAROLA$i
        if [[ ${!nome} == "int" ]] ; then 
            (( CONT=${CONT}+1 ))
        fi
    done
done < prova.txt

echo numero di parole contate $CONT