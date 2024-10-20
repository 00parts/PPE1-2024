#!/usr/bin/bash

ANNEE1=2016
ANNEE2=2017
ANNEE3=2018

#test qui check si chacun des dossiers existe
if [ -d ~/Exercice1/ann/$ANNEE1 ] && [ -d ~/Exercice1/ann/$ANNEE2 ] && [ -d ~/Exercice1/ann/$ANNEE3 ]

then

#boucle qui check si les fichiers existent dans le dossier
for i in  ~/Exercice1/ann/$ANNEE1/*/*.ann
do test -f "$i"
done
echo "Annotations de lieux en $ANNEE1"
cd ~/Exercice1/ann/$ANNEE1
cat */*.ann | egrep "Location" | wc
cd ../
cd $ANNEE2

for i in ~/Exercice1/ann/$ANNEE2/*/*.ann
do test -f "$i"
done
echo "Annotations de lieux en $ANNEE2"
cat */*.ann | egrep "Location" | wc
cd ../
cd $ANNEE3

for i in ~/Exercice1/ann/$ANNEE3/*/*.ann
do test -f "$i"
done
echo "Annotations de lieux en $ANNEE3"
cat */*.ann | egrep "Location" | wc

fi
