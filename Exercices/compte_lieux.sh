#!/usr/bin/bash

#check qu'il y a bien trois arguments, sinon arrête le script
if [ $# -ne 3 ]
then
echo "Il faut trois arguments"
exit
fi

ANNEE=$1
MOIS=$2
NOMBRELIEUX=$3

#check que le dossier existe
if [ -d ~/Exercice1/ann ]
then
cd ~/Exercice1/ann
#check que les fichiers existent
for i in ~/Exercice1/ann/$ANNEE/$MOIS/*.ann
do
test -f "$i"
done
cat $ANNEE/$MOIS/*.ann | egrep "Location" | cut -f 3 | sort -d | uniq -c | sort -n | tail -n $NOMBRELIEUX
fi
