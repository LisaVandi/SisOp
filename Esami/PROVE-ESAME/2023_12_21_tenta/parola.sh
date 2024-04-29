#!/bin/bash

# Scrivere uno script parola.sh che usa piu' volte
# il precedente script lettera.sh
# per generare parole formate da quattro caratteri
# e visualizzarle sul proprio stdout.

for (( VAR=0; ${VAR}<4; VAR=${VAR}+1 )) ; do 
    ./lettera.sh 
done