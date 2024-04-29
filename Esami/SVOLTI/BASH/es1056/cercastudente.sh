#!/bin/bash
 
# vengono passati due argomenti in questo ordine: la EMAIL di uno studente e la MATRICOLA di quello studente. 
# Lo script usa al suo interno il file matricola.txt, scopre il NOME e il COGNOME dello studente la cui matricola è stata passata come argomento,
# e stampa a video la stringa: la account EMAIL appartiene allo studente NOME COGNOME.
# dove EMAIL, NOME e COGNOME sono rispettivamente la email, il nome e il cognome dello studente.

if (( $# != 2 )) ; then
    echo "cercastudenti.sh: numero di argomenti errato"
    exit 1
fi 

EMAIL=$1
MATRICOLA=$2

RIGA=`cat ./matricola.txt | grep ${MATRICOLA}`

if [[ -z ${RIGA} ]] ; then 
    echo "cercastudente.sh: read found no data"
    exit 1
fi

# shellcheck disable=SC2006
NOME=`echo ${RIGA} | cut --delimiter=" " -f 1`
# shellcheck disable=SC2006
COGNOME=`echo ${RIGA} | cut --delimiter=" " -f 2`
echo "l'account ${EMAIL} appartiene allo studente ${NOME} ${COGNOME}"

exit 0
