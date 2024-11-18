fichier=$1
piedpage=$2 #986
entete=$3 #60

head -n +$piedpage $fichier | tail -n +$entete | egrep -o  "\b\w*\b" | tr -d [[:punct:]] | tr [[:upper:]] [[:lower:]]
