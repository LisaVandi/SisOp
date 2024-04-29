#!/bin/bash

ARGOMENTI=`ls -S1 /usr/include/*.h | head -n 7` 
./contaseparatamente.sh ${ARGOMENTI} 1>&2