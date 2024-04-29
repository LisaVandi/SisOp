#!/bin/bash
./figlio.sh &

trap "echo \"PADRE: ricevuto SIGUSR2! Termino!\"; exit 99" SIGUSR2

while true; do echo "padre ancora in vita" ; sleep 1; done