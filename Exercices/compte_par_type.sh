#!/usr/bin/bash
ANNEE=$1
TYPE=$2

cd ~/Exercice1/ann/$ANNEE
cat */*.ann | egrep $TYPE | wc -l
