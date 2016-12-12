#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)


echo "###		uploading transcript names..."
for d00d in $(ls individuals/ | grep $subsetFilter); do 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );
	grep comp individuals/"$d00d"/revComp/clean_assemblies.revComp.fa | cut -f 2 -d ">" | cut -f 1 -d " " | awk '{print $0,"'$d00d_pk'"}' | tr ' ' '|' | tr '|' '\t' >> temp.csv ;
	mv temp.csv /var/lib/mysql-files/ ; 	#	mysql is being bizarre on monstar
	echo "LOAD DATA INFILE '/var/lib/mysql-files/temp.csv' INTO TABLE transcript_"$d00d" (comp_name, source);" | mysql $db_name --password="$pswd" --user="$user" ;
done;
rm /var/lib/mysql/"$db_name"/temp.csv ;

echo "###		...done uploading transcript names!"


echo "###		Collecting transcript alignments..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N  );
	for revcomp in $(grep comp individuals/"$d00d"/revComp/clean_assemblies.revComp.fa | cut -f 2 -d ">" | cut -f 1 -d " "); do
		comp=$(echo $revcomp | cut -f 2,3,4 -d _)

		echo "INSERT INTO alignment_"$d00d" (person_id, chrom, start, stop, trans, strand, qstart, qstop, block_count, block_sizes, block_starts, no_direct_overlap) SELECT person_id, chrom, start, stop, '$revcomp', strand, qstart, qstop, block_count, block_sizes, block_starts, no_direct_overlap FROM alignment_"$d00d" WHERE trans='$comp' ;" >> revComp.alignments.sql
	done 
done;

cat revComp.alignments.sql | mysql $db_name --password="$pswd" --user="$user" ;

echo "###		Upload the ORFs pulled from the ILS anomalies..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" | mysql $db_name --password="$pswd" --user="$user" -N );

	grep ">" individuals/"$d00d"/revComp/precleaned_ORFs.fa | tr -d ">" | tr ':' '\t' | tr '-' '\t' | sort | uniq  > precleaned_orfs.tmp ;
	mv precleaned_orfs.tmp /var/lib/mysql-files/
	echo "LOAD DATA INFILE '/var/lib/mysql-files/precleaned_orfs.tmp' INTO TABLE orf_"$d00d" (trans, start, stop);" | mysql $db_name --password="$pswd" --user="$user" ;

done
echo "###		... done uploading ORFs!"

echo "###		annotating ORFs as having hits to the Protein DataBase..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N | grep revComp | awk '{print $1":"$2"-"$3,$4}' > orfs.list

	grep -wFf  individuals/"$d00d"/revComp/found_in_PDB.list orfs.list | awk '{print $2,"0"}' | tr ' ' '\t' > PDB_orfs.dat.tmp ; 
	grep -wFf  individuals/"$d00d"/revComp/absent_from_PDB.list orfs.list | awk '{print $2,"1"}' | tr ' ' '\t' >> PDB_orfs.dat.tmp ; 

	awk '{print "UPDATE orf_'$d00d' SET absent_from_PDB=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' PDB_orfs.dat.tmp > sql_upload.PDB.tmp ;
	cat sql_upload.PDB.tmp | mysql $db_name --password="$pswd" --user="$user" ;

	rm PDB_orfs.dat.tmp;
	rm orfs.list ; 
	rm sql_upload.PDB.tmp ;
done ;
echo "###		... done annotating PDB hits!"

echo "###		annotating ORFs which appear in one xor many place in the human genome..."
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ;
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N | grep revComp | awk '{print $1":"$2"-"$3,$4}' > orfs.list
	cut -f 4 individuals/"$d00d"/revComp/no_duplicates.bed > nodupes.list ;
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
	echo "SELECT trans, start, stop, orf_pk FROM orf_"$d00d";"| mysql $db_name --password="$pswd" --user="$user" -N  | grep revComp | awk '{print $1":"$2"-"$3,$4}' > orfs.list
	grep -wFf individuals/"$d00d"/revComp/chimp.noncoding orfs.list  | awk '{print $2,"1"}' | tr ' ' '\t'  > chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/chimp.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '\t'  >> chimpCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/gorilla.noncoding orfs.list | awk '{print $2,"1"}' | tr ' ' '\t'  > gorillaCoding.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/gorilla.coding orfs.list  | awk '{print $2,"0"}' | tr ' ' '\t'  >> gorillaCoding.dat.tmp ;

	grep -wFf individuals/"$d00d"/revComp/unseen_in_pan.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t'| tr '|' '\t'   > chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' >> chimpMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/unseen_in_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' > gorillaMissing.dat.tmp ;
	grep -wFf individuals/"$d00d"/revComp/unseen_in_pan_and_gor.list orfs.list | awk '{print $2,"1|1"}' | tr ' ' '\t' | tr '|' '\t' >> gorillaMissing.dat.tmp ;

	awk '{print "UPDATE orf_'$d00d' SET no_pan_homologous_ORF=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' chimpCoding.dat.tmp > sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_gor_homologous_ORF=\""$2"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' gorillaCoding.dat.tmp >> sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_gor_homologous_ORF=\""$2"\", unseen_in_gor_refgenome=\""$3"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' gorillaMissing.dat.tmp >> sql_upload.compPrim.tmp ;
	awk '{print "UPDATE orf_'$d00d' SET no_pan_homologous_ORF=\""$2"\", unseen_in_pan_refgenome=\""$3"\" WHERE orf_'$d00d'.orf_pk=\""$1"\"; "}' chimpMissing.dat.tmp >> sql_upload.compPrim.tmp ;


	cat sql_upload.compPrim.tmp | mysql $db_name --password="$pswd" --user="$user" ;
done;


for d00d in $(ls individuals/ | grep [HN] ); do
	echo $d00d;
	echo "select trans, no_accumulated_overlap from alignment_$d00d;" | mysql blurp --password="$pswd" --user="$user" -N | awk '{print "revComp_"$0}' | awk -v dood="$d00d" '{print "update alignment_"dood" set no_accumulated_overlap="$2" where trans=|"$1"|;"}' | tr "|" "'" | mysql blurp --password="$pswd" --user="$user" ;
done




for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

	echo "SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk, t.comp_name, a.aln_pk FROM alignment_"$d00d" a, orf_"$d00d" o, transcript_"$d00d" t WHERE a.trans=o.trans AND t.comp_name=a.trans AND o.absent_from_pdb=1 AND o.no_duplicates=1 AND o.no_pan_homologous_ORF=1 AND o.no_gor_homologous_ORF=1 AND a.no_direct_overlap=1 AND a.no_accumulated_overlap=1 AND t.comp_name like '%revcomp%'; " | mysql $db_name --password="$pswd" --user="$user" -N > precandidates.tmp ;
	
#	2a. # grep "+" table.tmp | tr '|' '\t' |  awk '{print $1":"$2+$7-$4"-"$3-$5+$8, $10":"$7"-"$8}'
###	coordinate change from comp:a-b to chr:x-y. x=tstart+a-qstart; y=tend-qend+b
 
	grep "+" precandidates.tmp | tr '|' '\t' |  awk '{print $1,$2+($5-$8)+1,$3+($4-$7)+1,"-"}' | tr ' ' '\t' > precandidate_uploads.tmp
	grep "+" precandidates.tmp | tr '|' '\t' |  awk '{print $1,$2+($5-$8)+1,$3+($4-$7)+1,"-", $9, $11}' | tr ' ' '\t' > precandidate_lookup.tmp

#	2b. # grep "-" table.tmp | tr '|' '\t' | awk '{print $1":"$5+$2-$8"-"$4+$3-$7, $10":"$7"-"$8}'
###	rev strand: 	x=qend-b+tstart ; y=qstart+tend-a

# awk '{print $1,$3+($7-$5),$2+($8-$4),"+"}'

	grep "-" precandidates.tmp | tr '|' '\t' | awk '{print $1,$3+($7-$5),$2+($8-$4),"+"}' | tr ' ' '\t' >> precandidate_uploads.tmp
	grep "-" precandidates.tmp | tr '|' '\t' | awk '{print $1,$3+($7-$5),$2+($8-$4),"+",$9,$11}' | tr ' ' '\t' >> precandidate_lookup.tmp

	cp precandidate_uploads.tmp /var/lib/mysql-files/ ; 
	echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, strand varchar(2));" |mysql $db_name --password="$pswd" --user="$user"
	echo "LOAD DATA INFILE '/var/lib/mysql-files/precandidate_uploads.tmp' INTO TABLE temp (chrom, start, stop, strand);" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "INSERT  INTO precandidate (chrom, start, stop, strand) SELECT DISTINCT t.chrom, t.start, t.stop, t.strand FROM temp t  WHERE NOT EXISTS ( SELECT precand_pk FROM precandidate p WHERE p.chrom = t.chrom AND p.start = t.start AND p.stop=t.stop AND p.strand=t.strand );" | mysql $db_name --password="$pswd" --user="$user" ;

	echo "DROP TABLE temp;" | mysql $db_name --password="$pswd" --user="$user" ;


	awk '{print "SELECT  precand_pk  FROM precandidate WHERE chrom=\""$1"\" AND start="$2" AND stop="$3" AND strand=\""$4"\";" }' precandidate_uploads.tmp |  mysql $db_name --password="$pswd" --user="$user" -N | paste precandidate_lookup.tmp - | awk '{print "INSERT INTO precandidate_lookup (orf_id, aln_id, precand_id, person_id, person_name) VALUES ("$5", "$6", "$7", "'$d00d_pk'", \"""'$d00d'""\");" }' | mysql $db_name --password="$pswd" --user="$user" -N

done;



echo "###		.... precandidates called!"


echo "###	Rescanning the transcriptomes..."

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo $d00d ; 
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );
	echo "SELECT l.precand_id, o.trans, o.start, o.stop FROM orf_"$d00d" o, precandidate_lookup l WHERE l.orf_id=o.orf_pk AND l.person_name='"$d00d"' AND o.trans LIKE '%revcomp%' ORDER BY l.precand_id;"| mysql $db_name --password="$pswd" --user="$user" -N > lookback.pretable 
	
	while read line; do
		pk=$(echo $line | cut -f 1 -d ' ');
		compy=$(echo $line | cut -f 2 -d ' ');
		begin=$(echo $line | cut -f 3 -d ' ');
		end=$(echo $line | cut -f 4 -d ' ');
		echo $line;
		echo "$compy":"$begin"-"$end";
		samtools faidx individuals/"$d00d"/revComp/clean_assemblies.revComp.fa "$compy":"$begin"-"$end" >> precandidate_"$pk".fa;
	done < lookback.pretable
done;




for d00d in $(ls individuals/ | grep $subsetFilter ); do
	for i in $(ls | grep precandidate | grep fa | cut -f 1 -d '.' | cut -f 2 -d "_"); do 
		blastn -db individuals/"$d00d"/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/'$d00d'\t/' >> lookback_"$i".dat ;
	done;
done ; ####
echo "###	... lookback finished, annotating results in DB ... "



for i in $( ls | grep precandidate | grep fa | cut -f 1 -d '.' | cut -f 2 -d "_" ); do

	touch full_sneakthrough_ILS.roster;
	touch full_sneakthrough_accum.roster;
	touch full_sneakthrough_other.roster;

	python remove_blastHits_without_ORFs_strandInsensitive.py lookback_"$i".dat full_lookback_"$i".dat

	echo "SELECT person_name FROM precandidate_lookup WHERE precand_id="$i";" | mysql $db_name --password="$pswd" --user="$user" -N > "$i".markedExpressers.list ;
	grep -v -wFf "$i".markedExpressers.list full_lookback_"$i".dat > full_lookback_sneakthroughs_"$i".dat;
	grep -v -wFf "$i".markedExpressers.list lookback_"$i".dat > fragmentary_lookback_sneakthroughs_"$i".dat;

	while read line; do
		d00d=$(echo $line | cut -f 1 -d ' ');
		compy=$(echo $line | cut -f 3 -d ' ');

		grep -w -q $compy individuals/"$d00d"/ILS_known.list ;
		stat=$? ;
		if [ $stat -eq 0 ]; then 
			echo $d00d >> full_sneakthrough_ILS.roster ;
		else 
			grep -w -q $compy individuals/"$d00d"/mapt/accumulation_rejects.bed ;
			stat=$? ;
			if  [ $stat -eq 0 ]; then
				echo $d00d >> full_sneakthrough_accum.roster ;
			else
				echo $d00d >> full_sneakthrough_other.roster ;
			fi
		fi; 
	done < full_lookback_sneakthroughs_"$i".dat ;

	full_sneakthrough_ILS=$(sort full_sneakthrough_ILS.roster | uniq | wc -l );
	full_sneakthrough_accum=$(sort full_sneakthrough_accum.roster | uniq | wc -l );
	full_sneakthrough_other=$(sort full_sneakthrough_other.roster | uniq | wc -l );

	fragmentary_sneakthrough=$(cut -f 1 fragmentary_lookback_sneakthroughs_"$i".dat | sort | uniq | wc -l ) ;

	cut -f 1 lookback_"$i".dat | sort | uniq > in_which_"$i"_is_seen.list ; 
	blast_ghost=$(grep -v -wFf in_which_"$i"_is_seen.list "$i".markedExpressers.list | wc -l) ; 


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
PRIMATOMES_FOLDER="/home/csoeder/1kGen/primateomes"
for i in $( ls | grep precandidate | grep fa | cut -f 1 -d '.' | cut -f 2 -d "_" ); do
	blastn -db "$PRIMATOMES_FOLDER"/gor_142/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore'| sed -e 's/^/gor142\t/' >> gor_142_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/gor_143/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/gor143\t/' >> gor_143_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/pan_145/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/pan145\t/' >> pan_145_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/pan_146/Trinity_files.Trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/pan146\t/' >> pan_146_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/CHP_bigassembly_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/NHPRTR\t/' >> pan_NHPRTR_"$i".dat ;
	blastn -db "$PRIMATOMES_FOLDER"/GOR_UDG_trinity.fasta -query precandidate_"$i".fa -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send evalue bitscore' | sed -e 's/^/gorNHPRTR\t/' >> gor_NHPRTR_"$i".dat ; 
	echo "$i blasted!";
done ;



###################################################################################################################################################



###################################################################################################################################################

for i in $( ls | grep precandidate | grep fa | cut -f 1 -d '.' | cut -f 2 -d "_"  ); do

	echo "precandidate $i...."

	python remove_blastHits_without_ORFs_strandInsensitive.py gor_142_"$i".dat gor_142_"$i".postdat "$PRIMATOMES_FOLDER"/gor_142/Trinity_files.Trinity.fasta ;
	python remove_blastHits_without_ORFs_strandInsensitive.py gor_143_"$i".dat gor_143_"$i".postdat "$PRIMATOMES_FOLDER"/gor_143/Trinity_files.Trinity.fasta ;
	python remove_blastHits_without_ORFs_strandInsensitive.py gor_NHPRTR_"$i".dat gor_NHPRTR_"$i".postdat "$PRIMATOMES_FOLDER"/GOR_UDG_trinity.fasta ;
	python remove_blastHits_without_ORFs_strandInsensitive.py pan_145_"$i".dat pan_145_"$i".postdat "$PRIMATOMES_FOLDER"/pan_145/Trinity_files.Trinity.fasta ;
	python remove_blastHits_without_ORFs_strandInsensitive.py pan_146_"$i".dat pan_146_"$i".postdat "$PRIMATOMES_FOLDER"/pan_146/Trinity_files.Trinity.fasta ;
	python remove_blastHits_without_ORFs_strandInsensitive.py pan_NHPRTR_"$i".dat pan_NHPRTR_"$i".postdat "$PRIMATOMES_FOLDER"/CHP_bigassembly_trinity.fasta ;

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

echo "ALTER TABLE candidate RENAME candidate_noRevComp;" | mysql $db_name --password="$pswd" --user="$user" -N ;

echo "CREATE TABLE candidate SELECT * FROM precandidate  WHERE full_sneakthrough_ILS=0 AND full_sneakthrough_accum=0 AND full_sneakthrough_other=0 AND blast_ghosts=0 AND unseen_in_gor142=1 AND unseen_in_gor143=1 AND unseen_in_gorNHPRTR=1 AND unseen_in_pan145=1 AND unseen_in_pan146=1 AND unseen_in_panNHPRTR=1;" | mysql $db_name --password="$pswd" --user="$user" -N ;



