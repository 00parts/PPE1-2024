#!/usr/bin/bash

#test qui check que le dossier existe
if [ -d ~/Exercice1/ann/ ]

then

cd ~/Exercice1/ann/

for dir in */
do
echo "Annotations de lieux en ${dir%/}"
#boucle qui check si les fichiers existent dans le dossier
for i in  ~/Exercice1/ann/"$dir"/*/*.ann
do test -f "$i"
done
cat $dir/*/*.ann | egrep "Location" | wc
done

fi
