#!/usr/bin/env bash

if [ $# -ne 1 ]
then
echo "Le script demande un argument"
exit 1
fi

urls=$1

if ! [[ $urls =~ ".txt"$ ]]
then
echo "Ce n'est pas un format valide"
exit 2
fi

i=1
while read -r line
do
code=$(curl -ILs "$line" | grep "HTTP/" | cut -d' ' -f2)
charset=$(curl -ILs "$line" | grep -i "Content-Type:" | cut -d" " -f3 | cut -d"=" -f2 | sed "s/\r$//")
if [ -z "$charset" ]
then
charset="no_info"
fi
count=$(lynx "$line" -dump -nolist | wc -w)
echo -e " $i \t $line \t $code \t $charset \t $count " >> ./tableaux/tableau-fr.tsv
i=$((i + 1))
done < $urls
