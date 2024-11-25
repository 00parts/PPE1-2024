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

echo '<html><head><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css"><title>Tableau-fr</title><meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8"></head><body><section class="hero has-background-black"><div class="hero-body"><p class="title has-text-centered has-text-success">Tableau des URLs.</p></div></section><section class="section has-background-success">
<div class="hero has-background-black is-small"><div class="hero-body"><table class="table is-bordered is-hoverable mx-auto my-6"><tr class="is-warning"><th>Numéro de ligne</th><th>URL</th><th>Code HTTP</th><th>Encodage</th><th>Nombre de mots</th></tr>' > ./tableaux/tableau-fr.html

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

echo '</table></div></div></div></div><div></section><footer class="footer has-background-black"><div class="content has-text-centered has-text-warning"><p><em>Maïwenn Plevenage / 00parts</em> - <b>2024</b></p></div></footer></body></html>' >> ./tableaux/tableau-fr.html
