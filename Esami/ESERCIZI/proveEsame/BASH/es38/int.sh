#!/bin/bash

# cerca tutti i file con estensione .h nella directory /usr/include/linux/ 
# cercando anche in tutte le sue sottodirectory ad ogni livello di profondità.
# Per ciascuno dei file cosi' trovati controllare se all'interno di quel file è presente la stringa int
# Per ciascun file in cui la stringa int e' presente, per ciascuna riga che contiene la stringa int,
# stampare a video una riga con solo i primi tre caratteri della riga che contiene la stringa int

FILES=`find /usr/include/linux/ -name "*.h" -print`

for file in ${FILES}; do 
    grep int ${file} | cut --bytes=-3
done
exit 0