#!/bin/bash

#VIC: qui non dovevi riassegnare il valore di LUNGHEZZA,
# L'idea era buona, quasi ok.

# genero casualmente la prima e ultima lettera della stringa
PRIMAEULTIMA=`./generacar.sh` 
(( LUNGHEZZA=${LUNGHEZZA}-1 )) 

#VIC: qui non dovevi fare il ciclo for ma UNA SOLA chiamata a forse ricorsione.
# Il motivo per cui ti si bloccava la macchina era che questo script faceva creare
# un numero enorme di esecuzioni di script, che sovraccaricavano la macchina.
if (( ${LUNGHEZZA} > 0 )) ; then 
    echo -n ${PRIMAEULTIMA}$(./forsericorsione.sh)${PRIMAEULTIMA}
else 
     echo -n ${PRIMAEULTIMA}${PRIMAEULTIMA}
fi 
exit 1
