fichier=$1
piedpage=$2 #986
entete=$3 #60
nombremotsmax=${4:-25}

sh ./script_exo1.sh $fichier $piedpage $entete > ./row1.txt
sh ./script_exo1.sh $fichier $piedpage $entete | tail +2 > ./row2.txt
paste -d" " ./row1.txt ./row2.txt | sort -d | uniq -c | sort -n | tail -n $nombremotsmax
