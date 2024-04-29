#!/bin/bash

# stampare a video il numero di parole "int" totali
# trovate tra le prime 10 parole di ciascuna riga
# del file ./prova.txt
# Attenzione, le parole che includono int non vanno contate.
# Ad esempio, le parole inta e bint non vanno contate.
# Il file passato come argomento ha 9 di queste parole int
# percio' lo script deve stampare a video 9
CONT=1

while read p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 ; do 
	for (( i=0; ${i}<10; i=${i}+1 )) ; do 
		NOME=p${i}
		if [[ ${!NOME} == "int" ]] ; then 
			(( CONT=${CONT}+1 ))
		fi
	done
done < prova.txt

echo contate ${CONT} parole con i requisiti chiesti

