#!/usr/bin/bash

ANNEE=$1
MOIS=$2
NOMBRELIEUX=$3

cd ~/Exercice1/ann
cat $ANNEE/$MOIS/*.ann | egrep "Location" | cut -f 3 | sort -d | uniq -c | sort -n | tail -n $NOMBRELIEUX
