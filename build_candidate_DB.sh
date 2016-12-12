#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)


echo "CREATE TABLE orf SELECT * FROM orf_HG00096 WHERE 1=0;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE orf DROP COLUMN orf_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
echo "ALTER TABLE orf ADD COLUMN orf_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N

echo "ALTER TABLE orf ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE orf ADD COLUMN person_name varchar(20);" |  mysql $db_name --password="$pswd" --user="$user" -N
echo "ALTER TABLE orf ADD COLUMN person_id int;" |  mysql $db_name --password="$pswd" --user="$user" -N

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating orfs for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );


#	echo "INSERT INTO orf (old_pk, trans, start, stop, absent_from_pdb, no_duplicates, no_pan_homologous_ORF, no_gor_homologous_ORF, unseen_in_pan_refgenome, unseen_in_gor_refgenome, person_name, person_id) SELECT o.orf_pk, o.trans, o.start, o.stop, o.absent_from_pdb, o.no_duplicates, o.no_pan_homologous_ORF, o.no_gor_homologous_ORF, o.unseen_in_pan_refgenome, o.unseen_in_gor_refgenome, l.person_name, l.person_id FROM orf_"$d00d" o, precandidate_lookup l WHERE o.orf_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);" |  mysql $db_name --password="$pswd" --user="$user" -N 
	echo "INSERT INTO orf (old_pk, trans, start, stop, absent_from_pdb, no_duplicates, no_pan_homologous_ORF, no_gor_homologous_ORF, unseen_in_pan_refgenome, unseen_in_gor_refgenome, person_name, person_id) SELECT DISTINCT o.orf_pk, o.trans, o.start, o.stop, o.absent_from_pdb, o.no_duplicates, o.no_pan_homologous_ORF, o.no_gor_homologous_ORF, o.unseen_in_pan_refgenome, o.unseen_in_gor_refgenome, l.person_name, l.person_id FROM orf_"$d00d" o, precandidate_lookup l WHERE o.orf_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);" |  mysql $db_name --password="$pswd" --user="$user" -N 

done

echo "ALTER TABLE orf ADD COLUMN sequence text;" |  mysql $db_name --password="$pswd" --user="$user" -N 

echo "select person_name, trans, start, stop, orf_pk from orf;" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/Trinity_files.Trinity.fasta "$2":"$3"-"$4"~"$5}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > orf_sequence.upload.dat

mv orf_sequence.upload.dat /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, orf_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
time echo "LOAD DATA INFILE 'orf_sequence.upload.dat' INTO TABLE temp (orf_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
echo "UPDATE orf o, temp t SET o.sequence=t.sequence where o.orf_pk=t.orf_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"


###############	
#	Auxiliary ORFs; used for comparison

###1. Rando intergenic ORFs
# DATA_DIR='/netscr/csoeder/1kGen/data'
# module load fastx_toolkit
# bedtools makewindows -w 2500 -s 1000 -g $DATA_DIR/hg19.fa.clean.fai | bedtools intersect -split -v -wa -a - -b $DATA_DIR/UCSC_exons.bed $DATA_DIR/refSeq_exons.bed $DATA_DIR/complicated_repeats.bed $DATA_DIR/yalepseudo_exons.bed $DATA_DIR/retroposed*_exons.bed > non_exonic_windows.bed
# bedtools intersect -v -wa -a non_exonic_windows.bed -b $DATA_DIR/UCSC_genes.bed $DATA_DIR/refSeq_genes.bed $DATA_DIR/complicated_repeats.bed $DATA_DIR/yalepseudo.bed $DATA_DIR/retroposed*.bed > fully_intergenic_windows.bed
# bedtools getfasta -fi hg19.fa -bed non_exonic_windows.bed -fo non_exonic_windows.fa
# bedtools getfasta -fi hg19.fa -bed fully_intergenic_windows.bed -fo fully_intergenic_windows.fa
# python $SCRIPT_DIR/ORF_extract.py non_exonic_windows.fa rough_non_exonic_ORFs.fa
# python $SCRIPT_DIR/garbageman.py rough_non_exonic_ORFs.fa non_exonic_ORFs.fa
# python $SCRIPT_DIR/ORF_extract.py fully_intergenic_windows.fa rough_fully_intergenic_ORFs.fa
# python $SCRIPT_DIR/garbageman.py rough_fully_intergenic_ORFs.fa fully_intergenic_ORFs.fa
# grep ">" fully_intergenic_ORFs.fa | cut -f 2 -d ">" > fully_intergenic_ORFs.list
# grep ">" non_exonic_ORFs.fa | cut -f 2 -d ">" > non_exonic_ORFs.list
# for orf in $(python ~/modules/randoLine.py fully_intergenic_ORFs.list 2000); do samtools faidx fully_intergenic_ORFs.fa  $orf; done > fully_intergenic_ORFs.subsample.fa
# for orf in $(python ~/modules/randoLine.py non_exonic_ORFs.list 2000); do samtools faidx non_exonic_ORFs.fa  $orf; done > non_exonic_ORFs.subsample.fa
#fasta_formatter -i fully_intergenic_ORFs.subsample.fa -o fully_intergenic_ORFs.subsample.tsv -t
#fasta_formatter -i non_exonic_ORFs.subsample.fa -o non_exonic_ORFs.subsample.tsv -t

###3. Rando known genes
#### wget ftp://ftp.ensembl.org/pub/release-83/fasta/homo_sapiens/cds/Homo_sapiens.GRCh38.cds.all.fa.gz
#### gzip -d Homo_sapiens.GRCh38.cds.all.fa.gz
#### python $SCRIPT_DIR/garbageman.py Homo_sapiens.GRCh38.cds.all.fa Homo_sapiens.trimmedCDS.fa
#### grep ">" Homo_sapiens.trimmedCDS.fa | cut -f 2 -d ">" | cut -f 1 -d ' ' > Homo_sapiens.trimmedCDS.list
#### for orf in $(python ~/modules/randoLine.py Homo_sapiens.trimmedCDS.list 2000); do samtools faidx Homo_sapiens.trimmedCDS.fa $orf; done > Homo_sapiens.trimmedCDS.subsample.fa
#### fasta_formatter -i Homo_sapiens.trimmedCDS.subsample.fa -o Homo_sapiens.trimmedCDS.subsample.tsv -t

#wget http://horfdb.dfci.harvard.edu/docs/human_orfeome81.tar.gz
#(may need fixing)
#python $SCRIPT_DIR/garbageman.py human_orfeome81.fa human_orfeome81.trimmed.fa
#fasta_formatter -i human_orfeome81.trimmed.fa -o human_orfeome81.trimmed.tsv -t
#python ~/modules/randoLine.py human_orfeome81.trimmed.tsv 2000 > human_orfeome81.trimmed.subsample.tsv



### steps 1-3 occur on killdevil atm
echo "loading auxiliary ORFs";
echo "CREATE TABLE auxiliary_orf (auxorf_pk INTEGER AUTO_INCREMENT PRIMARY KEY, identifier varchar(100), type varchar(50), sequence text);" |mysql $db_name --password="$pswd" --user="$user"

awk '{print $0,"fully_intergenic"}' fully_intergenic_ORFs.subsample.tsv | tr ' ' '\t' > auxiliary_ORFs.upload.dat
awk '{print $0,"non_exonic"}' non_exonic_ORFs.subsample.tsv | tr ' ' '\t' >> auxiliary_ORFs.upload.dat
awk '{print $0,"cds"}' Homo_sapiens.trimmedCDS.subsample.tsv | tr ' ' '\t' >> auxiliary_ORFs.upload.dat

mv auxiliary_ORFs.upload.dat /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
time echo "LOAD DATA INFILE 'auxiliary_ORFs.upload.dat' INTO TABLE auxiliary_orf (identifier,sequence,type);" | mysql $db_name --password="$pswd" --user="$user" ;








echo "CREATE TABLE alignment SELECT * FROM alignment_HG00096 WHERE 1=0;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE alignment DROP COLUMN aln_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
echo "ALTER TABLE alignment ADD COLUMN aln_pk INTEGER AUTO_INCREMENT PRIMARY KEY;" |  mysql $db_name --password="$pswd" --user="$user" -N

echo "ALTER TABLE alignment ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE alignment ADD COLUMN person_name varchar(20);" |  mysql $db_name --password="$pswd" --user="$user" -N 
#echo "ALTER TABLE alignment ADD COLUMN person_id int;" |  mysql $db_name --password="$pswd" --user="$user" -N 

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating alignments for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );


#	echo "INSERT INTO alignment (old_pk, trans,chrom,start,stop,qstart,qstop,strand,no_direct_overlap,no_accumulated_overlap, person_name, person_id) SELECT a.aln_pk, a.trans, a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, a.no_direct_overlap,a.no_accumulated_overlap, l.person_name, l.person_id FROM alignment_"$d00d" a, precandidate_lookup l WHERE a.aln_pk=l.aln_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);"	|  mysql $db_name --password="$pswd" --user="$user" -N 

	echo "INSERT INTO alignment (old_pk, trans,chrom,start,stop,qstart,qstop,strand,no_direct_overlap,no_accumulated_overlap, person_name, person_id, block_count, block_sizes, block_starts ) SELECT DISTINCT a.aln_pk, a.trans, a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, a.no_direct_overlap,a.no_accumulated_overlap, l.person_name, l.person_id, block_count, block_sizes, block_starts FROM alignment_"$d00d" a, precandidate_lookup l WHERE a.aln_pk=l.aln_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);"	|  mysql $db_name --password="$pswd" --user="$user" -N 
done




echo "CREATE TABLE transcript SELECT * FROM transcript_HG00096 WHERE 1=0;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE transcript DROP COLUMN trans_pk;" |  mysql $db_name --password="$pswd" --user="$user" -N
echo "ALTER TABLE transcript ADD COLUMN trans_pk INTEGER AUTO_INCREMENT PRIMARY KEY" |  mysql $db_name --password="$pswd" --user="$user" -N

echo "ALTER TABLE transcript ADD COLUMN old_pk int;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "ALTER TABLE transcript ADD COLUMN person_name varchar(20);"  |  mysql $db_name --password="$pswd" --user="$user" -N 

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "consolidating transcripts for $d00d";
	d00d_pk=$(echo "SELECT person_pk FROM person WHERE person_name='$d00d';" |  mysql $db_name --password="$pswd" --user="$user" -N );

#	echo "INSERT INTO transcript (old_pk, comp_name, person_name, source) SELECT t.trans_pk, t.comp_name, l.person_name, l.person_id FROM transcript_"$d00d" t, orf o, precandidate_lookup l WHERE o.trans=t.comp_name AND o.old_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);"  |  mysql $db_name --password="$pswd" --user="$user" -N 
	echo "INSERT INTO transcript (old_pk, comp_name, person_name, source) SELECT DISTINCT t.trans_pk, t.comp_name, l.person_name, l.person_id FROM transcript_"$d00d" t, orf o, precandidate_lookup l WHERE o.trans=t.comp_name AND o.old_pk=l.orf_id AND l.person_name='"$d00d"' AND l.precand_id IN (SELECT precand_pk FROM candidate);"  |  mysql $db_name --password="$pswd" --user="$user" -N 


done

echo "ALTER TABLE transcript ADD COLUMN sequence text;" |  mysql $db_name --password="$pswd" --user="$user" -N 
echo "select person_name, comp_name, trans_pk from transcript;" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "samtools faidx individuals/"$1"/Trinity_files.Trinity.fasta "$2"~"$3}' | sed 's/~/ | fasta_formatter -t |~/' | sed 's/~/awk "{print $0,/' | awk '{print $0, "}"}' | sed 's/$/\"/'| sed "s/\"/'/g" | sh | awk '{print $3,$2}' | tr ' ' '\t' > trans_sequence.upload.dat

mv trans_sequence.upload.dat /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
echo "CREATE TABLE temp (temp_pk INTEGER AUTO_INCREMENT PRIMARY KEY, trans_id int, sequence text);" |mysql $db_name --password="$pswd" --user="$user"
echo "LOAD DATA INFILE 'trans_sequence.upload.dat' INTO TABLE temp (trans_id, sequence);" | mysql $db_name --password="$pswd" --user="$user" ;
echo "UPDATE transcript s, temp t SET s.sequence=t.sequence where s.trans_pk=t.trans_id;" | mysql $db_name --password="$pswd" --user="$user" -N ;
echo "DROP TABLE temp;" |mysql $db_name --password="$pswd" --user="$user"




###############	
#	Auxiliary transcripts; used for comparison
# module load fastx_toolkit
#rando_count=1500

####1. choose rando chunks of the genome, same size distribution as candidate transcripts
#bedtools makewindows -g hg19.fa.clean.fai -w 320 > transcript_like_windows.bed 	#	avg. transcript length is ~320
#python ~/modules/randoLine.py non_exonic_windows.bed $rando_count > non_exonic_windows.subsample.bed
#python ~/modules/randoLine.py fully_intergenic_windows.bed $rando_count > fully_intergenic_windows.subsample.bed
#bedtools getfasta -fi hg19.fa -bed non_exonic_windows.subsample.bed -fo non_exonic_windows.subsample.fa
#bedtools getfasta -fi hg19.fa -bed fully_intergenic_windows.subsample.bed -fo fully_intergenic_windows.subsample.fa
#fasta_formatter -i non_exonic_windows.subsample.fa -o non_exonic_windows.subsample.tsv -t
#fasta_formatter -i fully_intergenic_windows.subsample.fa -o fully_intergenic_windows.subsample.tsv -t

####2. choose rando ILS anoms
#rm rando_ils_anom_transcripts.fa
#for folder in $(ls) ; do cat $folder/ILS_anom.list | sed -e 's/^/'$folder'\/Trinity_files.Trinity.fasta /' >> ../all_ils_anom_transcripts.list; done
#python ~/modules/randoLine.py ../all_ils_anom_transcripts.list $rando_count | while read lookup; do samtools faidx $lookup >> ../rando_ils_anom_transcripts.fa; done
#fasta_formatter -i ../rando_ils_anom_transcripts.fa -o ../rando_ils_anom_transcripts.tsv -t


###4. grab a selection of ILS.knowns 
#rm rando_ils_known_transcripts.fa
#for folder in $(ls) ; do cat $folder/ILS_known.list | sed -e 's/^/'$folder'\/Trinity_files.Trinity.fasta /' >> ../all_ils_known_transcripts.list; done
#python ~/modules/randoLine.py ../all_ils_known_transcripts.list $rando_count | while read lookup; do samtools faidx $lookup >> ../rando_ils_known_transcripts.fa; done
#fasta_formatter -i ../rando_ils_known_transcripts.fa -o ../rando_ils_known_transcripts.tsv -t

###5. grab a selection of true gene transcripts ;
#ftp://ftp.ensembl.org/pub/release-83/fasta/homo_sapiens/cdna/
#wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/bigZips/refMrna.fa.gz
#gzip -d refMrna.fa.gz
#fasta_formatter -i refMrna.fa -o refMrna.tsv -t
#python ~/modules/randoLine.py refMrna.tsv $rando_count  | tr -s ' ' | tr ' ' '_'  > refMrna.subsample.tsv

###	grab the coding/noncoding test data from CPAT
#wget http://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cpat/test.zip
#unzip test.zip
#fasta_formatter -i Human_test_RefSeq_coding_mRNA.fa -o CPAT_coding.tsv -t
#fasta_formatter -i Human_test_broad_lincRNA_mRNA.fa -o CPAT_noncoding.tsv -t


### 1-5 happen on killdevil atm
echo "loading auxiliary transcripts";
echo "CREATE TABLE auxiliary_transcript (auxtrans_pk INTEGER AUTO_INCREMENT PRIMARY KEY, identifier varchar(100), type varchar(50), sequence text);" |mysql $db_name --password="$pswd" --user="$user"

awk '{print $0,"ils_anom"}' rando_ils_anom_transcripts.tsv | tr ' ' '\t' > auxiliary_transcripts.upload.dat
awk '{print $0,"ils_known"}' rando_ils_known_transcripts.tsv | tr ' ' '\t' >> auxiliary_transcripts.upload.dat
awk '{print $0,"refseq_mrna"}' refMrna.subsample.tsv | tr ' ' '\t' >> auxiliary_transcripts.upload.dat
cat CPAT_coding.tsv | tr -d ' ' | awk '{print $0,"cpat_coding"}' | tr ' ' '\t'  >> auxiliary_transcripts.upload.dat
cat CPAT_noncoding.tsv | tr -d ' ' | awk '{print $0,"cpat_noncoding"}' | tr ' ' '\t'  >> auxiliary_transcripts.upload.dat
awk '{print $0,"nonexonic_chunks"}' non_exonic_windows.subsample.tsv | tr ' ' '\t' > auxiliary_transcripts.upload.dat
awk '{print $0,"nongenic_chunks"}' fully_intergenic_windows.subsample.tsv | tr ' ' '\t' > auxiliary_transcripts.upload.dat

mv auxiliary_transcripts.upload.dat /var/lib/mysql/"$db_name"/ ; 	#	mysql is being bizarre on monstar
echo "LOAD DATA INFILE 'auxiliary_transcripts.upload.dat' INTO TABLE auxiliary_transcript (identifier,sequence,type);" | mysql $db_name --password="$pswd" --user="$user" ;



###############	

for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "dropping ancillary tables for $d00d";

	echo "DROP TABLE alignment_"$d00d";"  |  mysql $db_name --password="$pswd" --user="$user" -N ;
	echo "DROP TABLE orf_"$d00d";"  |  mysql $db_name --password="$pswd" --user="$user" -N ;
	echo "DROP TABLE transcript_"$d00d";" |  mysql $db_name --password="$pswd" --user="$user" -N ;

done



