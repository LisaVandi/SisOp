#!/bin/bash

# Il figlio.sh attende 5 secondi, poi manda al padre il signal SIGUSR2 e poi termina se stesso.

sleep 5;
kill -s SIGUSR2 ${PPID}