#!/bin/sh

db_file=$1
#db_file=deNovo.db
subsetFilter=$2

PRIMATOMES_FOLDER="/proj/cdjones_lab/csoeder/primateomes"

date > "$subsetFilter".timelog;


echo "###		Building a base to contain the data...."
echo "CREATE TABLE person ( person_pk INTEGER PRIMARY KEY, person_name varchar(20));" | sqlite3 $db_file
echo "CREATE TABLE transcript (trans_pk INTEGER PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));" | sqlite3 $db_file
echo "CREATE TABLE alignment (aln_pk INTEGER PRIMARY KEY, trans int, chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | sqlite3 $db_file
echo "CREATE TABLE orf ( orf_pk INTEGER PRIMARY KEY, trans int, start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));" | sqlite3 $db_file

echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name) VALUES('$d00d');" | sqlite3 $db_file; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	grep comp individuals/"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '\t' '|' >> temp.csv ;
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
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file );


#	WHY DOES THIS TAKE SO FUCKING LONG

	# time grep -wFf individuals/"$d00d"/ILS_anom.list individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,4,6,15,16 | sed -e 's/^/'$d00d_pk'\t/'|  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' > ils_alignment_table.tmp ; 
	# echo "CREATE TABLE temp (person_id int, chrom varchar(20), start bigint, stop bigint, compy varchar(50), strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean);" | sqlite3 $db_file ;
	# time echo ".import ils_alignment_table.tmp temp" | sqlite3 $db_file ;
	# time echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT s.trans_pk, t.chrom, t.start, t.stop, t.strand, t.qstart, t.qstop, t.no_direct_overlap FROM temp t, transcript s WHERE t.person_id=s.source AND t.compy=s.comp_name;" | sqlite3 $db_file ;
	# echo "DROP TABLE temp;" | sqlite3 $db_file ;
	# echo "delete from alignment where chrom like '%Un%' or chrom like '%rand%' or chrom like '%hap%';" | sqlite3 $db_file ; #	remove crap alignments



	echo "SELECT trans_pk,comp_name FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | tr '|' '\t' > transcripts.list ; 
	time while read compy; do 
		#awk -v potato="$(echo $line | cut -f 1,2,3,6 -d ' ')" '{if($2=="'$compy'")print $1, potato, TRUE}' transcripts.list | tr ' ' '|' >> ils_alignment_table.tmp ;
		trans_pk=$(grep -w $compy transcripts.list | cut -f 1) ;
		grep -w "$compy" individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,6 | sed -e 's/^/'$trans_pk'\t/' |  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' >> ils_alignment_table.tmp
	done < individuals/"$d00d"/ILS_anom.list ;

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
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
#	awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
#	time cat sql_upload.tmp | sqlite3 $db_file ;
	cut -f 1,2,3,4 individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed | sed -e 's/^/'$d00d_pk'\t/' | tr '\t' '|' > accumulationClean.dat.tmp
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

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	cat individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning | sed -e 's/^/'$d00d_pk'\t/' | tr '\t' '|' > lowCov_warning.tmp ;
	echo "CREATE TABLE temp (person_id int, chrom varchar(20), start int, stop int, comp_name varchar(50), strand varchar(2));" | sqlite3 $db_file ;
	time echo ".import lowCov_warning.tmp temp" | sqlite3 $db_file ;
	time echo "UPDATE alignment SET lowcov_warning=1 WHERE alignment.aln_pk IN (SELECT a.aln_pk FROM alignment a, temp t, transcript s WHERE a.chrom=t.chrom AND a.start=t.start AND a.stop=t.stop AND a.trans=s.trans_pk AND t.comp_name=s.comp_name AND t.person_id=s.source);"| sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	#	pull out the coverage of each alignment region, warn if it bottoms out (ie, <= 1) 
	rm lowCov_warning.tmp ;
done;


###	upload ORFS 
echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/x|/'| tr '|' '\t' > transcripts.listx 
#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/|\t/' | awk '{print $1"x",$2}' | tr ' ' '\t' > transcripts.listx ; 
#	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > precleaned_ORFs.predat.tmp ;
	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" |  sed -e 's/^/'$d00d_pk'|/' | tr ':' '|' | tr '-' '|' > precleaned_ORFs.dat.tmp ;
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



###	annotate PDB hits and not hits
echo "###		annotating ORFs as having hits to the Protein DataBase..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	time echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM transcript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' | tr ' ' '\t' > orfs.list ;

#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/|\t/' | awk '{print $1"x",$2}'  tr ' ' '\t' > transcripts.listx ;

#	cat individuals/"$d00d"/mapt/found_in_PDB.list | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > found_in_PDB.predat.tmp ;
#	sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' orfs.list | sed -f -  found_in_PDB.predat.tmp | awk '{print $0"|0"}' > PDB_orfs.dat.tmp ;
#	cat individuals/"$d00d"/mapt/absent_from_PDB.list | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > absent_from_PDB.predat.tmp ;
#	sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' orfs.list | sed -f -  absent_from_PDB.predat.tmp | awk '{print $0"|1"}' >> PDB_orfs.dat.tmp ;

	time grep -wFf  individuals/"$d00d"/mapt/found_in_PDB.list orfs.list | awk '{print $2,"0"}' | tr ' ' '|' > PDB_orfs.dat.tmp ; 
	time grep -wFf  individuals/"$d00d"/mapt/absent_from_PDB.list orfs.list | awk '{print $2,"1"}' | tr ' ' '|' >> PDB_orfs.dat.tmp ; 

#	echo "CREATE TABLE temp (orf_pk int, absent_from_pdb boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk)) ;" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, absent_from_pdb boolean ) ;" | sqlite3 $db_file ;
	echo ".import PDB_orfs.dat.tmp temp" | sqlite3 $db_file ;
	#echo "UPDATE orf SET absent_from_PDB = (SELECT temp.absent_from_PDB FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "UPDATE orf SET absent_from_PDB=1 where orf.orf_pk in (SELECT temp.orf_pk FROM temp WHERE temp.absent_from_PDB = 1);" | sqlite3 $db_file ;
	echo "UPDATE orf SET absent_from_PDB=0 where orf.orf_pk in (SELECT temp.orf_pk FROM temp WHERE temp.absent_from_PDB = 0);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm PDB_orfs.dat.tmp;
#	rm precleaned_ORFs.dat.tmp ; 
	rm orfs.list ; 
done ;
echo "###		... done annotating PDB hits!"


###	annotate dupes and nodupes
echo "###		annotating ORFs which appear in one xor many place in the human genome..."
#echo "UPDATE orf SET no_duplicates = 0;" | sqlite3 $db_file ; 
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	time echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM transcript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' > orfs.list ;
	cut -f 4 individuals/"$d00d"/mapt/no_duplicates.bed > nodupes.list ;
	time grep -wFf  nodupes.list orfs.list | awk '{print $2,"1"}' | tr ' ' '|'  > nodupes.dat.tmp ;

#	echo "CREATE TABLE temp (orf_pk int, no_duplicates boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk));" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, no_duplicates boolean);" | sqlite3 $db_file ;
	echo ".import nodupes.dat.tmp temp" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_duplicates=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_duplicates=1);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_duplicates=0 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_duplicates=0);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_duplicates = 0  WHERE orf.no_duplicates is null;" | sqlite3 $db_file ;

	rm nodupes.dat.tmp;
	rm nodupes.list;
	rm orfs.list;
done;
echo "###		done annotating ORF duplications!"


######################################################################################
#	echo "select count(a.aln_pk), o.orf_pk FROM alignment a, orf o WHERE a.trans = o.trans AND o.no_duplicates=1 group by o.orf_pk ;" | sqlite3 $db_file | tr '|' '\t' > test.test
######################################################################################
#	^^ use this to check for unduplicated orfs whose transcript multimaps
######################################################################################






###	annotate chimp/gorilla homologues and lack thereof
echo "###		annotating comparative primatology homology..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM transcript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' > orfs.list ;
	time grep -wFf individuals/"$d00d"/mapt/chimp.noncoding orfs.list  | awk '{print $2,"1"}' | tr ' ' '|'  > chimpCoding.dat.tmp ;
	time grep -wFf individuals/"$d00d"/mapt/chimp.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '|'  >> chimpCoding.dat.tmp ;
	time grep -wFf individuals/"$d00d"/mapt/gorilla.noncoding orfs.list | awk '{print $2,"1"}' | tr ' ' '|'  > gorillaCoding.dat.tmp ;
	time grep -wFf individuals/"$d00d"/mapt/gorilla.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '|'  >> gorillaCoding.dat.tmp ;

#	echo "CREATE TABLE temp (orf_pk int, no_pan_homologous_ORF boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk));" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, no_pan_homologous_ORF boolean );" | sqlite3 $db_file ;
	echo ".import chimpCoding.dat.tmp temp" | sqlite3 $db_file ;
#	time echo "UPDATE orf SET no_pan_homologous_ORF = (SELECT temp.no_pan_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_pan_homologous_ORF=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_pan_homologous_ORF=1);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_pan_homologous_ORF=0 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_pan_homologous_ORF=0);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

#	echo "CREATE TABLE temp (orf_pk int, no_gor_homologous_ORF boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk));" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, no_gor_homologous_ORF boolean);" | sqlite3 $db_file ;
	echo ".import gorillaCoding.dat.tmp temp" | sqlite3 $db_file ;
#	time echo "UPDATE orf SET no_gor_homologous_ORF = (SELECT temp.no_gor_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_gor_homologous_ORF=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_gor_homologous_ORF=1);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_gor_homologous_ORF=0 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_gor_homologous_ORF=0);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' > chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' >> chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' > gorillaMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' >> gorillaMissing.dat.tmp ;


#	echo "CREATE TABLE temp (orf_pk int, no_pan_homologous_ORF boolean, unseen_in_pan_refgenome boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk));" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, no_pan_homologous_ORF boolean, unseen_in_pan_refgenome boolean);" | sqlite3 $db_file ;
	echo ".import chimpMissing.dat.tmp temp" | sqlite3 $db_file ;
#	echo "UPDATE orf SET no_pan_homologous_ORF = (SELECT temp.no_pan_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
#	echo "UPDATE orf SET unseen_in_pan_refgenome = (SELECT temp.unseen_in_pan_refgenome FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_pan_homologous_ORF=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_pan_homologous_ORF=1);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET unseen_in_pan_refgenome=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.unseen_in_pan_refgenome=1);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

#	echo "CREATE TABLE temp (orf_pk int, no_gor_homologous_ORF boolean, unseen_in_gor_refgenome boolean, FOREIGN KEY(orf_pk) REFERENCES orf(orf_pk));" | sqlite3 $db_file ;
	echo "CREATE TABLE temp (orf_pk int, no_gor_homologous_ORF boolean, unseen_in_gor_refgenome boolean	);" | sqlite3 $db_file ;
	echo ".import gorillaMissing.dat.tmp temp" | sqlite3 $db_file ;
#	echo "UPDATE orf SET no_gor_homologous_ORF = (SELECT temp.no_gor_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
#	echo "UPDATE orf SET unseen_in_pan_refgenome = (SELECT temp.unseen_in_gor_refgenome FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET no_gor_homologous_ORF=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.no_gor_homologous_ORF=1);" | sqlite3 $db_file ;
	time echo "UPDATE orf SET unseen_in_gor_refgenome=1 WHERE orf.orf_pk IN (SELECT temp.orf_pk FROM temp WHERE temp.unseen_in_gor_refgenome=1);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	rm orfs.list ;
	rm *.dat.tmp ;
done
echo "###		done annotating compPrim homology!"
###	annotate transcript-regions (ie, they pass Tier III)
### 
###	annotate accumulation-regions (ie, they pass Tier IV)???





echo "###		Distilling precandidates..."
# "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM trancript t, orf o, WHERE t.trans_pk = o.trans AND t.source = $d00d_pk"
# 1.
time echo "SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk, t.comp_name, a.aln_pk FROM alignment a, orf o, transcript t WHERE a.trans = o.trans AND t.trans_pk=a.trans AND o.absent_from_PDB=1 AND o.no_duplicates=1 AND no_pan_homologous_ORF=1 AND no_gor_homologous_ORF; " | sqlite3 $db_file > table.tmp # AND t.source = $d00d_pk
#	2a. # grep "+" table.tmp | tr '|' '\t' |  awk '{print $1":"$2+$7-$4"-"$3-$5+$8, $10":"$7"-"$8}'
###	coordinate change from comp:a-b to chr:x-y. x=tstart+a-qstart; y=tend-qend+b
time grep "+" table.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6}' | tr ' ' '|' > precandidate_uploads.tmp
time grep "+" table.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6, $9, $11}' | tr ' ' '|' > precandidate_lookup.tmp
#	2b. # grep "-" table.tmp | tr '|' '\t' | awk '{print $1":"$5+$2-$8"-"$4+$3-$7, $10":"$7"-"$8}'
###	rev strand: 	x=qend-b+tstart ; y=qstart+tend-a
grep "-" table.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6}' | tr ' ' '|' >> precandidate_uploads.tmp
grep "-" table.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6,$9,$11}' | tr ' ' '|' >> precandidate_lookup.tmp

echo "CREATE TABLE precandidate (precand_pk INTEGER PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2), full_sneakthrough_ILS int, full_sneakthrough_accum int, full_sneakthrough_other int, fragmentary_lookback int, blast_ghosts int);" | sqlite3 $db_file
echo "CREATE TABLE temp (chrom varchar(20), start bigint, stop bigint, strand varchar(2) );" | sqlite3 $db_file
echo ".import precandidate_uploads.tmp temp" | sqlite3 $db_file
time echo "INSERT INTO precandidate (chrom, start, stop, strand) SELECT * FROM temp t WHERE NOT EXISTS (SELECT * FROM precandidate p WHERE p.chrom=t.chrom AND p.start=t.start AND p.stop=t.stop AND p.strand = t.strand);" | sqlite3 $db_file
echo "DROP TABLE temp;" | sqlite3 $db_file

echo "CREATE TABLE precandidate_lookup (precandlookup_pk INTEGER PRIMARY KEY, orf_id, aln_id, precand, FOREIGN KEY(orf_id) REFERENCES orf(orf_pk), FOREIGN KEY(aln_id) REFERENCES alignment(aln_pk), FOREIGN KEY(precand) REFERENCES precandidate(precand_pk) ); " | sqlite3 $db_file
echo "CREATE TABLE temp (chrom varchar(20), start bigint, stop bigint, strand varchar(2), orf_ref int, aln_ref int);" | sqlite3 $db_file
echo ".import precandidate_lookup.tmp temp" | sqlite3 $db_file
echo "INSERT INTO precandidate_lookup (orf_id, aln_id, precand) SELECT t.orf_ref, t.aln_ref, p.precand_pk FROM temp t, precandidate p WHERE p.chrom=t.chrom AND p.start=t.start AND p.stop=t.stop AND p.strand=t.strand ;" | sqlite3 $db_file
echo "DROP TABLE temp;" | sqlite3 $db_file

echo "###		.... precandidates called!"


echo "###	Rescanning the transcriptomes..."
time echo "SELECT p.precand_pk, d.person_name, t.comp_name, o.start, o.stop FROM precandidate p, orf o, precandidate_lookup l, transcript t, person d WHERE p.precand_pk = l.precand AND o.orf_pk = l.orf_id AND o.trans = t.trans_pk AND t.source = d.person_pk order by p.precand_pk;" | sqlite3 $db_file | tr '|' '\t' > lookback.pretable
while read line; do
	pk=$(echo $line | cut -f 1 -d ' ');
	d00d=$(echo $line | cut -f 2 -d ' ');
	compy=$(echo $line | cut -f 3 -d ' ');
	begin=$(echo $line | cut -f 4 -d ' ');
	end=$(echo $line | cut -f 5 -d ' ');
	samtools faidx individuals/"$d00d"/Trinity_files.Trinity.fasta "$compy":"$begin"-"$end" >> precandidate_"$pk".fa;
done < lookback.pretable

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	for i in $( cut -f 1 lookback.pretable | sort | uniq ); do 
		time blastn -db individuals/"$d00d"/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/'$d00d'\t/' >> lookback_"$i".dat ;
	done;
done ; ####
echo "###	... lookback finished, annotating results in DB ... "


for i in $( cut -f 1 lookback.pretable | sort | uniq ); do
	touch full_sneakthrough_ILS.roster;
	touch full_sneakthrough_accum.roster;
	touch full_sneakthrough_other.roster;

	#awk '{if($8==1 && $9==$10 && $11<$12 )print;}' lookback_"$i".dat > full_lookback_"$i".dat ;	
	#	ie, if the start codon and endcodon map ; allow antisense transcription
	# better:
	python data-scrape/remove_blastHits_without_ORFs.py lookback_"$i".dat full_lookback_"$i".dat

	echo "SELECT p.person_name FROM precandidate_lookup l, orf o, transcript t, person p WHERE l.precand="$i" AND l.orf_id=o.orf_pk AND o.trans=t.trans_pk AND p.person_pk=t.source;" | sqlite3 $db_file > "$i".markedExpressers.list ;
	grep -v -wFf "$i".markedExpressers.list full_lookback_"$i".dat > full_lookback_sneakthroughs_"$i".dat;
	grep -v -wFf "$i".markedExpressers.list lookback_"$i".dat > fragmentary_lookback_sneakthroughs_"$i".dat;
	# full_sneakthrough_ILS=0;
	# full_sneakthrough_accum=0;
	# full_sneakthrough_other=0;
	while read line; do
		d00d=$(echo $line | cut -f 1 -d ' ');
		compy=$(echo $line | cut -f 3 -d ' ');

		#grep -w $compy individuals/"$d00d"/ILS_known.list >/dev/null && [INCREMENT ]
		#grep -q -w $compy individuals/"$d00d"/ILS_known.list && ( full_sneakthrough_ILS=$((full_sneakthrough_ILS+1)) ; exit 0) || (grep -q $x individuals/"$d00d"/mapt/accumulation_rejects.bed && (full_sneakthrough_accum=$((full_sneakthrough_accum+1)); exit 0)) || full_sneakthrough_other=$((full_sneakthrough_other+1)) ;
#	I couldn't get this dank one liner to work! ^^

#	Also, need a new approach -  multiple transcripts per person can be found on lookback! 
# HG00310	comp11562_c0_seq1:83-331	comp12447_c0_seq2
# HG00310	comp11562_c0_seq1:83-331	comp12447_c0_seq1
# HG00311	comp11562_c0_seq1:83-331	comp11562_c0_seq2
# HG00311	comp11562_c0_seq1:83-331	comp11562_c0_seq1
		grep -w -q $compy individuals/"$d00d"/ILS_known.list ;
		stat=$? ;
		if [ $stat -eq 0 ]; then 
#			full_sneakthrough_ILS=$((full_sneakthrough_ILS+1)) ;
			echo $d00d >> full_sneakthrough_ILS.roster ;
		else 
			grep -w -q $compy individuals/"$d00d"/mapt/accumulation_rejects.bed ;
			stat=$? ;
			if  [ $stat -eq 0 ]; then
#				full_sneakthrough_accum=$((full_sneakthrough_accum+1)) ;
				echo $d00d >> full_sneakthrough_accum.roster ;
			else
#				full_sneakthrough_other=$((full_sneakthrough_other+1)) ;
				echo $d00d >> full_sneakthrough_other.roster ;
			fi
		fi;

	done < full_lookback_sneakthroughs_"$i".dat ;

	full_sneakthrough_ILS=$(sort full_sneakthrough_ILS.roster | uniq | wc -l );
	full_sneakthrough_accum=$(sort full_sneakthrough_accum.roster | uniq | wc -l );
	full_sneakthrough_other=$(sort full_sneakthrough_other.roster | uniq | wc -l );

	fragmentary_sneakthrough=$(cut -f 1 fragmentary_lookback_sneakthroughs_"$i".dat | sort | uniq | wc -l ) ;

	cut -f 1 lookback_"$i".dat | sort | uniq > in_which_"$i"_is_seen.list ; 
	blast_ghost=$(grep -v -wFf in_which_1_is_seen.list 1.markedExpressers.list | wc -l) ; 
	# ^^ this counts any instances of an ORF which doesn't appear in the transcriptomes the DB claims it's in....
	#echo "$i" "$full_sneakthrough_ILS" "$full_sneakthrough_accum" "$full_sneakthrough_other" "$fragmentary_sneakthrough" "$blast_ghost" | tr ' ' '|' >> lookback_upload.tmp;
	echo "UPDATE precandidate SET full_sneakthrough_ILS="$full_sneakthrough_ILS", full_sneakthrough_accum="$full_sneakthrough_accum", full_sneakthrough_other="$full_sneakthrough_other", fragmentary_lookback="$fragmentary_sneakthrough", blast_ghosts="$blast_ghost"  where precand_pk="$i";" | sqlite3 $db_file ;
	rm full_sneakthrough_*.roster 
done

rm *.markedExpressers.list 
rm in_which_*
rm full_lookback_*
rm fragmentary_lookback_sneakthroughs_*

echo "###		Annotate precandidates re: pan/gor transcriptomes..."
#	note what fraction of the source alignments for each precandidate have lowcov warnings
for i in $( cut -f 1 lookback.pretable | sort | uniq ); do
	time blastn -db "$PRIMATOMES_FOLDER"/gor_142/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore'  >> gor_142_"$i".dat ;
	time blastn -db "$PRIMATOMES_FOLDER"/gor_143/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore'  >> gor_143_"$i".dat ;
	time blastn -db "$PRIMATOMES_FOLDER"/pan_145/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' >> pan_145_"$i".dat ;
	time blastn -db "$PRIMATOMES_FOLDER"/pan_146/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' >> pan_146_"$i".dat ;
	time blastn -db "$PRIMATOMES_FOLDER"/CHP_bigassembly_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' >> pan_NHPRTR_"$i".dat ;
	time blastn -db "$PRIMATOMES_FOLDER"/GOR_UDG_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' >> gor_NHPRTR_"$i".dat ; 
done ;

echo "ALTER TABLE precandidate ADD COLUMN unseen_in_pan145 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_pan145 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_pan146 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_pan146 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gor142 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gor142 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gor143 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gor143 boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_panNHPRTR boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_panNHPRTR boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gorNHPRTR boolean;" | sqlite3 $db_file ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gorNHPRTR boolean;" | sqlite3 $db_file ;
echo "UPDATE precandidate SET unseen_in_pan145=0, unseen_in_pan146=0, unseen_in_gor142=0, unseen_in_gor143=0, unseen_in_gorNHPRTR=0, unseen_in_panNHPRTR=0, fragmentary_in_pan145=0, fragmentary_in_pan146=0, fragmentary_in_gor142=0, fragmentary_in_gor143=0, fragmentary_in_gorNHPRTR=0, fragmentary_in_panNHPRTR=0;" | sqlite3 $db_file ;


awk '{if($7==1 && $8==$9 && $10<$11 )print;}' [compPrim]_i.dat > full_[compPrim]_"$i".predat ;	#	ie, if the start codon and endcodon map allow antisense transcription. off by one from earlier example
#remove non-ORFs from the unseen list
for i in $( cut -f 1 lookback.pretable | sort | uniq ); do 
	python remove_FASTAs_without_ORFs.py [compPrim]_"$i".predat "$PRIMATOMES_FOLDER"/[compPrim].fasta [compPrim]_"$i".postdat ; 
done
for phial in $(ls | grep [compPrim] | grep postdat); do count=$(cat $phial | wc -l); if [ $count -eq 0 ]; then rm $phial; fi; done


echo "UPDATE precandidate SET full_sneakthrough_ILS="$full_sneakthrough_ILS", full_sneakthrough_accum="$full_sneakthrough_accum", full_sneakthrough_other="$full_sneakthrough_other", fragmentary_lookback="$fragmentary_sneakthrough", blast_ghosts="$blast_ghost"  where precand_pk="$i";" | sqlite3 $db_file ;
echo "###		...done!"


###			ADD A MOUSE SCAN?	ftp://ftp.ncbi.nih.gov/genomes/M_musculus/ARCHIVE

echo "###		compPrim transcriptome scan done!..."



# echo "CREATE TABLE temp (precan_id int, full_sneakthrough_ILS int, full_sneakthrough_accum int, full_sneakthrough_other int, fragmentary_lookback int, blast_ghosts int);" | sqlite3 $db_file
# echo ".import lookback_upload.tmp temp" | sqlite3 $db_file
# echo "UPDATE precandidate SET full_sneakthrough_ILS = (SELECT temp.full_sneakthrough_ILS FROM temp WHERE temp.precand_id=precandidate.precand_pk);" | sqlite3 $db_file ;
# echo "UPDATE precandidate SET full_sneakthrough_ILS = (SELECT temp.full_sneakthrough_ILS FROM temp WHERE temp.precand_id=precandidate.precand_pk);" | sqlite3 $db_file ;

# echo "UPDATE orf SET unseen_in_pan_refgenome = (SELECT temp.unseen_in_gor_refgenome FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
# echo "DROP TABLE temp;" | sqlite3 $db_file ;
#rm lookback_upload.tmp ;


# 1. awk each lookback_"$i".dat to pull the BLAST hits which preserve the start and stop of the ORF. These are the full lookback hits.
# ie, awk '{if($8==1 && $9==$10)print;}' lookback_"$i".dat > full_lookback_"$i".dat
# 1b. the whole lookback_"$i".dat file are also counted as fragmentary hits. 
# 2. for each precandidate, pull the individuals whose transcripts it is derived from...
# "SELECT p.person_name FROM precandidate_lookup l, orf o, transcript t, person p WHERE l.precand=$$$$$ AND l.orf_id=o.orf_pk AND o.trans=t.trans_pk AND p.person_pk=t.source;"   --->   $$$$$.markedExpressers.list
# 3. use grep to remove the people who are annotated as expressers, leaving behind the ones who have snuck through... uhoh!
# grep -v -wFf $$$$$.markedExpressers.list full_lookback_"$i".dat > full_lookback_sneakthroughs_"$i".dat;
# grep -v -wFf $$$$$.markedExpressers.list lookback_"$i".dat > fragmentary_lookback_sneakthroughs_"$i".dat;
# 4. annotate accordingly; try to figure out what went wrong...
# 4a. for each sneakthrough, check if it was marked as ils_known... if not, was it marked as accumulation-rejected?
# while read line; do
# 	d00d=$(echo $line | cut -f 1);
# 	compy=$(echo $line | cut -f 3);
# 	full_sneakthrough_ILS=0;
# 	full_sneakthrough_accum=0;
# 	full_sneakthrough_other=0;
# 	#grep -w $compy individuals/"$d00d"/ILS_known.list >/dev/null && [INCREMENT ]


# 	grep -q -w $compy individuals/"$d00d"/ILS_known.list && ( full_sneakthrough_ILS=$((full_sneakthrough_ILS+1)) ; exit 0) || (grep -q $x individuals/"$d00d"/mapt/accumulation_rejects.bed && (full_sneakthrough_accum=$((full_sneakthrough_accum+1)); exit 0)) || full_sneakthrough_other=$((full_sneakthrough_other+1))
# done < full_lookback_sneakthroughs_"$i".dat

# #	grep -q $x a.test   && (echo "A"; exit 0) || (grep -q $x b.test && (echo "B"; exit 0)) || echo "Neither A nor B"
# ## grep cat animals >/dev/null && echo "Yep, it is there" || echo "Sorry, could not find it"
# 5. 

echo "###		Annotate precandidates re: splicing evidence..."


echo "SELECT chrom,start,stop,precand_pk FROM precandidate;" | sqlite3 $db_file | tr '|' '\t' > precandidate_locations.bed4
echo "ALTER TABLE precandidate ADD COLUMN splicing_evidence int;" | sqlite3 $db_file ;
echo "UPDATE precandidate SET splicing_evidence=0;" | sqlite3 $db_file ;

cat precandidate_locations.bed4 | while read bedline; do 
	echo $bedline | tr ' ' '\t' > bedline.bed.tmp ;
	precand_pk=$(echo $bedline | cut -f 4 -d ' ') ;
	for d00d in $( echo "select person_name from person where person.person_pk in (select source from transcript where transcript.trans_pk in (select trans from alignment where alignment.aln_pk in (select aln_id from precandidate_lookup where precand="$precand_pk")));" | sqlite3 $db_file | sort | uniq ) ; do 
		bedtools intersect -wa -u -a bedline.bed.tmp -b individuals/"$d00d"/"$d00d"_splicedReads.exons.bed6 | sed -e 's/^/'$d00d'\t/' | cut -f 1 | sort | uniq >> precandidate_splicingEvidence.list ; 
	done;
	echo "UPDATE precandidate SET splicing_evidence="$(cat precandidate_splicingEvidence.list | wc -l)" WHERE precandidate.precand_pk = "$precand_pk";" | sqlite3 $db_file ;

	rm bedline.bed.tmp ;
	rm precandidate_splicingEvidence.list ;
done 


echo "###		Annotate precandidates re: lowCov_warning in transcripts..."
#	note what fraction of the source alignments for each precandidate have lowcov warnings
echo "ALTER TABLE precandidate ADD COLUMN lowcov_warning_fraction real;" | sqlite3 $db_file ;
echo "SELECT p.precand, sum(a.lowcov_warning), count(*), sum(a.lowcov_warning)/count(*) FROM alignment a, precandidate_lookup p WHERE a.aln_pk=p.aln_id GROUP BY p.precand;" | sqlite3 $db_file | tr '|' '\t' | awk '{print "UPDATE precandidate SET lowcov_warning_fraction="$4" WHERE precandidate.precand_pk="$1";"}' | sqlite3 $db_file ;
echo "###		...done!"





#blastn -db individuals/HG00121/Trinity_files.Trinity.fasta -query genome_sequences.lookbackClean.fa -out results.out -outfmt '6 qseqid sseqid pident qlen length mismatch gapopen qstart qend sstart send evalue bitscore'
###	
echo "###		DATABASE IS READY FOR USE, MAY THE FORCE BE WITH YOU"