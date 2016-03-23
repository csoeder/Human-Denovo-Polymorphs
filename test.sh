#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)




echo "###		Distilling precandidates..."

echo "CREATE TABLE precandidate (precand_pk INTEGER AUTO_INCREMENT PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2), full_sneakthrough_ILS int, full_sneakthrough_accum int, full_sneakthrough_other int, fragmentary_lookback int, blast_ghosts int);" | mysql $db_name --password="$pswd" --user="$user" ;

echo "CREATE TABLE precandidate_lookup (precandlookup_pk INTEGER AUTO_INCREMENT PRIMARY KEY, orf_id int, aln_id int, person_id int, person_name varchar(20), precand_id int, FOREIGN KEY(person_id) REFERENCES person(person_pk), FOREIGN KEY(precand_id) REFERENCES precandidate(precand_pk) ); " | mysql $db_name --password="$pswd" --user="$user" ;



for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk, t.comp_name, a.aln_pk FROM alignment_"$d00d" a, orf_"$d00d" o, transcript_"$d00d" t WHERE a.trans=o.trans AND t.comp_name=a.trans AND o.absent_from_pdb=1 AND o.no_duplicates=1 AND o.no_pan_homologous_ORF=1 AND o.no_gor_homologous_ORF=1 AND a.no_direct_overlap=1 AND a.no_accumulated_overlap=1; " | mysql $db_name --password="$pswd" --user="$user" -N > glunk.tmp ;
	
#	2a. # grep "+" table.tmp | tr '|' '\t' |  awk '{print $1":"$2+$7-$4"-"$3-$5+$8, $10":"$7"-"$8}'
###	coordinate change from comp:a-b to chr:x-y. x=tstart+a-qstart; y=tend-qend+b
	grep "+" glunk.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6}' | tr ' ' '\t' > uploads.tmp
	grep "+" glunk.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6, $9, $11}' | tr ' ' '\t' > lookup.tmp
#	2b. # grep "-" table.tmp | tr '|' '\t' | awk '{print $1":"$5+$2-$8"-"$4+$3-$7, $10":"$7"-"$8}'
###	rev strand: 	x=qend-b+tstart ; y=qstart+tend-a
	grep "-" glunk.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6}' | tr ' ' '\t' >> uploads.tmp
	grep "-" glunk.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6,$9,$11}' | tr ' ' '\t' >> lookup.tmp

	sudo cp uploads.tmp /var/lib/mysql/"$db_name"/ ; 
#	echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2));" | mysql $db_name --password="$pswd" --user="$user" ;
	echo "CREATE TABLE temp (chrom varchar(20), start bigint, stop bigint, strand varchar(2));" | mysql $db_name --password="$pswd" --user="$user" ;
	echo "LOAD DATA INFILE 'uploads.tmp' INTO TABLE temp (chrom, start, stop, strand);" | mysql $db_name --password="$pswd" --user="$user" ;


	echo "INSERT  INTO precandidate (chrom, start, stop, strand) SELECT DISTINCT t.chrom, t.start, t.stop, t.strand FROM temp t  WHERE NOT EXISTS ( SELECT precand_pk FROM precandidate p WHERE p.chrom = t.chrom AND p.start = t.start AND p.stop=t.stop AND p.strand=t.strand );" | mysql $db_name --password="$pswd" --user="$user" ;

#	echo "INSERT IGNORE INTO precandidate (chrom, start, stop, strand) SELECT t.chrom, t.start, t.stop, t.strand FROM temp t  WHERE NOT EXISTS ( SELECT precand_pk FROM precandidate p WHERE p.chrom = t.chrom AND p.start = t.start AND p.stop=t.stop AND p.strand=t.strand );" | mysql $db_name --password="$pswd" --user="$user" ;

#	echo "INSERT IGNORE INTO precandidate (chrom, start, stop, strand) SELECT t.chrom, t.start, t.stop, t.strand FROM temp t ;" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;

	awk '{print "SELECT  precand_pk  FROM precandidate WHERE chrom=\""$1"\" AND start="$2" AND stop="$3" AND strand=\""$4"\";" }' uploads.tmp |  mysql $db_name --password="$pswd" --user="$user"  -N | paste lookup.tmp - | awk '{print "INSERT INTO precandidate_lookup (orf_id, aln_id, precand_id, person_id, person_name) VALUES ("$5", "$6", "$7", "'$d00d_pk'", \"""'$d00d'""\");" }'

	awk '{print "SELECT  precand_pk  FROM precandidate WHERE chrom=\""$1"\" AND start="$2" AND stop="$3" AND strand=\""$4"\";" }' uploads.tmp |  mysql $db_name --password="$pswd" --user="$user"  -N | paste lookup.tmp - | awk '{print "INSERT INTO precandidate_lookup (orf_id, aln_id, precand_id, person_id, person_name) VALUES ("$5", "$6", "$7", "'$d00d_pk'", \"""'$d00d'""\");" }' | mysql $db_name --password="$pswd" --user="$user" -N


done;







