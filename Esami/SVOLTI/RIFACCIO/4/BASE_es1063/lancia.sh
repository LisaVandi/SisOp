#!/bin/bash 

# lancia l'esecuzione dello script contaseparatamente.sh passando allo script come argomenti i
# primi 7 file che si ottengono come standard output del comando ls -S1 /usr/include/*.h
# Il modo in cui lo script lancia.sh lancia l'esecuzione di contaseparatamente.sh deve ridirezionare
# sia lo standard output che lo standard error di contaseparatamente.sh sullo standard error di 
# lancia.sh stesso.

# shellcheck disable=SC2006
./contaseparatamente.sh `ls -S1 /usr/include/*.h | head -n 7` 1>&2
exit 0