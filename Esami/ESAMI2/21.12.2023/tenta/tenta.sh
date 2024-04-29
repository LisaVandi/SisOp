#!/bin/bash

# Infine, scrivere uno script tenta.sh che
# invoca piu 'volte lo script parola.sh
# fino a che riesce a generare casualmente la
# parola "cacc".
# Se genera una parola diversa allora lo script
# riprova a generare ancora una nuova parola
# e cosi' via.
# Quando lo script riesce a generare la parola cacc
# allora lo script stampa a video
# la parola "cacc" ed il numero di volte che ho
# dovuto generare parole fino a trovare 
# quella giusta, poi termina. 

TENTATIVI=1
while true; do 
	PAROLACREATA=`./parola.sh`
	if [[ ${PAROLACREATA} == "cacc" ]] ; then 
		echo ${PAROLACREATA} ${TENTATIVI}
		break
	else 
		(( TENTATIVI=${TENTATIVI}+1 ))
		./parola.sh
	fi 
done