#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)


for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo "DROP TABLE transcript_"$d00d";" |mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE alignment_"$d00d";" |mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE orf_"$d00d";" |mysql $db_name --password="$pswd" --user="$user" ;
done
echo "DROP TABLE precandidate;" |mysql $db_name --password="$pswd" --user="$user" ;
echo "DROP TABLE precandidate_lookup;" |mysql $db_name --password="$pswd" --user="$user" ;

echo "DROP TABLE person ;" | mysql $db_name --password="$pswd" --user="$user"

