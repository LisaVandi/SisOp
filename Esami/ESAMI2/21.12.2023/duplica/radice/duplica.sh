#!/bin/bash

touch d2/m2.c
touch d2/Makefile2 

cp d1/m1.c d2/m2.c | sed -i 's/ciao 1/ciao 2/g' d2/m2.c
cp d1/Makefile d2/Makefile2 | sed -i 's/m1/m2/g' d2/Makefile2

cd d1
make 
./m1.exe

cd ..
cd d2
make -f Makefile2
./m2.exe