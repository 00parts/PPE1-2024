#!/usr/bin/bash

#check qu'il y a bien deux arguments, sinon arrête le script
if [ $# -ne 2 ]
then
echo "Il faut deux arguments"
exit
fi

ANNEE=$1
TYPE=$2

#check que le dossier existe
if [ -d  ~/Exercice1/ann/$ANNEE ]
then
cd ~/Exercice1/ann/$ANNEE

#check que les fichiers existent dans le dossier
for i in ~/Exercice1/ann/$ANNEE/*/*.ann
do test -f "$i"
done
cat */*.ann | egrep $TYPE | wc -l
fi
