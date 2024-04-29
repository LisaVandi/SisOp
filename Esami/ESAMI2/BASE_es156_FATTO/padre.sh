#!/bin/bash

./figlio.sh & 
trap "echo \"ricevuto SIGUSR2. Termino\" ; exit 99 " SIGUSR2

while true; do 
    echo "Padre ancora in vita"
    sleep 1
done 
