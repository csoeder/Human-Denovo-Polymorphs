#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
pswd=$3
homebase=$(pwd)


#int auto_increment primary key
echo "###		Building a base to contain the data...."
echo "DROP DATABASE IF EXISTS "$db_name";" | mysql $db_name --password="$pswd"
echo "CREATE DATABASE "$db_name";" | mysql --password="$pswd"
echo "CREATE TABLE person ( person_pk INTEGER AUTO_INCREMENT PRIMARY KEY, person_name varchar(20));" | mysql $db_name --password="$pswd" --user="$user"
echo "CREATE TABLE transcript (trans_pk INTEGER AUTO_INCREMENT PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));" |mysql $db_name --password="$pswd" --user="$user"
echo "CREATE TABLE alignment (aln_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans int, chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | mysql $db_name --password="$pswd"
echo "CREATE TABLE orf ( orf_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans int, start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | mysql $db_name --password="$pswd"

echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name) VALUES('$d00d');" | mysql $db_name --password="$pswd" --user="$user"; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user"-N );
	time grep comp individuals/"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '|' '\t' >> temp.csv ;
done;
time echo "LOAD DATA INFILE '"$homebase"/temp.csv' INTO TABLE transcript (comp_name, source);" | mysql $db_name --password="$pswd" --user="$user" ;
#echo ".import temp.csv temp" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "INSERT INTO transcript (comp_name, source) SELECT * FROM temp;" | mysql $db_name --password="$pswd" --user="$user" ;
#echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
rm temp.csv ;

echo "###		...done uploading transcript names!"
echo "###		Uploading transcript alignments..."
# ###############
# MAKE A LIST OF ALIGNMENTS WHICH **FAIL** THE ILS_ANOM TEST
# COLLECT ALL TRANSCRIPTS WHOSE comp_name IS NOT IN THAT LIST
# THEIRS ARE THE ILS_ANOM ALIGNMENTS
# #################
#	^^ this is now done in the aligned_fork
##	annotate ILS alignments (ie, they pass Tier I)
echo "###		(limiting ourselves to ILS anomalies to save time and space)"

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N  );


#	WHY DOES THIS TAKE SO FUCKING LONG
	echo "build ils table here"
	time grep -wFf individuals/"$d00d"/ILS_anom.list individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,4,6,15,16 | sed -e 's/^/'$d00d_pk'\t/'|  awk '{print $0,"1"}' | tr ' ' '\t' > ils_alignment_table.tmp ; 
	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start bigint, stop bigint, compy varchar(50), strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean);" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "LOAD DATA INFILE '"$homebase"/ils_alignment_table.tmp' INTO TABLE temp (person_id, chrom, start, stop, compy, strand, qstart, qstop, no_direct_overlap);"| mysql $db_name --password="$pswd" --user="$user" ;
	time echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT s.trans_pk, t.chrom, t.start, t.stop, t.strand, t.qstart, t.qstop, t.no_direct_overlap FROM temp t, transcript s WHERE t.person_id=s.source AND t.compy=s.comp_name;" | mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "delete from alignment where chrom like '%Un%' or chrom like '%rand%' or chrom like '%hap%';" | mysql $db_name --password="$pswd" --user="$user" ; #	remove crap alignments



# 	echo "SELECT trans_pk,comp_name FROM transcript WHERE source=$d00d_pk;" | mysql $db_name --password="$pswd" --user="$user" | tr '|' '\t' > transcripts.list ; 
# 	time while read compy; do 
# 		#awk -v potato="$(echo $line | cut -f 1,2,3,6 -d ' ')" '{if($2=="'$compy'")print $1, potato, TRUE}' transcripts.list | tr ' ' '|' >> ils_alignment_table.tmp ;
# 		trans_pk=$(grep -w $compy transcripts.list | cut -f 1) ;
# 		grep -w "$compy" individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,6 | sed -e 's/^/'$trans_pk'\t/' |  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' >> ils_alignment_table.tmp
# 	done < individuals/"$d00d"/ILS_anom.list ;

# #	echo "CREATE TABLE temp (trans int, chrom varchar(20), start bigint, stop bigint, strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk) );" | mysql $db_name --password="$pswd" --user="$user" ;
# 	echo "CREATE TABLE temp (trans int, chrom varchar(20), start bigint, stop bigint, strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean);" | mysql $db_name --password="$pswd" --user="$user" ;
# 	echo ".import ils_alignment_table.tmp temp" | mysql $db_name --password="$pswd" --user="$user" ;
# 	echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT * FROM temp;" | mysql $db_name --password="$pswd" --user="$user" ;
# 	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
# 	echo "delete from alignment where chrom like '%Un%' or chrom like '%rand%' or chrom like '%hap%';" | mysql $db_name --password="$pswd" --user="$user" ; #	remove crap alignments
# 	rm ils_alignment_table.tmp ; 
# 	rm transcripts.list ; 

done;
echo "###		ILS anomalies uploaded!"


echo "###		Annotate alignments re: accumulation..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user"-N );
#	awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time cat sql_upload.tmp | mysql $db_name --password="$pswd" --user="$user" ;
	cut -f 1,2,3,4 individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed | sed -e 's/^/'$d00d_pk'\t/' > accumulationClean.dat.tmp

	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start int, stop int, comp_name varchar(50) );" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "LOAD DATA INFILE '"$homebase"/accumulationClean.dat.tmp' INTO TABLE temp (person_id, chrom, start, stop, comp_name);"| mysql $db_name --password="$pswd" --user="$user" ;
#	time echo ".import accumulationClean.dat.tmp temp" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.aln_pk IN (SELECT a.aln_pk FROM alignment a, temp t, transcript s WHERE a.chrom=t.chrom AND a.start=t.start AND a.stop=t.stop AND a.trans=s.trans_pk AND t.comp_name=s.comp_name AND t.person_id=s.source);"| mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
	rm accumulationClena.dat.tmp;
#	rm sql_upload.tmp ; 
done
echo "###		.... done annotating accumulation!"

echo "###		Annotate alignments re: lowcoverage ..."

echo "ALTER TABLE alignment ADD COLUMN lowcov_warning boolean;" | mysql $db_name --password="$pswd" --user="$user" ;
echo "UPDATE alignment SET lowcov_warning=0;" | mysql $db_name --password="$pswd" --user="$user" ;

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user"-N );
	cat individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning | sed -e 's/^/'$d00d_pk'\t/'  > lowCov_warning.tmp ;
	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start int, stop int, comp_name varchar(50), strand varchar(2));" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "LOAD DATA INFILE '"$homebase"/lowCov_warning.tmp' INTO TABLE temp (person_id, chrom, start, stop, comp_name);"| mysql $db_name --password="$pswd" --user="$user" ;
	time echo "UPDATE alignment SET lowcov_warning=1 WHERE alignment.aln_pk IN (SELECT a.aln_pk FROM alignment a, temp t, transcript s WHERE a.chrom=t.chrom AND a.start=t.start AND a.stop=t.stop AND a.trans=s.trans_pk AND t.comp_name=s.comp_name AND t.person_id=s.source);"| mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
	#	pull out the coverage of each alignment region, warn if it bottoms out (ie, <= 1) 
	rm lowCov_warning.tmp ;
done;


###	upload ORFS 
echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user"-N );
	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | mysql $db_name --password="$pswd" --user="$user" | sed -e 's/|/x|/'| tr '|' '\t' > transcripts.listx 
#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | mysql $db_name --password="$pswd" --user="$user" | sed -e 's/|/|\t/' | awk '{print $1"x",$2}' | tr ' ' '\t' > transcripts.listx ; 
#	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > precleaned_ORFs.predat.tmp ;
	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" |  sed -e 's/^/'$d00d_pk'|/' | tr ':' '|' | tr '-' '|' > precleaned_ORFs.dat.tmp ;
	##	this is an awkward hack so that the pattern comp_c_seq1 can be distinguished from comp_c_seq11.... it matches the terminal x as well 
	#time sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' transcripts.listx | sed -f - precleaned_ORFs.predat.tmp > precleaned_ORFs.dat.tmp ;
	###	this renames the comp to the trancript PK
	###	SOURCE: http://www.unix.com/shell-programming-and-scripting/83872-want-replace-some-words-other-list.html

#	echo "CREATE TABLE temp (trans int, start int, stop int, FOREIGN KEY(trans) REFERENCES transcript(trans_pk) );" | mysql $db_name --password="$pswd" --user="$user" ;
#	echo "CREATE TABLE temp (trans int, start int, stop int );" | mysql $db_name --password="$pswd" --user="$user" ;
	echo "CREATE TABLE temp (person_id int, comp_name varchar(50), start int, stop int );" | mysql $db_name --password="$pswd" --user="$user" ;
#	echo ".import precleaned_ORFs.dat.tmp temp" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "LOAD DATA INFILE '"$homebase"/precleaned_ORFs.dat.tmp' INTO TABLE temp (person_id, comp_name, start, stop);"| mysql $db_name --password="$pswd" --user="$user" ;
#	echo "INSERT INTO orf (trans, start, stop) SELECT * FROM temp;" | mysql $db_name --password="$pswd" --user="$user" ;
	time echo "INSERT INTO orf (trans, start, stop) SELECT s.trans_pk, t.start, t.stop FROM temp t, transcript s WHERE t.comp_name=s.comp_name and t.person_id=s.source;"| mysql $db_name --password="$pswd" --user="$user" ;
	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;
	rm precleaned_ORFs.dat.tmp ; 
#	rm transcripts.listx ; 
done
echo "###		... done uploading ORFs!"





