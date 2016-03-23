#!/bin/sh

db_file=$1
#db_file=deNovo.db
subsetFilter=$2

date > "$subsetFilter".timelog;


echo "###		Building a base to contain the data...."
echo "CREATE TABLE person ( person_pk INTEGER PRIMARY KEY, person_name varchar(20));" | sqlite3 $db_file
echo "CREATE TABLE transcript (trans_pk INTEGER PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));" | sqlite3 $db_file
echo "CREATE TABLE alignment (aln_pk INTEGER PRIMARY KEY, trans int, chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | sqlite3 $db_file
echo "CREATE TABLE orf ( orf_pk INTEGER PRIMARY KEY, trans int, start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | sqlite3 $db_file

echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls ../1kGen/individuals// | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name) VALUES('$d00d');" | sqlite3 $db_file; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	grep comp ../1kGen/individuals//"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '\t' '|' >> temp.csv ;
done;
echo "CREATE TABLE temp (comp_name varchar(50), int source);" | sqlite3 $db_file ;
echo ".import temp.csv temp" | sqlite3 $db_file ;
echo "INSERT INTO transcript(comp_name, source) SELECT * FROM temp;" | sqlite3 $db_file ;
echo "DROP TABLE temp;" | sqlite3 $db_file ;
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
echo "ILS_upload times" >> "$subsetFilter".timelog;
for d00d in $(ls ../1kGen/individuals// | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file );


#	WHY DOES THIS TAKE SO FUCKING LONG

	# time grep -wFf ../1kGen/individuals//"$d00d"/ILS_anom.list ../1kGen/individuals//"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,4,6,15,16 | sed -e 's/^/'$d00d_pk'\t/'|  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' > ils_alignment_table.tmp ; 
	# echo "CREATE TABLE temp (person_id int, chrom varchar(20), start bigint, stop bigint, compy varchar(50), strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean);" | sqlite3 $db_file ;
	# time echo ".import ils_alignment_table.tmp temp" | sqlite3 $db_file ;
	# time echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT s.trans_pk, t.chrom, t.start, t.stop, t.strand, t.qstart, t.qstop, t.no_direct_overlap FROM temp t, transcript s WHERE t.person_id=s.source AND t.compy=s.comp_name;" | sqlite3 $db_file ;
	# echo "DROP TABLE temp;" | sqlite3 $db_file ;
	# echo "delete from alignment where chrom like '%Un%' or chrom like '%rand%' or chrom like '%hap%';" | sqlite3 $db_file ; #	remove crap alignments



	echo "SELECT trans_pk,comp_name FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | tr '|' '\t' > transcripts.list ; 
	time while read compy; do 
		#awk -v potato="$(echo $line | cut -f 1,2,3,6 -d ' ')" '{if($2=="'$compy'")print $1, potato, TRUE}' transcripts.list | tr ' ' '|' >> ils_alignment_table.tmp ;
		trans_pk=$(grep -w $compy transcripts.list | cut -f 1) ;
		grep -w "$compy" ../1kGen/individuals//"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,6 | sed -e 's/^/'$trans_pk'\t/' |  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' >> ils_alignment_table.tmp
	done < ../1kGen/individuals//"$d00d"/ILS_anom.list ;

#	echo "CREATE TABLE temp (trans int, chrom varchar(20), start bigint, stop bigint, strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk) );" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (trans int, chrom varchar(20), start bigint, stop bigint, strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean);" | sqlite3 $db_file ;
	echo ".import ils_alignment_table.tmp temp" | sqlite3 $db_file ;
	echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT * FROM temp;" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	echo "delete from alignment where chrom like '%Un%' or chrom like '%rand%' or chrom like '%hap%';" | sqlite3 $db_file ; #	remove crap alignments
	rm ils_alignment_table.tmp ; 
	rm transcripts.list ; 

done;
echo "###		ILS anomalies uploaded!"



##	annotate accumulated alignments (ie, they pass Tier II )
##	look in mapt/Tier2_clean_assemblies
echo "###		Annotate alignments re: accumulation..."
for d00d in $(ls ../1kGen/individuals// | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
#	awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' ../1kGen/individuals//"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' ../1kGen/individuals//"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time cat sql_upload.tmp | sqlite3 $db_file ;
	cut -f 1,2,3,4 ../1kGen/individuals//"$d00d"/mapt/accumulation_clean_assemblies.bed | sed -e 's/^/'$d00d_pk'\t/' | tr '\t' '|' > accumulationClean.dat.tmp
	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start int, stop int, comp_name varchar(50) );" | sqlite3 $db_file ;
	time echo ".import accumulationClean.dat.tmp temp" | sqlite3 $db_file ;
	time echo "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.aln_pk IN (SELECT a.aln_pk FROM alignment a, temp t, transcript s WHERE a.chrom=t.chrom AND a.start=t.start AND a.stop=t.stop AND a.trans=s.trans_pk AND t.comp_name=s.comp_name AND t.person_id=s.source);"| sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm accumulationClena.dat.tmp;
#	rm sql_upload.tmp ; 
done
echo "###		.... done annotating accumulation!"


echo "###		Annotate alignments re: lowcoverage ..."

#	


echo "ALTER TABLE alignment ADD COLUMN lowcov_warning boolean;" | sqlite3 $db_file ;
echo "UPDATE alignment SET lowcov_warning=0;" | sqlite3 $db_file ;

for d00d in $(ls ../1kGen/individuals// | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	cat ../1kGen/individuals//"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning | sed -e 's/^/'$d00d_pk'\t/' | tr '\t' '|' > lowCov_warning.tmp ;
	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start int, stop int, comp_name varchar(50), strand varchar(2));" | sqlite3 $db_file ;
	time echo ".import lowCov_warning.tmp temp" | sqlite3 $db_file ;
	time echo "UPDATE alignment SET lowcov_warning=1 WHERE alignment.aln_pk IN (SELECT a.aln_pk FROM alignment a, temp t, transcript s WHERE a.chrom=t.chrom AND a.start=t.start AND a.stop=t.stop AND a.trans=s.trans_pk AND t.comp_name=s.comp_name AND t.person_id=s.source);"| sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	#	pull out the coverage of each alignment region, warn if it bottoms out (ie, <= 1) 
	rm lowCov_warning.tmp ;
done;


###	upload ORFS 
echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls ../1kGen/individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/x|/'| tr '|' '\t' > transcripts.listx 
#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/|\t/' | awk '{print $1"x",$2}' | tr ' ' '\t' > transcripts.listx ; 
#	grep ">" ../1kGen/individuals//"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > precleaned_ORFs.predat.tmp ;
	grep ">" ../1kGen/individuals//"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" |  sed -e 's/^/'$d00d_pk'|/' | tr ':' '|' | tr '-' '|' > precleaned_ORFs.dat.tmp ;
	##	this is an awkward hack so that the pattern comp_c_seq1 can be distinguished from comp_c_seq11.... it matches the terminal x as well 
	#time sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' transcripts.listx | sed -f - precleaned_ORFs.predat.tmp > precleaned_ORFs.dat.tmp ;
	###	this renames the comp to the trancript PK
	###	SOURCE: http://www.unix.com/shell-programming-and-scripting/83872-want-replace-some-words-other-list.html

#	echo "CREATE TABLE temp (trans int, start int, stop int, FOREIGN KEY(trans) REFERENCES transcript(trans_pk) );" | sqlite3 $db_file ;
#	echo "CREATE TABLE temp (trans int, start int, stop int );" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (person_id int, comp_name varchar(50), start int, stop int );" | sqlite3 $db_file ;
	echo ".import precleaned_ORFs.dat.tmp temp" | sqlite3 $db_file ;
#	echo "INSERT INTO orf (trans, start, stop) SELECT * FROM temp;" | sqlite3 $db_file ;
	time echo "INSERT INTO orf (trans, start, stop) SELECT s.trans_pk, t.start, t.stop FROM temp t, transcript s WHERE t.comp_name=s.comp_name and t.person_id=s.source;"| sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm precleaned_ORFs.dat.tmp ; 
#	rm transcripts.listx ; 
done
echo "###		... done uploading ORFs!"


