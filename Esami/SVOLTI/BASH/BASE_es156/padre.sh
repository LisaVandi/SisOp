#!/bin/bash

# Lo script padre.sh mette in esecuzione in background lo script figlio.sh 
# e si predispone per ricevere un signal SIGUSR2.
# Dopo avere ricevuto il signal SIGUSR2 il padre termina se stesso.

trap "echo \"ricevuto SIGUSR2. Termino \"; exit " SIGUSR2 

./figlio.sh &

echo "pid del figlio = $!"

while true ; do 
    echo "padre ancora in vita"
    sleep 1
done