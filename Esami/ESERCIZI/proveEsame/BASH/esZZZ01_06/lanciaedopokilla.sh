#!/bin/bash

for (( VAR=0; ${VAR} < 10; VAR=${VAR}+1 )); do 
    sleep 1 &
done

for (( VAR=0; ${VAR} < 10; VAR=${VAR}+1 )); do 
    kill $!   
done