#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)

PRIMATOMES_FOLDER="/home/csoeder/1kGen/primateomes"
#int auto_increment primary key
echo "###		Building a base to contain the data...."
echo "CREATE TABLE person ( person_pk INTEGER AUTO_INCREMENT PRIMARY KEY, person_name varchar(20), rna_seq boolean );" | mysql $db_name --password="$pswd" --user="$user"


echo "###		.... base built!"


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	echo $d00d;
	echo "INSERT INTO person(person_name, rna_seq) VALUES('$d00d', 1);" | mysql $db_name --password="$pswd" --user="$user";
	echo "CREATE TABLE transcript_"$d00d" (trans_pk INTEGER AUTO_INCREMENT PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));" |mysql $db_name --password="$pswd" --user="$user"
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );
	grep comp individuals/"$d00d"/Trinity_files.Trinity.fasta | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '|' '\t' >> temp.csv ;
	mv temp.csv /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
	echo "LOAD DATA INFILE 'temp.csv' INTO TABLE transcript_"$d00d" (comp_name, source);" | mysql $db_name --password="$pswd" --user="$user" ;
done;
rm /var/lib/mysql/"$db_name"/temp.csv ;




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
	echo "CREATE TABLE alignment_"$d00d" (aln_pk INTEGER AUTO_INCREMENT PRIMARY KEY, person_id int, trans varchar(50), chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean, block_count int, block_sizes text, block_starts text, FOREIGN KEY(person_id) REFERENCES person(person_pk));" | mysql $db_name --password="$pswd"  --user="$user"

	echo "build ils table here"
	grep -wFf individuals/"$d00d"/ILS_anom.list individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | cut -f 1,2,3,4,6,15,16,18,19,21 | sed -e 's/^/'$d00d_pk'\t/'|  awk '{print $0,"1"}' | tr ' ' '\t' > ils_alignment_table.tmp ; 
	echo "ils table built"
	echo
	mv ils_alignment_table.tmp /var/lib/mysql/"$db_name"/ ; #################################################
	
	echo "LOAD DATA INFILE 'ils_alignment_table.tmp' INTO TABLE alignment_"$d00d" (person_id, chrom, start, stop, trans, strand, qstart, qstop, block_count, block_sizes, block_starts, no_direct_overlap);" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "DELETE FROM alignment_"$d00d" WHERE chrom LIKE '%Un%' OR chrom LIKE '%rand%' OR chrom LIKE '%hap%';" | mysql $db_name --password="$pswd" --user="$user" ; #	remove crap alignments
	echo "bad alignments pruned"

done;
echo "###		ILS anomalies uploaded!"

echo "###		Annotate alignments re: accumulation..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );
	echo "UPDATE alignment_"$d00d" SET no_accumulated_overlap=0;" | mysql $db_name --password="$pswd" --user="$user" ;
	cut -f 1,2,3,4 individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed | sed -e 's/^/'$d00d_pk'\t/' > accumulationClean.dat.tmp


	awk '{print "UPDATE alignment_'$d00d' SET no_accumulated_overlap=1 WHERE alignment_'$d00d'.chrom=\""$1"\" AND alignment_'$d00d'.start="$2" AND alignment_'$d00d'.stop="$3" AND alignment_'$d00d'.trans=\""$4"\"; "}'  individuals/"$d00d"/mapt/accumulation_clean_assemblies.bed > sql_upload.accum.tmp ;
	cat sql_upload.accum.tmp | mysql $db_name --password="$pswd" --user="$user" ;
	rm accumulationClean.dat.tmp
	rm sql_upload.accum.tmp
done;

#echo "###		Annotate alignments re: lowcoverage ..."

#for d00d in $(ls individuals/ | grep $subsetFilter ); do 
#	echo $d00d;
#	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );

#	echo "ALTER TABLE alignment_"$d00d" ADD COLUMN lowcov_warning boolean;" | mysql $db_name --password="$pswd" --user="$user" ;
#	echo "UPDATE alignment_"$d00d" SET lowcov_warning=0;" | mysql $db_name --password="$pswd" --user="$user" ;

#	awk '{print "UPDATE alignment_'$d00d' SET lowcov_warning=1 WHERE alignment_'$d00d'.chrom=\""$1"\" AND alignment_'$d00d'.start="$2" AND alignment_'$d00d'.stop="$3" AND alignment_'$d00d'.trans=\""$4"\"; "}'  individuals/"$d00d"/"$d00d"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning > sql_upload.lowcov.tmp ;
#	time cat sql_upload.lowcov.tmp | mysql $db_name --password="$pswd" --user="$user" ;
#	rm sql_upload.lowcov.tmp ;
#done;

###	upload ORFS 
echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );

	echo "CREATE TABLE orf_"$d00d" ( orf_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans varchar(50), start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean );" | mysql $db_name --password="$pswd" --user="$user" ;

	grep ">" individuals/"$d00d"/mapt/precleaned_ORFs.fa | tr -d ">" | tr ':' '\t' | tr '-' '\t' | sort | uniq  > precleaned_orfs.tmp ;
	mv precleaned_orfs.tmp /var/lib/mysql/"$db_name"/

	echo "LOAD DATA INFILE 'precleaned_orfs.tmp' INTO TABLE orf_"$d00d" (trans, start, stop);" | mysql $db_name --password="$pswd" --user="$user" ;

done
echo "###		... done uploading ORFs!"

###	annotate PDB hits and not hits
echo "###		annotating ORFs as having hits to the Protein DataBase..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N | awk '{print $1":"$2"-"$3,$4}' > orfs.list

	grep -wFf  individuals/"$d00d"/mapt/found_in_PDB.list orfs.list | awk '{print $2,"0"}' | tr ' ' '\t' > PDB_orfs.dat.tmp ; 
	grep -wFf  individuals/"$d00d"/mapt/absent_from_PDB.list orfs.list | awk '{print $2,"1"}' | tr ' ' '\t' >> PDB_orfs.dat.tmp ; 

	awk '{print "UPDATE orf_'$d00d' SET absent_from_PDB=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' PDB_orfs.dat.tmp > sql_upload.PDB.tmp ;
	cat sql_upload.PDB.tmp | mysql $db_name --password="$pswd" --user="$user" ;

	rm PDB_orfs.dat.tmp;
	rm orfs.list ; 
	rm sql_upload.PDB.tmp ;
done ;
echo "###		... done annotating PDB hits!"

###	annotate dupes and nodupes
echo "###		annotating ORFs which appear in one xor many place in the human genome..."
#echo "UPDATE orf SET no_duplicates = 0;" | sqlite3 $db_file ; 
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "UPDATE orf_"$d00d" SET no_duplicates=0;" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N | awk '{print $1":"$2"-"$3,$4}' > orfs.list
	cut -f 4 individuals/"$d00d"/mapt/no_duplicates.bed > nodupes.list ;
	grep -wFf nodupes.list orfs.list | awk '{print $2,"1"}' | tr ' ' '\t'  > nodupes.dat.tmp ;
	
	awk '{print "UPDATE orf_'$d00d' SET no_duplicates=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' nodupes.dat.tmp > sql_upload.dupe.tmp ;
	cat  sql_upload.dupe.tmp | mysql $db_name --password="$pswd" --user="$user" ;

	rm sql_upload.dupe.tmp
	rm nodupes.dat.tmp;
	rm nodupes.list;
	rm orfs.list;
done;
echo "###		done annotating ORF duplications!"


echo "###		annotating comparative primatology homology..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N | awk '{print $1":"$2"-"$3,$4}' > orfs.list
	grep -wFf individuals/"$d00d"/mapt/chimp.noncoding orfs.list  | awk '{print $2,"1"}' | tr ' ' '\t'  > chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/chimp.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '\t'  >> chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/gorilla.noncoding orfs.list | awk '{print $2,"1"}' | tr ' ' '\t'  > gorillaCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/gorilla.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '\t'  >> gorillaCoding.dat.tmp ;

	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t'| tr '|' '\t'   > chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' >> chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' > gorillaMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/mapt/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' >> gorillaMissing.dat.tmp ;

	awk '{print "UPDATE orf_'$d00d' SET no_pan_homologous_ORF=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' chimpCoding.dat.tmp > sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_gor_homologous_ORF=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' gorillaCoding.dat.tmp >> sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_gor_homologous_ORF=\""$2"\", unseen_in_gor_refgenome=\""$3"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' gorillaMissing.dat.tmp >> sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_pan_homologous_ORF=\""$2"\", unseen_in_pan_refgenome=\""$3"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' chimpMissing.dat.tmp >> sql_upload.compPrim.tmp ;


	cat sql_upload.compPrim.tmp | mysql $db_name --password="$pswd" --user="$user" ;
done;


echo "###		Distilling precandidates..."

echo "CREATE TABLE precandidate (precand_pk INTEGER AUTO_INCREMENT PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2), full_sneakthrough_ILS int, full_sneakthrough_accum int, full_sneakthrough_other int, fragmentary_lookback int, blast_ghosts int);" | mysql $db_name --password="$pswd" --user="$user" ;

echo "CREATE TABLE precandidate_lookup (precandlookup_pk INTEGER AUTO_INCREMENT PRIMARY KEY, orf_id int, aln_id int, person_id int, person_name varchar(20), precand_id int, FOREIGN KEY(person_id) REFERENCES person(person_pk), FOREIGN KEY(precand_id) REFERENCES precandidate(precand_pk) ); " | mysql $db_name --password="$pswd" --user="$user" ;



for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk, t.comp_name, a.aln_pk FROM alignment_"$d00d" a, orf_"$d00d" o, transcript_"$d00d" t WHERE a.trans=o.trans AND t.comp_name=a.trans AND o.absent_from_pdb=1 AND o.no_duplicates=1 AND o.no_pan_homologous_ORF=1 AND o.no_gor_homologous_ORF=1 AND a.no_direct_overlap=1 AND a.no_accumulated_overlap=1; " | mysql $db_name --password="$pswd" --user="$user" -N > precandidates.tmp ;
	
#	2a. # grep "+" table.tmp | tr '|' '\t' |  awk '{print $1":"$2+$7-$4"-"$3-$5+$8, $10":"$7"-"$8}'
###	coordinate change from comp:a-b to chr:x-y. x=tstart+a-qstart; y=tend-qend+b
	grep "+" precandidates.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6}' | tr ' ' '\t' > precandidate_uploads.tmp
	grep "+" precandidates.tmp | tr '|' '\t' |  awk '{print $1,$2+$7-$4,$3-$5+$8,$6, $9, $11}' | tr ' ' '\t' > precandidate_lookup.tmp
#	2b. # grep "-" table.tmp | tr '|' '\t' | awk '{print $1":"$5+$2-$8"-"$4+$3-$7, $10":"$7"-"$8}'
###	rev strand: 	x=qend-b+tstart ; y=qstart+tend-a
	grep "-" precandidates.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6}' | tr ' ' '\t' >> precandidate_uploads.tmp
	grep "-" precandidates.tmp | tr '|' '\t' | awk '{print $1,$5+$2-$8,$4+$3-$7, $6,$9,$11}' | tr ' ' '\t' >> precandidate_lookup.tmp

	cp precandidate_uploads.tmp /var/lib/mysql/"$db_name"/ ; 
	echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2));" |mysql $db_name --password="$pswd" --user="$user"
	echo "LOAD DATA INFILE 'precandidate_uploads.tmp' INTO TABLE temp (chrom, start, stop, strand);" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "INSERT  INTO precandidate (chrom, start, stop, strand) SELECT DISTINCT t.chrom, t.start, t.stop, t.strand FROM temp t  WHERE NOT EXISTS ( SELECT precand_pk FROM precandidate p WHERE p.chrom = t.chrom AND p.start = t.start AND p.stop=t.stop AND p.strand=t.strand );" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;



	awk '{print "SELECT  precand_pk  FROM precandidate WHERE chrom=\""$1"\" AND start="$2" AND stop="$3" AND strand=\""$4"\";" }' precandidate_uploads.tmp |  mysql $db_name --password="$pswd" --user="$user" -N | paste precandidate_lookup.tmp - | awk '{print "INSERT INTO precandidate_lookup (orf_id, aln_id, precand_id, person_id, person_name) VALUES ("$5", "$6", "$7", "'$d00d_pk'", \"""'$d00d'""\");" }' | mysql $db_name --password="$pswd" --user="$user" -N


done;


echo "###		.... precandidates called!"


echo "###	Rescanning the transcriptomes..."

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "SELECT l.precand_id, o.trans, o.start, o.stop FROM orf_"$d00d" o, precandidate_lookup l WHERE l.orf_id=o.orf_pk AND l.person_name='"$d00d"' ORDER BY l.precand_id;"| mysql $db_name --password="$pswd" --user="$user" -N > lookback.pretable 
	
	while read line; do
		pk=$(echo $line | cut -f 1 -d ' ');
		compy=$(echo $line | cut -f 2 -d ' ');
		begin=$(echo $line | cut -f 3 -d ' ');
		end=$(echo $line | cut -f 4 -d ' ');
		echo $line;
		echo "$compy":"$begin"-"$end";
		samtools faidx individuals/"$d00d"/Trinity_files.Trinity.fasta "$compy":"$begin"-"$end" >> precandidate_"$pk".fa;
	done < lookback.pretable

done;

for d00d in $(ls individuals/ | grep $subsetFilter ); do
	for i in $( echo "SELECT precand_pk FROM precandidate;"| mysql $db_name --password="$pswd" --user="$user" -N ); do 
		blastn -db individuals/"$d00d"/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/'$d00d'\t/' >> lookback_"$i".dat ;
	done;
done ; ####
echo "###	... lookback finished, annotating results in DB ... "




###################################################################################################################################################

for i in $( echo "SELECT precand_pk FROM precandidate;"| mysql $db_name --password="$pswd" --user="$user" -N ); do

	touch full_sneakthrough_ILS.roster;
	touch full_sneakthrough_accum.roster;
	touch full_sneakthrough_other.roster;

	#awk '{if($8==1 && $9==$10 && $11<$12 )print;}' lookback_"$i".dat > full_lookback_"$i".dat ;	
	#	ie, if the start codon and endcodon map ; allow antisense transcription
	# better:
	# does it stick to a same-sense ORF in the transcriptome BLAST?
	python data-scrape/remove_blastHits_without_ORFs.py lookback_"$i".dat full_lookback_"$i".dat

	echo "SELECT person_name FROM precandidate_lookup WHERE precand_id="$i";" | mysql $db_name --password="$pswd" --user="$user" -N > "$i".markedExpressers.list ;
	grep -v -wFf "$i".markedExpressers.list full_lookback_"$i".dat > full_lookback_sneakthroughs_"$i".dat;
	grep -v -wFf "$i".markedExpressers.list lookback_"$i".dat > fragmentary_lookback_sneakthroughs_"$i".dat;

	while read line; do
		d00d=$(echo $line | cut -f 1 -d ' ');
		compy=$(echo $line | cut -f 3 -d ' ');

		#grep -w $compy individuals/"$d00d"/ILS_known.list >/dev/null && [INCREMENT ]
		#grep -q -w $compy individuals/"$d00d"/ILS_known.list && ( full_sneakthrough_ILS=$((full_sneakthrough_ILS+1)) ; exit 0) || (grep -q $x individuals/"$d00d"/mapt/accumulation_rejects.bed && (full_sneakthrough_accum=$((full_sneakthrough_accum+1)); exit 0)) || full_sneakthrough_other=$((full_sneakthrough_other+1)) ;
#	I couldn't get this dank one liner to work! ^^

	#	Also, need a new approach? -  multiple transcripts per person can be found on lookback! 
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

	echo "UPDATE precandidate SET full_sneakthrough_ILS="$full_sneakthrough_ILS", full_sneakthrough_accum="$full_sneakthrough_accum", full_sneakthrough_other="$full_sneakthrough_other", fragmentary_lookback="$fragmentary_sneakthrough", blast_ghosts="$blast_ghost"  where precand_pk="$i";" | mysql $db_name --password="$pswd" --user="$user" -N ;
	rm full_sneakthrough_*.roster 
done


rm *.markedExpressers.list 
rm in_which_*
rm full_lookback_*
rm fragmentary_lookback_sneakthroughs_*


###################################################################################################################################################

echo "###		Annotate precandidates re: pan/gor transcriptomes..."
#	note what fraction of the source alignments for each precandidate have lowcov warnings
for i in $( echo "SELECT precand_pk FROM precandidate;"| mysql $db_name --password="$pswd" --user="$user" -N ); do
	blastn -db "$PRIMATOMES_FOLDER"/gor_142/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore'| sed -e 's/^/gor142\t/' >> gor_142_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/gor_143/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/gor143\t/' >> gor_143_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/pan_145/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/pan145\t/' >> pan_145_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/pan_146/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/pan146\t/' >> pan_146_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/CHP_bigassembly_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/NHPRTR\t/' >> pan_NHPRTR_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/GOR_UDG_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/gorNHPRTR\t/' >> gor_NHPRTR_"$i".dat ; 
done ;

echo "ALTER TABLE precandidate ADD COLUMN unseen_in_pan145 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_pan145 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_pan146 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_pan146 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gor142 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gor142 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gor143 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gor143 boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_panNHPRTR boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_panNHPRTR boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN unseen_in_gorNHPRTR boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;
echo "ALTER TABLE precandidate ADD COLUMN fragmentary_in_gorNHPRTR boolean;" |  mysql $db_name --password="$pswd" --user="$user" -N ;

echo "UPDATE precandidate SET unseen_in_pan145=0, unseen_in_pan146=0, unseen_in_gor142=0, unseen_in_gor143=0, unseen_in_gorNHPRTR=0, unseen_in_panNHPRTR=0, fragmentary_in_pan145=0, fragmentary_in_pan146=0, fragmentary_in_gor142=0, fragmentary_in_gor143=0, fragmentary_in_gorNHPRTR=0, fragmentary_in_panNHPRTR=0;" | mysql $db_name --password="$pswd" --user="$user" -N ;


###################################################################################################################################################

for i in $( echo "SELECT precand_pk FROM precandidate;"| mysql $db_name --password="$pswd" --user="$user" -N ); do

	echo "precandidate $i...."

	python data-scrape/remove_blastHits_without_ORFs.py gor_142_"$i".dat gor_142_"$i".postdat "$PRIMATOMES_FOLDER"/gor_142/Trinity_files.Trinity.fasta ;
	python data-scrape/remove_blastHits_without_ORFs.py gor_143_"$i".dat gor_143_"$i".postdat "$PRIMATOMES_FOLDER"/gor_143/Trinity_files.Trinity.fasta ;
	python data-scrape/remove_blastHits_without_ORFs.py gor_NHPRTR_"$i".dat gor_NHPRTR_"$i".postdat "$PRIMATOMES_FOLDER"/GOR_UDG_trinity.fasta ;
	python data-scrape/remove_blastHits_without_ORFs.py pan_145_"$i".dat pan_145_"$i".postdat "$PRIMATOMES_FOLDER"/pan_145/Trinity_files.Trinity.fasta ;
	python data-scrape/remove_blastHits_without_ORFs.py pan_146_"$i".dat pan_146_"$i".postdat "$PRIMATOMES_FOLDER"/pan_146/Trinity_files.Trinity.fasta ;
	python data-scrape/remove_blastHits_without_ORFs.py pan_NHPRTR_"$i".dat pan_NHPRTR_"$i".postdat "$PRIMATOMES_FOLDER"/CHP_bigassembly_trinity.fasta ;

	count=$(cat gor_142_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_gor142=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	count=$(cat gor_143_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_gor143=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	count=$(cat gor_NHPRTR_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_gorNHPRTR=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;

	count=$(cat pan_145_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_pan146=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	count=$(cat pan_146_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_pan145=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi; 
	count=$(cat pan_NHPRTR_"$i".postdat | wc -l); if [ $count -eq 0 ]; then echo "UPDATE precandidate SET unseen_in_panNHPRTR=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;

	count=$(cat gor_142_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_gor142=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi; 
	count=$(cat gor_143_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_gor143=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	count=$(cat gor_NHPRTR_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_gorNHPRTR=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;

	count=$(cat pan_145_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_pan146=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	count=$(cat pan_146_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_pan145=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi; 
	count=$(cat pan_NHPRTR_"$i".dat | wc -l); if [ $count -gt 0 ]; then echo "UPDATE precandidate SET fragmentary_in_panNHPRTR=1 WHERE precandidate.precand_pk="$i";" >> sql_upload.compPrim_transScan.tmp ; fi;
	

done

cat sql_upload.compPrim_transScan.tmp | mysql $db_name --password="$pswd" --user="$user" -N ;
rm sql_upload.compPrim_transScan.tmp


###################################################################################################################################################





###			ADD A MOUSE SCAN?	ftp://ftp.ncbi.nih.gov/genomes/M_musculus/ARCHIVE
###				heck, why not a mouse scan for homologous coding regions in the gene?

echo "###		compPrim transcriptome scan done!..."
###################################################################################################################################################

echo "###		Condensing the final candidates from the precanidates..."
#SELECT * FROM precandidate WHERE full_sneakthrough_ILS=0 AND full_sneakthrough_accum=0 AND full_sneakthrough_other=0 AND blast_ghosts=0 AND unseen_in_gor142=1 AND unseen_in_gor143=1 AND unseen_in_gorNHPRTR=1 AND unseen_in_pan145=1 AND unseen_in_pan146=1 AND unseen_in_panNHPRTR=1;

#CREATE TABLE candidate SELECT * FROM precandidate WHERE 1=0;

echo "CREATE TABLE candidate SELECT * FROM precandidate  WHERE full_sneakthrough_ILS=0 AND full_sneakthrough_accum=0 AND full_sneakthrough_other=0 AND blast_ghosts=0 AND unseen_in_gor142=1 AND unseen_in_gor143=1 AND unseen_in_gorNHPRTR=1 AND unseen_in_pan145=1 AND unseen_in_pan146=1 AND unseen_in_panNHPRTR=1;" | mysql $db_name --password="$pswd" --user="$user" -N ;

#CREATE TABLE orf SELECT * FROM orf_HG00096 WHERE 1=0;

#for d00d in $(ls individuals/ | grep $subsetFilter ); do 
#	echo $d00d;
#	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N  );
#	insert into orf o.trans, o.start, o.stop, o.absent_from_pdb o.no_duplicates o.no_pan_homologous_ORF o.no_gor_homologous_ORF o.unseen_in_pan_refgenome o.unseen_in_gor_refgenome from orf_d00d o,  


###################################################################################################################################################


























#echo "###		Annotate precandidates re: splicing evidence..."
#echo "SELECT chrom,start,stop,precand_pk FROM precandidate;" | mysql $db_name --password="$pswd" --user="$user" -N > precandidate_locations.bed4
#echo "ALTER TABLE precandidate ADD COLUMN splicing_evidence int;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "UPDATE precandidate SET splicing_evidence=0;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#cat precandidate_locations.bed4 | while read bedline; do 
#	echo $bedline | tr ' ' '\t' > bedline.bed.tmp ;
#	precand_pk=$(echo $bedline | cut -f 4 -d ' ') ;
#
#	for d00d in $( echo "SELECT person_name FROM precandidate_lookup WHERE precand_id="$precand_pk";" | mysql $db_name --password="$pswd" --user="$user" -N | sort | uniq ) ; do 
#		bedtools intersect -wa -u -a bedline.bed.tmp -b individuals/"$d00d"/"$d00d"_splicedReads.exons.bed6 | sed -e 's/^/'$d00d'\t/' | cut -f 1 | sort | uniq >> precandidate_splicingEvidence.list ; 
#	done;

#	echo "UPDATE precandidate SET splicing_evidence="$(cat precandidate_splicingEvidence.list | wc -l)" WHERE precandidate.precand_pk = "$precand_pk";" | mysql $db_name --password="$pswd" --user="$user" -N ;

#	rm bedline.bed.tmp ;
#	rm precandidate_splicingEvidence.list ;
#done 

###################################################################################################################################################

#echo "###		Annotate precandidates re: lowCov_warning in transcripts..."
#	note what fraction of the source alignments for each precandidate have lowcov warnings
#echo "ALTER TABLE precandidate ADD COLUMN lowcov_warning_fraction real;" | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "SELECT p.precand, sum(a.lowcov_warning), count(*), sum(a.lowcov_warning)/count(*) FROM alignment a, precandidate_lookup p WHERE a.aln_pk=p.aln_id GROUP BY p.precand;" | mysql $db_name --password="$pswd" --user="$user" -N | tr '|' '\t' | awk '{print "UPDATE precandidate SET lowcov_warning_fraction="$4" WHERE precandidate.precand_pk="$1";"}' | mysql $db_name --password="$pswd" --user="$user" -N ;
#echo "###		...done!"

###################################################################################################################################################




