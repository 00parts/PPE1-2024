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
echo -e "$i \t $line"
i=$((i + 1))
done < $urls


