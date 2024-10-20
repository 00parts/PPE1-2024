#!/usr/bin/bash

ANNEE1=2016
ANNEE2=2017
ANNEE3=2018

echo "Annotations de lieux en $ANNEE1"
cd ~/Exercice1/ann/$ANNEE1
cat */*.ann | egrep "Location" | wc
cd ../
cd $ANNEE2
echo "Annotations de lieux en $ANNEE2"
cat */*.ann | egrep "Location" | wc
cd ../
cd $ANNEE3
echo "Annotations de lieux en $ANNEE3"
cat */*.ann | egrep "Location" | wc
