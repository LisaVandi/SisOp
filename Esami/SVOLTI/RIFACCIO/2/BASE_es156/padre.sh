#!/bin/bash

# Lo script padre.sh mette in esecuzione in background lo script figlio.sh 
# e si predispone per ricevere un signal SIGUSR2.
# Dopo avere ricevuto il signal SIGUSR2 il padre termina se stesso

trap "echo \"RICEVUTO SIGUSR2! Termino\"; exit 99" SIGUSR2

./figlio.sh &

while true; do 
    echo "Padre ancora in vita"
    sleep 1
done