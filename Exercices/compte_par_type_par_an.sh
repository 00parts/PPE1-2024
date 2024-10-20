#!/usr/bin/bash
TYPE=$1
ANNEE1=2016
ANNEE2=2017
ANNEE3=2018

cd ~/Exercice1/ann/$ANNEE1
echo "Annotations de $TYPE en $ANNEE1"
cat */*.ann | egrep $TYPE | wc -l
cd ../
cd $ANNEE2
echo "Annotations de $TYPE en $ANNEE2"
cat */*.ann | egrep $TYPE | wc -l
cd ../
cd $ANNEE3
echo "Annotations de $TYPE en $ANNEE3"
cat */*.ann | egrep $TYPE | wc -l
