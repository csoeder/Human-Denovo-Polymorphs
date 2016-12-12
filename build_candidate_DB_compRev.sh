
subsetFilter="[HN]"
db_name=blurp
user=charlie
pswd=gr33nb34n
PRIMATOMES_FOLDER="/home/csoeder/1kGen/primateomes"


echo "ALTER TABLE orf RENAME orf_noRevComp;" | mysql $db_name --password="$pswd" --user="$user" -N ;

echo "CREATE TABLE orf SELECT * FROM orf_noRevComp;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE orf MODIFY orf_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE orf DROP COLUMN orf_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
#echo "ALTER TABLE orf ADD COLUMN orf_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N

#echo "ALTER TABLE orf ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE orf ADD COLUMN person_name varchar(20);" |  mysql $db_name --password="$pswd" --user="$user" -N
#echo "ALTER TABLE orf ADD COLUMN person_id int;" |  mysql $db_name --password="$pswd" --user="$user" -N

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating orfs for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "INSERT INTO orf (old_pk, trans, start, stop, absent_from_pdb, no_duplicates, no_pan_homologous_ORF, no_gor_homologous_ORF, unseen_in_pan_refgenome, unseen_in_gor_refgenome, person_name, person_id) SELECT DISTINCT o.orf_pk, o.trans, o.start, o.stop, o.absent_from_pdb, o.no_duplicates, o.no_pan_homologous_ORF, o.no_gor_homologous_ORF, o.unseen_in_pan_refgenome, o.unseen_in_gor_refgenome, l.person_name, l.person_id FROM orf_"$d00d" o, precandidate_lookup l WHERE o.orf_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate) AND o.trans like 'rev%';" |  mysql $db_name --password="$pswd" --user="$user" -N 

done


echo "ALTER TABLE orf ADD COLUMN sequence text;" |  mysql $db_name --password="$pswd" --user="$user" -N 

echo "SELECT person_name, trans, start, stop, orf_pk FROM orf WHERE trans LIKE 'rev%';" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/revComp/clean_assemblies.revComp.fa "$2":"$3"-"$4"~"$5}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > orf_sequence.upload.dat

echo "SELECT person_name, trans, start, stop, orf_pk FROM orf WHERE trans LIKE 'comp%';" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/mapt/clean_assemblies.fa "$2":"$3"-"$4"~"$5}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' >> orf_sequence.upload.dat

cat orf_sequence.upload.dat | awk '{print "UPDATE orf o SET o.sequence=|"$2"| where o.orf_pk="$1";"}' | tr "|" "'" |  mysql $db_name --password="$pswd" --user="$user" -N 

#mv orf_sequence.upload.dat /var/lib/mysql-files/ ; 	#	mysql is being bizarre on monstar
#echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, orf_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
#time echo "LOAD DATA INFILE 'orf_sequence.upload.dat' INTO TABLE temp (orf_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "UPDATE orf o, temp t SET o.sequence=t.sequence where o.orf_pk=t.orf_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"



echo "ALTER TABLE alignment RENAME alignment_noRevComp;" | mysql $db_name --password="$pswd" --user="$user" -N ;

echo "CREATE TABLE alignment SELECT * FROM alignment_noRevComp;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE alignment MODIFY aln_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N 

#echo "ALTER TABLE alignment DROP COLUMN aln_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
#echo "ALTER TABLE alignment ADD COLUMN aln_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N

#echo "ALTER TABLE alignment ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE alignment ADD COLUMN person_name varchar(20);" |  mysql $db_name --password="$pswd" --user="$user" -N 






for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating alignments for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "INSERT INTO alignment (old_pk, trans,chrom,start,stop,qstart,qstop,strand,no_direct_overlap,no_accumulated_overlap, person_name, person_id, block_count, block_sizes, block_starts ) SELECT DISTINCT a.aln_pk, a.trans, a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, a.no_direct_overlap,a.no_accumulated_overlap, l.person_name, l.person_id, block_count, block_sizes, block_starts FROM alignment_"$d00d" a, precandidate_lookup l WHERE a.aln_pk=l.aln_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate) AND a.trans like 'rev%';"	|  mysql $db_name --password="$pswd" --user="$user" -N 
done




echo "ALTER TABLE transcript RENAME transcript_noRevComp;" | mysql $db_name --password="$pswd" --user="$user" -N ;
echo "CREATE TABLE transcript SELECT * FROM transcript_noRevComp;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE transcript MODIFY trans_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE transcript DROP COLUMN trans_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
#echo "ALTER TABLE transcript ADD COLUMN trans_pk INTEGER AUTO_INCREMENT PRIMARY KEY" |  mysql $db_name --password="$pswd" --user="$user" -N

#echo "ALTER TABLE transcript ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE transcript ADD COLUMN person_name varchar(20);"  |  mysql $db_name --password="$pswd" --user="$user" -N 

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating transcripts for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "INSERT INTO transcript (old_pk, comp_name, person_name, source) SELECT DISTINCT t.trans_pk, t.comp_name, l.person_name, l.person_id FROM transcript_"$d00d" t, orf o, precandidate_lookup l WHERE o.trans=t.comp_name AND o.old_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate) AND t.comp_name LIKE 'rev%';"  |  mysql $db_name --password="$pswd" --user="$user" -N 

done





#echo "ALTER TABLE transcript ADD COLUMN sequenSELECT person_name, comp_name, trans_pk FROM transcript WHERE comp_name LIKE 'rev%';ce text;" |  mysql $db_name --password="$pswd" --user="$user" -N 


echo "SELECT person_name, comp_name, trans_pk FROM transcript WHERE comp_name LIKE 'rev%';" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/revComp/clean_assemblies.revComp.fa "$2"~"$3}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > trans_sequence.upload.dat

cat trans_sequence.upload.dat | awk '{print "UPDATE transcript t SET t.sequence=|"$2"| where t.trans_pk="$1";"}' | tr "|" "'" |  mysql $db_name --password="$pswd" --user="$user" -N 



#########	the revComp locus locator stumbles on apparently spliced candidates
####		this will make them at least well-defined, ie, start before stop
####		so that bedtools, etc will run
echo "SELECT chrom, start, stop, precand_pk FROM candidate WHERE stop < start;" |  mysql $db_name --password="$pswd" --user="$user" -N  | awk '{print "UPDATE candidate SET start = "$3" AND stop = "$2" WHERE precand_pk = "$4";"}' | mysql $db_name --password="$pswd" --user="$user" -N 











#mv trans_sequence.upload.dat /var/lib/mysql-files/ ; 	#	mysql is being bizarre on monstar
#echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
#echo "LOAD DATA INFILE 'trans_sequence.upload.dat' INTO TABLE temp (trans_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "UPDATE transcript s, temp t SET s.sequence=t.sequence where s.trans_pk=t.trans_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"

#echo "select person_name, trans, start, stop, orf_pk from orf where trans like '%revcomp%';" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/revComp/clean_assemblies.revComp.fa "$2":"$3"-"$4"~"$5}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > orf_sequence.upload.dat

#mv orf_sequence.upload.dat /var/lib/mysql-files/ ; 	#	mysql is being bizarre on monstar
#echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, orf_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
#time echo "LOAD DATA INFILE 'orf_sequence.upload.dat' INTO TABLE temp (orf_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "UPDATE orf o, temp t SET o.sequence=t.sequence where o.orf_pk=t.orf_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"

#echo "select person_name, comp_name, trans_pk from transcript where comp_name like '%revComp%';" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/revComp/clean_assemblies.revComp.fa "$2"~"$3}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > trans_sequence.upload.dat

#mv trans_sequence.upload.dat /var/lib/mysql-files/ ; 	#	mysql is being bizarre on monstar
#echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
#echo "LOAD DATA INFILE 'trans_sequence.upload.dat' INTO TABLE temp (trans_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "UPDATE transcript s, temp t SET s.sequence=t.sequence where s.trans_pk=t.trans_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"




