#!/bin/bash
FILES=`find /usr/include/linux/ -name "*.h" -print`
for file in ${FILES} ; do 
    CAR=`grep int ${file} | cut -b 3`
    echo ${CAR}
done