#!/bin/sh

db_file=$1
#db_file=deNovo.db
subsetFilter=$2


echo "###		Building a base to contain the data...."
echo "CREATE TABLE person ( person_pk INTEGER PRIMARY KEY, person_name varchar(20));" | sqlite3 $db_file
echo "CREATE TABLE transcript (trans_pk INTEGER PRIMARY KEY, comp_name varchar(50), source references person(person_pk));" | sqlite3 $db_file
echo "CREATE TABLE alignment (aln_pk INTEGER PRIMARY KEY, trans references transcript(trans_pk), chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean);" | sqlite3 $db_file
echo "CREATE TABLE orf ( orf_pk INTEGER PRIMARY KEY, trans references transcript(trans_pk), start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean);" | sqlite3 $db_file
echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name) VALUES('$d00d');" | sqlite3 $db_file; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	grep comp individuals/"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '\t' '|' > temp.csv ;
	echo "CREATE TABLE temp (comp_name varchar(50), source serial references person(person_pk));" | sqlite3 $db_file ;
	echo ".import temp.csv temp" | sqlite3 $db_file ;
	echo "INSERT INTO transcript(comp_name, source) SELECT * FROM temp;" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm temp.csv ;
done;
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
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file );
#	echo "SELECT trans_pk,comp_name FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file > transcripts.list ; 
	echo "SELECT trans_pk,comp_name FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | tr '|' '\t' > transcripts.list ; 
	while read compy; do 
		#awk -v potato="$(echo $line | cut -f 1,2,3,6 -d ' ')" '{if($2=="'$compy'")print $1, potato, TRUE}' transcripts.list | tr ' ' '|' >> ils_alignment_table.tmp ;
		trans_pk=$(grep -w $compy transcripts.list | cut -f 1) ;
		grep -w "$compy" individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,6,15,16 | sed -e 's/^/'$trans_pk'\t/' |  awk '{print $0,"1"}' | tr '\t' '|' | tr ' ' '|' >> ils_alignment_table.tmp
	done < individuals/"$d00d"/ILS_anom.list ;

	echo "CREATE TABLE temp (trans serial references transcript(trans_pk), chrom varchar(20), start bigint, stop bigint, strand varchar(2), qstart bigint, qstop bigint, no_direct_overlap boolean );" | sqlite3 $db_file ;
	echo ".import ils_alignment_table.tmp temp" | sqlite3 $db_file ;
	echo "INSERT INTO alignment(trans, chrom, start, stop, strand, qstart, qstop, no_direct_overlap) SELECT * FROM temp;" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
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
	awk '{print "UPDATE alignment SET no_accumulated_overlap=1 WHERE alignment.chrom=\""$1"\" AND alignment.start="$2" AND alignment.stop="$3" AND alignment.trans IN (SELECT trans_pk FROM transcript WHERE transcript.comp_name=\""$4"\" AND transcript.source='$d00d_pk'); "}' individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.tmp ;
	cat sql_upload.tmp | sqlite3 $db_file ;
	rm sql_upload.tmp ; 
done
echo "###		.... done annotating accumulation!"


###	upload ORFS 
echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/x|/'| tr '|' '\t' > transcripts.listx 
#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/|\t/' | awk '{print $1"x",$2}' | tr ' ' '\t' > transcripts.listx ; 
	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > precleaned_ORFs.predat.tmp ;
	##	this is an awkward hack so that the pattern comp_c_seq1 can be distinguished from comp_c_seq11.... it matches the terminal x as well 
	sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' transcripts.listx | sed -f - precleaned_ORFs.predat.tmp > precleaned_ORFs.dat.tmp ;
	###	this renames the comp to the trancript PK
	###	SOURCE: http://www.unix.com/shell-programming-and-scripting/83872-want-replace-some-words-other-list.html

	echo "CREATE TABLE temp (trans references transcript(trans_pk), start int, stop int );" | sqlite3 $db_file ;
	echo ".import precleaned_ORFs.dat.tmp temp" | sqlite3 $db_file ;
	echo "INSERT INTO orf (trans, start, stop) SELECT * FROM temp;" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm precleaned_ORFs.predat.tmp;
	rm precleaned_ORFs.dat.tmp ; 
	rm transcripts.listx ; 
done
echo "###		... done uploading ORFs!"


###	annotate PDB hits and not hits
echo "###		annotating ORFs as having hits to the Protein DataBase..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM transcript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' | tr ' ' '\t' > orfs.list ;

#	echo "SELECT comp_name,trans_pk FROM transcript WHERE source=$d00d_pk;" | sqlite3 $db_file | sed -e 's/|/|\t/' | awk '{print $1"x",$2}'  tr ' ' '\t' > transcripts.listx ;

#	cat individuals/"$d00d"/mapt/found_in_PDB.list | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > found_in_PDB.predat.tmp ;
#	sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' orfs.list | sed -f -  found_in_PDB.predat.tmp | awk '{print $0"|0"}' > PDB_orfs.dat.tmp ;
#	cat individuals/"$d00d"/mapt/absent_from_PDB.list | sed -e 's/:/xy/' | tr 'y' '|' | tr '-' '|' > absent_from_PDB.predat.tmp ;
#	sed -e 's/^/s%/' -e 's/\t/%/' -e 's/$/%g/' orfs.list | sed -f -  absent_from_PDB.predat.tmp | awk '{print $0"|1"}' >> PDB_orfs.dat.tmp ;

	grep -wFf  individuals/"$d00d"/mapt/found_in_PDB.list orfs.list | awk '{print $2,"0"}' | tr ' ' '|' > PDB_orfs.dat.tmp ; 
	grep -wFf  individuals/"$d00d"/mapt/absent_from_PDB.list orfs.list | awk '{print $2,"1"}' | tr ' ' '|' >> PDB_orfs.dat.tmp ; 

	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), absent_from_pdb boolean) ;" | sqlite3 $db_file ;
	echo ".import PDB_orfs.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET absent_from_PDB = (SELECT temp.absent_from_PDB FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;
	rm PDB_orfs.dat.tmp;
#	rm precleaned_ORFs.dat.tmp ; 
	rm orfs.list ; 
done ;
echo "###		... done annotating PDB hits!"


###	annotate dupes and nodupes
echo "###		annotating ORFs which appear in one xor many place in the human genome..."
echo "UPDATE orf SET no_duplicates = 0;" | sqlite3 $db_file ; 
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM transcript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' > orfs.list ;
	cut -f 4 individuals/"$d00d"/mapt/no_duplicates.bed > nodupes.list ;
	grep -wFf  nodupes.list orfs.list | awk '{print $2,"1"}' | tr ' ' '|'  > nodupes.dat.tmp ;

	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), no_duplicates boolean);" | sqlite3 $db_file ;
	echo ".import nodupes.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_duplicates = (SELECT temp.no_duplicates FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	rm nodupes.dat.tmp;
	rm nodupes.list;
	rm orfs.list;
done;
echo "###		done annotating ORF duplications!"


###	annotate chimp/gorilla homologues and lack thereof
echo "###		annotating comparative primatology homology..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | sqlite3 $db_file);
	echo "SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM trancript t, orf o WHERE t.trans_pk = o.trans AND t.source = $d00d_pk;" | sqlite3 $db_file | tr '|' '\t' | awk '{print $1":"$2"-"$3,$4}' > orfs.list ;
	grep -wFf individuals/"$d00d"/mapt/chimp.noncoding orfs.list  | awk '{print $2,"1"}' | tr ' ' '|'  > chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/chimp.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '|'  >> chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/gorilla.noncoding orfs.list | awk '{print $2,"1"}' | tr ' ' '|'  > gorillaCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/gorilla.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '|'  >> gorillaCoding.dat.tmp ;

	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), no_pan_homologous_ORF boolean);" | sqlite3 $db_file ;
	echo ".import chimpCoding.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_pan_homologous_ORF = (SELECT temp.no_pan_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), no_gor_homologous_ORF boolean);" | sqlite3 $db_file ;
	echo ".import gorillaCoding.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_gor_homologous_ORF = (SELECT temp.no_gor_homologous_ORF FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' > chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' >> chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' > gorillaMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '|' >> gorillaMissing.dat.tmp ;


	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), no_pan_homologous_ORF boolean, unseen_in_pan_refgenome boolean);" | sqlite3 $db_file ;
	echo ".import chimpCoding.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_pan_homologous_ORF, unseen_in_pan_refgenome = (SELECT temp.no_pan_homologous_ORF, temp.unseen_in_pan_refgenome FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	echo "CREATE TABLE temp (orf_pk references orf(orf_pk), no_gor_homologous_ORF boolean, unseen_in_gor_refgenome boolean);" | sqlite3 $db_file ;
	echo ".import gorillaCoding.dat.tmp temp" | sqlite3 $db_file ;
	echo "UPDATE orf SET no_gor_homologous_ORF, unseen_in_pan_refgenome = (SELECT temp.no_gor_homologous_ORF, temp.unseen_in_pan_refgenome FROM temp WHERE temp.orf_pk = orf.orf_pk);" | sqlite3 $db_file ;
	echo "DROP TABLE temp;" | sqlite3 $db_file ;

	rm orfs.list ;
	rm *.dat.tmp ;
done
echo "###		done annotating compPrim homology!"
###	annotate transcript-regions (ie, they pass Tier III)
### 
###	annotate accumulation-regions (ie, they pass Tier IV)???














"SELECT t.comp_name, o.start, o.stop, o.orf_pk FROM trancript t, orf o, WHERE t.trans_pk = o.trans AND t.source = $d00d_pk"

SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk FROM alignment a, orf o WHERE a.trans = o.trans AND no_duplicates=1; # AND t.source = $d00d_pk
echo "CREATE TABLE orf ( orf_pk INTEGER PRIMARY KEY, trans references transcript(trans_pk), start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean);" | sqlite3 $db_file


INSERT Competitors (cName)
SELECT DISTINCT Name
FROM CompResults cr
WHERE
   NOT EXISTS (SELECT * FROM Competitors c
              WHERE cr.Name = c.cName)













####
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	makeblastdb -in individuals/"$d00d"/Trinity_files.Trinity.fasta -dbtype nucl -parse_seqids ;
done ; ####
#### ^^^^ do this in the pipeline??


#blastn -db individuals/HG00121/Trinity_files.Trinity.fasta -query genome_sequences.lookbackClean.fa -out results.out -outfmt '6 qseqid sseqid pident qlen length mismatch gapopen qstart qend sstart send evalue bitscore'
###	
echo "###		DATABASE IS READY FOR USE, MAY THE FORCE BE WITH YOU"