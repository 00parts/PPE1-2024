#!/usr/bin/bash


#check qu'il y a bien un argument, sinon arrête le script
if [ $# -ne 1 ]
then
echo "Il faut un argument"
exit
fi


TYPE=$1
ANNEE1=2016
ANNEE2=2017
ANNEE3=2018

#test qui check si chacun des dossiers existe
if [ -d ~/Exercice1/ann/$ANNEE1 ] && [ -d ~/Exercice1/ann/$ANNEE2 ] && [ -d ~/Exercice1/ann/$ANNEE3 ]

then

cd ~/Exercice1/ann/$ANNEE1
#check que les fichiers existent dans le dossier
for i in ~/Exercice1/ann/$ANNEE1/*/*.ann
do
test -f "$i"
done
echo "Annotations de $TYPE en $ANNEE1"
cat */*.ann | egrep $TYPE | wc -l
cd ../
cd $ANNEE2

for i in ~/Exercice1/ann/$ANNEE2/*/*.ann
do
test -f "$i"
done
echo "Annotations de $TYPE en $ANNEE2"
cat */*.ann | egrep $TYPE | wc -l
cd ../
cd $ANNEE3

for i in ~/Exercice1/ann/$ANNEE3/*/*.ann
do
test -f "$i"
done
echo "Annotations de $TYPE en $ANNEE3"
cat */*.ann | egrep $TYPE | wc -l

fi
