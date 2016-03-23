#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
homebase=$(pwd)

PRIMATOMES_FOLDER="/home/csoeder/1kGen/primateomes"
#int auto_increment primary key
echo "###		Building a base to contain the data...."
echo "CREATE TABLE person ( person_pk INTEGER PRIMARY KEY, person_name varchar(20), rna_seq boolean );" | sqlite3 $db_name


echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name, rna_seq) VALUES('$d00d', 1);" | sqlite3 $db_name ;
	echo "CREATE TABLE transcript_"$d00d" (trans_pk INTEGER PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));" |sqlite3 $db_name
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_name );

	grep comp individuals/"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|'  >> temp.csv ;
#	mv temp.csv /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
#	echo "LOAD DATA INFILE 'temp.csv' INTO TABLE transcript_"$d00d" (comp_name, source);" | sqlite3 $db_name ;
	echo "CREATE TABLE temp (comp_name varchar(50), source int);" |sqlite3 $db_name
	echo ".import temp.csv temp" | sqlite3 $db_name ;
	echo "INSERT INTO transcript_$d00d (comp_name, source) SELECT * FROM temp;"|sqlite3 $db_name;
	echo "DROP TABLE temp;" |sqlite3 $db_name
done;


