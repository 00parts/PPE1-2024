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

echo '<html><head><title>Tableau-fr</title><meta charset="UTF-8"></head><body><table><tr><th>Numéro de ligne</th><th>URL</th><th>Code HTTP</th><th>Encodage</th><th>Nombre de mots</th></tr>' > ./tableaux/tableau-fr.html

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
echo -e "<tr><td>$i</td><td>$line</td><td>$code</td><td>$charset</td><td>$count</td></tr>" >> ./tableaux/tableau-fr.html
i=$((i + 1))
done < $urls

echo '</table></body></html>' >> ./tableaux/tableau-fr.html
