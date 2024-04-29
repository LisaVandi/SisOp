#!/bin/bash

while read RIGA ; do
    # dalla riga rimuovo i due prefisso più corto #* che inizia per " e termina per "
	TERZOeQUARTO=${RIGA#\"*\"*\"*\"}
    # da ciò che ho ottenuto rimuovo il prefisso più corto #* che inizia per "
	TERZO=${TERZOeQUARTO%\"*\"*\"}
	echo "${TERZO}"
	
done < cadutevic.txt
