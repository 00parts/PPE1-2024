fichier=$1
piedpage=$2 #986
entete=$3 #60
nombremotsmax=${4:-25}

sh ./script_exo1.sh $fichier $piedpage $entete | sort -d | uniq -c | sort -n | tail -n $nombremotsmax
