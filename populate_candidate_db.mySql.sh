
# hmmm... lookups from all the precandidates are being carried over in the lookup table
# this will cut out all but the candidates
echo "CREATE TABLE dummy (lookup int);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "INSERT INTO dummy (lookup) SELECT l.precandlookup_pk FROM precandidate_lookup l LEFT JOIN candidate c ON l.precand_id = c.precand_pk WHERE c.chrom IS NULL;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DELETE FROM precandidate_lookup WHERE precandlookup_pk IN (SELECT lookup FROM dummy);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DROP TABLE dummy;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "SELECT chrom, start, stop, precand_pk FROM candidate;" | mysql --user=csoeder --password=tha_snazzle murple -N > candidates_v4.unFiltered.bed
bedtools sort -i candidates_v4.unFiltered.bed > candidates_v4.unFiltered.sorted.bed

# hmmmmmmmmmm.... the reverse complement candidates seem to throw the locus estimator when they are splicing candidates
#cleanup pathological mappings:
#$ cat candidates.v4.unFiltered.bed | awk '{print $0, $3-$2}' | tr ' ' '\t' | sort -g -r -k 5 | head 
#chr11	0	126071019	8050	126071019
#[...]
#chr7	0	23511784	6355	23511784
#chr4	189712404	189716049	2735	3645

cat splice_stumble.patch | awk '{print "UPDATE candidate SET chrom=|"$2"|, start="$3", stop="$4" WHERE precand_pk="$1";"}' | tr "|" "'" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "SELECT chrom, start, stop, precand_pk FROM candidate;" | mysql --user=csoeder --password=tha_snazzle murple -N > candidates_v4.unFiltered.bed
bedtools sort -i candidates_v4.unFiltered.bed > candidates_v4.unFiltered.sorted.bed


#echo "SELECT chrom, start, stop, precand_pk FROM candidate;" | mysql --user=csoeder --password=tha_snazzle murple -N > candidates_v4.bed 
#bedtools sort -i candidates_v4.bed > candidates_v4.sorted.bed
bedtools intersect -wa -wb -a candidates_v3.sorted.bed -b candidates_v4.unFiltered.sorted.bed | awk 'BEGIN{OFS="\t"}{if($2==$7)print}' | awk 'BEGIN{OFS="\t"}{if($3==$8)print}' | awk 'BEGIN{OFS="\t"}{if($4!=$9)print}' | cut -f 4,9 > v3_v4.dischord.list
echo "ALTER TABLE candidate ADD COLUMN v3_pk int;"| mysql --user=csoeder --password=tha_snazzle murple -N
cat v3_v4.dischord.list | awk '{print "UPDATE candidate SET v3_pk ="$1" WHERE precand_pk="$2";"}' | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE candidate SET v3_pk = precand_pk WHERE v3_pk IS NULL AND precand_pk < 4287;" | mysql --user=csoeder --password=tha_snazzle murple -N 
##	^^ cutoff point

echo "ALTER TABLE candidate ADD COLUMN v3_igv_thumbs VARCHAR(20);"| mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN v3_igv_notes TEXT;"| mysql --user=csoeder --password=tha_snazzle murple -N
cat igv_flyover_v3.update | tr ' ' '~' | awk '{print "UPDATE candidate SET v3_igv_thumbs=|"$2"|, v3_igv_notes=|"$3"| WHERE v3_pk="$1";"}' | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N
cat igv_flyover_v3.update | tr ' ' '~' | awk '{print "UPDATE candidate SET v3_igv_thumbs=|"$2"|, v3_igv_notes=|"$3"| WHERE v3_pk IS NULL AND precand_pk="$1";"}' | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N


echo "ALTER TABLE candidate ADD COLUMN confirmed_splice_v3 BOOLEAN;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN notes_v3 TEXT;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN morenotes_v3 TEXT;" | mysql --user=csoeder --password=tha_snazzle murple -N
cat query_process/triage_v3.tbl | tr ' ' '~' | tr '→' '~' | awk '{print "UPDATE candidate SET notes_v3=|"$2"|, morenotes_v3=|"$3"| WHERE v3_pk="$1";"}'  | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N
cat query_process/triage_v3.tbl | tr ' ' '~' | tr '→' '~' |awk '{print "UPDATE candidate SET notes_v3=|"$2"|, morenotes_v3=|"$3"| WHERE v3_pk IS NULL AND precand_pk="$1";"}'  | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N

cat query_process/triage_v3.tbl | tr ' ' '~' | tr '→' '~' |awk '{print "UPDATE candidate SET notes_v3=|"$2"|, morenotes_v3=|"$3"| WHERE v3_pk="$1";"}'  | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N
cat query_process/triage_v3.tbl | tr ' ' '~' | tr '→' '~' |awk '{print "UPDATE candidate SET notes_v3=|"$2"|, morenotes_v3=|"$3"| WHERE v3_pk IS NULL AND precand_pk="$1";"}'  | tr '|' '"' | tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N

cat query_process/splice_confirmation_v3.tbl | awk '{print "UPDATE candidate SET confirmed_splice_v3 ="$2" WHERE v3_pk ="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N
cat query_process/splice_confirmation_v3.tbl | awk '{print "UPDATE candidate SET confirmed_splice_v3 ="$2" WHERE v3_pk IS NULL AND precand_pk="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE candidate ADD COLUMN v3_charlie_thumbs VARCHAR(20);" | mysql --user=csoeder --password=tha_snazzle murple -N 
cat query_process/v3_thumbs.tbl | awk '{print "UPDATE candidate SET v3_charlie_thumbs=|"$2"| WHERE v3_pk="$1";"}' | tr '|' '"' | mysql --user=csoeder --password=tha_snazzle murple -N 
cat query_process/v3_thumbs.tbl | awk '{print "UPDATE candidate SET v3_charlie_thumbs=|"$2"| WHERE v3_pk IS NULL AND precand_pk="$1";"}' | tr '|' '"' | mysql --user=csoeder --password=tha_snazzle murple -N 



#Once the IGV scan has been done:
echo "ALTER TABLE candidate ADD COLUMN v4_triage_thumbs VARCHAR(20);"| mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN v4_triage_notes TEXT;"| mysql --user=csoeder --password=tha_snazzle murple -N
cat query_process/triage_v4.tbl |  tr ' ' '~' | tr '→' '~'|awk '{print "UPDATE candidate SET ucsc_coords=|"$2"|, v4_triage_thumbs=|"$3"|, v4_triage_notes=|"$4"| WHERE precand_pk="$1";"}' |  tr '|' '"' | tr "~" " " |  mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE candidate ADD COLUMN v4_igv_thumbs VARCHAR(20);"| mysql --user=csoeder --password=tha_snazzle murple -N 
echo "ALTER TABLE candidate ADD COLUMN v4_igv_notes TEXT;"| mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE candidate ADD COLUMN confirmed_splice_v4 BOOLEAN;"| mysql --user=csoeder --password=tha_snazzle murple –N
echo "UPDATE candidate SET confirmed_splice_v4=confirmed_splice_v3;"| mysql --user=csoeder --password=tha_snazzle murple –N

cat igv_scan.raw | cut -f 1,5,6,7 | cut -f 1,3 | awk '{if($2!="")print"UPDATE candidate SET v4_igv_thumbs=|"$2"| WHERE precand_pk="$1";";}' | tr "|" "'" | mysql --user=csoeder --password=tha_snazzle murple –N
cat igv_scan.raw | cut -f 1,5,6,7 | cut -f 1,4 | tr -d "'" | tr " " "~" | awk '{if($2!="")print "UPDATE candidate SET v4_igv_notes=|"$2"| WHERE precand_pk="$1";";}' | tr "|" "'"| tr "~" " " | mysql --user=csoeder --password=tha_snazzle murple -N

cat query_process/splice_confirmation_v4.tbl | awk '{print "UPDATE candidate SET confirmed_splice_v4 ="$2" WHERE precand_pk ="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N



echo "ALTER TABLE candidate CHANGE COLUMN start old_start bigint(20);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate CHANGE COLUMN stop old_stop bigint(20);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN start bigint(20);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE candidate ADD COLUMN stop bigint(20);" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "UPDATE candidate SET start=old_start, stop=old_stop WHERE ucsc_coords IS NULL;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "SELECT precand_pk, ucsc_coords FROM candidate WHERE (ucsc_coords IS NOT NULL AND ucsc_coords != '');"| mysql --user=csoeder --password=tha_snazzle murple -N | tr ":" "\t" | tr -d "," | tr "-" "\t" | awk '{print "UPDATE candidate SET start="$3", stop="$4" WHERE precand_pk="$1";"}' | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE candidate SET start=old_start, stop=old_stop WHERE start IS NULL;" | mysql --user=csoeder --password=tha_snazzle murple -N


cat integrated_call_samples.20130502.ALL.ped | grep -v Fam | awk '{print $2,$3,$4,$5,$7}' | sed -e 's/ 1 / M /'| sed -e 's/ 2 / F /' | tr ' ' '\t' > pop_upload.dat 
sudo cp pop_upload.dat /usr/local/mysql/data/murple/
echo "ALTER TABLE person ADD COLUMN population varchar(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE person ADD COLUMN superpop varchar(10);"| mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE person ADD COLUMN sex varchar(5);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE person ADD COLUMN mother varchar(20);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE person ADD COLUMN father varchar(20);" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "CREATE TABLE temp (name varchar(20), pop varchar(10), sex varchar(5), mom varchar(20), dad varchar(20));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'pop_upload.dat' INTO TABLE temp (name, mom, dad, sex, pop) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "update person p, temp t SET p.population=t.pop, p.sex=t.sex, p.mother=t.mom, p.father=t.dad WHERE p.person_name = t.name;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "INSERT INTO person (population, sex, mother, father) SELECT t.pop, t.sex, t.mom, t.dad FROM temp t WHERE NOT EXISTS (SELECT person_pk FROM person p WHERE p.person_name=t.name) ; " | mysql --user=csoeder --password=tha_snazzle murple -N
echo "drop table temp;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "UPDATE person SET superpop='EAS' WHERE population='CHB'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EAS' WHERE population='JPT'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EAS' WHERE population='CHS'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EAS' WHERE population='CDX'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EAS' WHERE population='KHV'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EUR' WHERE population='CEU'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EUR' WHERE population='TSI'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EUR' WHERE population='FIN'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EUR' WHERE population='GBR'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='EUR' WHERE population='IBS'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='YRI'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='LWK'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='GWD'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='MSL'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='ESN'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='ASW'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AFR' WHERE population='ACB'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AMR' WHERE population='MXL'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AMR' WHERE population='PUR'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AMR' WHERE population='CLM'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='AMR' WHERE population='PEL'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='SAS' WHERE population='GIH'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='SAS' WHERE population='PJL'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='SAS' WHERE population='BEB'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='SAS' WHERE population='STU'; "| mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE person SET superpop='SAS' WHERE population='ITU'; "| mysql --user=csoeder --password=tha_snazzle murple -N
# source; http://www.1000genomes.org/category/frequently-asked-questions/population

#PHASE 3 ORPHANS: no phase 3 DNA-Seq available
#put this list together during v3
echo "ALTER TABLE person ADD COLUMN phase3orphan BOOLEAN;" | mysql --user=csoeder --password=tha_snazzle murple -N 
echo "UPDATE person SET phase3orphan = 0;" | mysql --user=csoeder --password=tha_snazzle murple -N 
echo "SELECT person_name FROM person WHERE phase3orphan = 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N | awk '{print "UPDATE person SET phase3orphan = 1 WHERE person_name = |"$1"|;"}' | tr "|" "'" | mysql --user=csoeder --password=tha_snazzle murple -N


## orfs
#orf sequences
#echo "ALTER TABLE orf ADD COLUMN sequence text;" | mysql --user=csoeder --password=tha_snazzle murple -N

#echo "select orf_pk, trans, start, stop, person_name from orf; " | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print "echo "$1"; samtools faidx individuals/"$5"/Trinity_files.Trinity.fasta "$2":"$3"-"$4" | grep -v comp > orf_"$1"}' | sh
#for orf_pk in $( echo "select orf_pk from orf; " | mysql --user=csoeder --password=tha_snazzle murple -N ); do 
#	sequence=$( cat orf_"$orf_pk" | tr -d '\n' );
#	echo "UPDATE orf SET sequence="$sequence" WHERE orf_pk="$orf_pk";" |  mysql --user=csoeder --password=tha_snazzle murple -N ;
#	rm orf_"$orf_pk";
#done

#calculate biochem, etc



# remove duplicates
#select o.trans, o.start, o.stop, l.person_name, o.old_pk, o.orf_pk from orf_bkup o, precandidate_lookup l where l.precand_id = 501 and l.orf_id = o.old_pk and l.person_name=o.person_name;
#select * from precandidate_lookup where person_name='HG00253' and (orf_id=1806 or orf_id=6984);
echo "ALTER TABLE orf RENAME AS orf_bkup;"| mysql --user=csoeder --password=tha_snazzle murple -N
echo "CREATE TABLE orf SELECT * FROM orf_bkup;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DELETE o1 FROM orf o1, orf o2 WHERE o1.orf_pk > o2.orf_pk AND o1.person_name = o2.person_name AND o1.trans=o2.trans AND o1.start=o2.start and o1.stop=o2.stop;"  | mysql --user=csoeder --password=tha_snazzle murple -N




echo "SELECT orf_pk, sequence FROM orf;" | mysql --user=csoeder --password=tha_snazzle murple -N > orfs.list
python ORFbiochem_SQLuploadPrepper.py orfs.list orf.biochem.dat
sudo cp orf.biochem.dat /usr/local/mysql/data/murple/
echo "ALTER TABLE orf ADD COLUMN isoelectric_point float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE orf ADD COLUMN aromaticity float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE orf ADD COLUMN hydrophobicity float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE orf ADD COLUMN instability float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE orf ADD COLUMN cai float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE orf ADD COLUMN gc float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "CREATE TABLE temp (orf_id int, pi float(10), aroma float(10), gravy float(10), instability float(10), gc float(10), cai float(10));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'orf.biochem.dat' INTO TABLE temp (orf_id, pi, aroma, gravy, instability, gc, cai) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE orf o, temp t SET o.isoelectric_point=t.pi, o.aromaticity=t.aroma, o.hydrophobicity=t.gravy, o.instability=t.instability, o.gc=t.gc, o.cai=t.cai WHERE o.orf_pk = t.orf_id;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DROP TABLE temp;" | mysql --user=csoeder --password=tha_snazzle murple -N 

echo "SELECT auxorf_pk, sequence FROM auxiliary_orf;" | mysql --user=csoeder --password=tha_snazzle murple -N > auxorfs.list
python ORFbiochem_SQLuploadPrepper.py auxorfs.list auxorf.biochem.dat
sudo cp auxorf.biochem.dat /usr/local/mysql/data/murple/
echo "ALTER TABLE auxiliary_orf ADD COLUMN isoelectric_point float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_orf ADD COLUMN aromaticity float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_orf ADD COLUMN hydrophobicity float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_orf ADD COLUMN instability float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_orf ADD COLUMN cai float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_orf ADD COLUMN gc float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "CREATE TABLE temp (orf_id int, pi float(10), aroma float(10), gravy float(10), instability float(10), gc float(10), cai float(10));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'auxorf.biochem.dat' INTO TABLE temp (orf_id, pi, aroma, gravy, instability, gc, cai) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE auxiliary_orf o, temp t SET o.isoelectric_point=t.pi, o.aromaticity=t.aroma, o.hydrophobicity=t.gravy, o.instability=t.instability, o.gc=t.gc, o.cai=t.cai WHERE o.auxorf_pk = t.orf_id;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DROP TABLE temp;" | mysql --user=csoeder --password=tha_snazzle murple -N 
 


echo "SELECT c.precand_pk, o.person_name, o.sequence FROM candidate c, orf o, precandidate_lookup l WHERE l.precand_id = c.precand_pk AND l.orf_id =o.old_pk AND l.person_name=o.person_name ORDER BY c.precand_pk ASC;" |  mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print ">"$1"_"$2"\n"$3}' > orfs_by_individual.fa



#Pull candidate by pk:
#peakay=144
#echo "select o.person_name, o.old_pk, o.sequence orf, t.person_name, t.old_pk, t.sequence transcript from precandidate_lookup l, orf o, transcript t where l.orf_id=o.old_pk and l.person_name=o.person_name and t.comp_name=o.trans and t.person_name=o.person_name and  precand_id=$peakay;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print ">orf_"$1"_"$2"\n"$3"\n>trans_"$4"_"$5"\n"$6}'  



#fine scale alignment:
blat -noHead  /proj/cdjones_lab/Genomics_Data_Commons/genomes/homo_sapiens/hg19/hg19.fa orfs_by_individual.fa orfs_by_individual.psl 
cat orfs_by_individual.psl |  awk '{if($1/$11>0.9)print}' | grep -v hap | grep -v Un | grep -v rand > orfs_by_individual.qcPass.psl
~/modules/UCSC/pslToBed orfs_by_individual.qcPass.psl  orfs_by_individual.bed

#double-check the fine-scale alignment:
#recontstruct sequences with the alignment and the reference genome:
bedtools getfasta -s -split -name -bed orfs_by_individual.bed -fi /proj/cdjones_lab/Genomics_Data_Commons/genomes/homo_sapiens/hg19/hg19.fa -fo orfs_by_individual.reconstructed.fa
python query_process/orf_sorter.py orfs_by_individual.reconstructed.fa orfs_by_individual.reconstructed

echo "ALTER TABLE candidate ADD COLUMN badmap BOOLEAN;" | mysql --user=csoeder --password=tha_snazzle murple -N 
cat orfs_by_individual.reconstructed.bad_maps.list | cut -f 1 -d "_" | sort | uniq | awk '{print "UPDATE candidate SET badmap=1 WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 





#develop a gene model:
cat orfs_by_individual.bed | bedtools bed12tobed6 -i | sort -k 1,1 -k2,2n -k3,3n > orfs_by_individual.exons.bed
awk '{print >> "orf_"$4".unannealed.exons.bed"; close($4)}' orfs_by_individual.exons.bed
for exons in $(ls | grep unannealed); do 
	echo $exons; 
	prefix=$(echo $exons | cut -f 1 -d .);
	bedtools merge -c 4,6 -o distinct -d 10 -i "$exons" > "$prefix".annealed.exons.bed; 
done
cat *.annealed.* > all.annealed.exons.bed
cat all.annealed.exons.bed | tr '_' '\t'  > all.annealed.exons.dat


echo "CREATE TABLE exon (exon_pk INT AUTO_INCREMENT PRIMARY KEY, chrom VARCHAR(20), start BIGINT, stop BIGINT, strand VARCHAR(2));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "CREATE TABLE exon_lookup (cand_id INT REFERENCES candidate(precand_pk), orf_id INT REFERENCES orf(orf_pk), person_name VARCHAR(20),exon_id INT REFERENCES exon(exon_pk));"| mysql --user=csoeder --password=tha_snazzle murple -N
echo "CREATE TABLE temp (chrom VARCHAR(20), start BIGINT, stop BIGINT, strand VARCHAR(2), cand_id INT, person_name VARCHAR(20));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'all.annealed.exons.dat' INTO TABLE temp (chrom, start, stop, cand_id, person_name, strand) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "INSERT INTO exon e (chrom, start, stop, strand) SELECT DISTINCT chrom, start, stop, strand FROM temp t;"
echo "INSERT INTO exon_lookup (cand_id, person_name, exon_id) SELECT t.cand_id, t.person_name, e.exon_pk FROM temp t, exon e WHERE t.chrom=e.chrom and t.start=e.start and t.stop=e.stop and t.strand=e.strand;"
echo "DROP TABLE temp;" | mysql --user=csoeder --password=tha_snazzle murple -N 


cat all.annealed.exons.bed | tr '_' '\t'  | awk '{print "INSERT INTO exon (chrom, start, stop, strand) VALUES (|"$1"|, "$2", "$3", |"$6"|);" }' | tr "|" "'" | mysql --user=csoeder --password=tha_snazzle murple -N
cat all.annealed.exons.bed | tr '_' '\t'  | awk '{print "INSERT INTO exon_lookup (cand_id, person_name, exon_id) VALUES ("$4", |"$5"|, (SELECT exon_pk FROM exon WHERE ));"}'



###########
## Relevent variants
#	ALL THIS HAPPENS ON KILLDEVIL ATM:
bedtools merge -i candidates_v4.unFiltered.sorted.bed > candidates_v4.unFiltered.sorted.merged.bed
cat candidates_v4.unFiltered.sorted.merged.bed | cut -f 2 -d 'r' > candidates_v4.unFiltered.sorted.merged.vcfReady.bed
for i in {1..22}; do 
	bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chr"$i".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --bed candidates_v4.unFiltered.sorted.merged.vcfReady.bed --recode --stdout | bgzip > miniVCF_"$i".vcf.gz" ; 
done
bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz --bed candidates_v4.unFiltered.sorted.merged.vcfReady.bed --recode --stdout | bgzip > miniVCF_X.vcf.gz"
bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chrY.phase3_integrated_v1a.20130502.genotypes.vcf.gz --bed candidates_v4.unFiltered.sorted.merged.vcfReady.bed --recode --stdout | bgzip > miniVCF_Y.vcf.gz"

# ### WAIT UNTIL THAT CHILLS OUT; tabix everything

# merge the VCFs??

vcf-concat -p  miniVCF_*.gz > merged.vcf

bgzip merged.vcf
tabix merged.vcf.gz
python VCF_to_SQLuploadPrepper.py merged.vcf.gz merged # 	---> merged_variant.dat, merged_variantLookup.dat
sudo cp merged_variant.dat /usr/local/mysql/data/murple/
sudo cp merged_variantLookup.dat /usr/local/mysql/data/murple/
echo "CREATE TABLE variant ( variant_pk int PRIMARY KEY, chrom varchar(20), pos bigint, ref_allele text, alt_alleles text, heterozygosity float(10), pi_hat float(10), snpDBid text, varType text, varSubtype text, meta text );" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'merged_variant.dat' INTO TABLE variant (variant_pk, chrom, pos, ref_allele, alt_alleles, heterozygosity, varType, varSubtype, pi_hat, snpDBid) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
#		variant_sql.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"%tuple([variant_pk,"chr%s"%rec.CHROM, rec.POS, rec.REF, alts, hetZyggy(rec), rec.var_type, rec.var_subtype, piHat(rec), rec.ID]))
echo "CREATE TABLE variant_lookup (varlookup_pk int PRIMARY KEY AUTO_INCREMENT, variant_id int, person_name varchar(20), genotype varchar(5));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'merged_variantLookup.dat' INTO TABLE variant_lookup (variant_id, person_name, genotype) ;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE candidate ADD COLUMN polygenic boolean DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE candidate c, variant v SET c.polygenic = 1 WHERE c.chrom=v.chrom AND c.start <= v.pos AND c.stop >= v.pos;" | mysql --user=csoeder --password=tha_snazzle murple -N



##coverage find & antifind
#CRUDE (whole-locus, exon/intron blind - do another one later on the bona fides)

#/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -a <annotation_file> -o <output_file> input_file1 [input_file2] 

####5column bed to 5 column SAF#
cat candidates_v4.unFiltered.sorted.bed | awk '{print $4,$1,$2,$3,$5}' | tr ' ' '\t' > candidates_v4.unFiltered.sorted.SAF
/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -F SAF  -a candidates_v4.unFiltered.sorted.SAF -o candidates_v4.unFiltered.expression_stats.dat individuals/*/*_mapsplice_alignment.sort.bam
tail -n +2 candidates_v4.unFiltered.expression_stats.dat > candidates_v4.unFiltered.expression_stats.noHead.dat 


python query_process/featureCounts_to_SQLuploadPrepper.py candidates_v4.unFiltered.expression_stats.dat candidates_v4.unFiltered.expression_stats.dat.summary candidates_v4.unFiltered.expression_stats
cut -f 3 candidates_v4.unFiltered.expression_stats.absoluteExpression.dat | paste candidates_v4.unFiltered.expression_stats.relativeExpression.dat - > candidates_v4.unFiltered.expression_stats.uploadReady.dat 
sudo cp candidates_v4.unFiltered.expression_stats.uploadReady.dat  /usr/local/mysql/data/murple/
echo "CREATE TABLE crude_expression (express_pk int PRIMARY KEY AUTO_INCREMENT, person_name varchar(20), candidate_id int, FPKM float(10), abs_frag_number float(10) );" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'candidates_v4.unFiltered.expression_stats.uploadReady.dat' INTO TABLE crude_expression (person_name, candidate_id, FPKM, abs_frag_number) ;" | mysql --user=csoeder --password=tha_snazzle murple -N




###	Annotate alignment locations as repetitive
#	echo "select chrom, start, stop, aln_pk from alignment;" | mysql --user=csoeder --password=tha_snazzle glurge -N > alignments.bed
echo "ALTER TABLE candidate ADD COLUMN repeat_warning BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
bedtools intersect -u -wa -a candidates_v4.unFiltered.bed -b data/simple_repeats.bed | awk '{print "UPDATE candidate SET repeat_warning=1 WHERE precand_pk = "$4";"}' > repeatWarning.upload.sql
cat repeatWarning.upload.sql | mysql --user=csoeder --password=tha_snazzle murple -N ;


###	Annotate intronic vs intergenic
echo "ALTER TABLE candidate ADD COLUMN intronic BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
bedtools intersect -u -wa -a candidates.bed -b data/refSeq_genes.bed | awk '{print "UPDATE candidate SET intronic=1 WHERE precand_pk = "$4";"}' > intronicList.upload.sql 
cat intronicList.upload.sql | mysql --user=csoeder --password=tha_snazzle murple -N ;


## chimp/gor regions mapped to
# 


###		Merging indistinct candidates
# echo "select chrom, start, stop, precand_pk, ucsc_coords from candidate where (v4_igv_thumbs='up' or v3_igv_thumbs='up');" | mysql --user=csoeder --password=tha_snazzle murple -N > candidates.dupeFind.full.bed;
# cut -f 1,2,3,4 candidates.dupeFind.full.bed > candidates.dupeFind.bed 

# #neither start nor stop shared (allegedly)
# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | awk '{if($4!=$8)print;}' | awk '{if($2!=$6)print;}' | awk '{if($3!=$7)print;}' | awk '{if($4<$8)print}' > unsharedStop_unsharedStart.doublebed
# #hand curation.......
# #merge the degenerate cases
# cat unsharedStop_unsharedStart.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep degen | cut -f 4,8,11,12 | awk '{print"UPDATE candidate SET start="$3", stop="$4" WHERE (precand_pk="$1" OR precand_pk="$2");"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 
# #make any corrections to the distinct cases
# cat unsharedStop_unsharedStart.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,11,12 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 
# cat unsharedStop_unsharedStart.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,14,15 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 

# #only stops shared (allegedly)
# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | awk '{if($4!=$8)print;}' | awk '{if($2!=$6)print;}' | awk '{if($3==$7)print;}' | awk '{if($4<$8)print}' > shared_stops.doublebed
# cat shared_stops.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep degen | cut -f 4,8,11,12 | awk '{print"UPDATE candidate SET start="$3", stop="$4" WHERE (precand_pk="$1" OR precand_pk="$2");"}' | mysql --user=csoeder --password=tha_snazzle murple -N 
# cat shared_stops.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,11,12 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' | mysql --user=csoeder --password=tha_snazzle murple -N 
# cat shared_stops.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,14,15 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' | mysql --user=csoeder --password=tha_snazzle murple -N 

# #only starts shared (allegedly)
# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | awk '{if($4!=$8)print;}' | awk '{if($2==$6)print;}' | awk '{if($3!=$7)print;}' | awk '{if($4<$8)print}' > shared_starts.doublebed
# cat shared_starts.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep degen | cut -f 4,8,11,12 | awk '{print"UPDATE candidate SET start="$3", stop="$4" WHERE (precand_pk="$1" OR precand_pk="$2");"}' | mysql --user=csoeder --password=tha_snazzle murple -N 
# cat shared_starts.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,11,12 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' | mysql --user=csoeder --password=tha_snazzle murple -N 
# cat shared_starts.predat | tr -d "," | tr ":" "\t" | tr "-" "\t" | grep dist | cut -f 4,14,15 | head | awk '{print"UPDATE candidate SET start="$2", stop="$3" WHERE precand_pk="$1";"}' | mysql --user=csoeder --password=tha_snazzle murple -N 

# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | head
# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | awk '{if($4!=$8)print;}' | awk '{if($2==$6)print;}' | awk '{if($3==$7)print;}' | cut -f 4,8 > trivial_duplications.list
# bedtools intersect -wa -wb -a candidates.dupeFind.bed -b candidates.dupeFind.bed | awk '{if($4!=$8)print;}' | awk '{if($2==$6)print;}' | awk '{if($3!=$7)print;}' | awk '{if($4<$8)print}' > shared_starts.doublebed


echo "select c.precand_pk, c.chrom, c.start, c.stop, c.strand, k.precand_pk, k.chrom, k.start, k.stop, k.strand from candidate c, candidate k where abs(c.start-k.start)<5 and c.start != k.start  and c.precand_pk != k.precand_pk and c.chrom=k.chrom ;" | mysql --user=csoeder --password=tha_snazzle murple -N > overlapping_starts.predat
#	manual checking
cat overlapping_starts.dat | tr -d "," | cut -f 1,11 | awk '{print "UPDATE candidate SET start="$2" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 
cat overlapping_starts.dat | tr -d "," | cut -f 6,12 | awk '{print "UPDATE candidate SET start="$2" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 

echo "select c.precand_pk, c.chrom, c.start, c.stop, c.strand, k.precand_pk, k.chrom, k.start, k.stop, k.strand from candidate c, candidate k where abs(c.stop-k.stop)<5 and c.stop != k.stop  and c.precand_pk != k.precand_pk and c.chrom=k.chrom and c.strand=k.strand ;" | mysql --user=csoeder --password=tha_snazzle murple -N > overlapping_stops.predat
#	manual checking
cat overlapping_stops.dat  | tr -d "," | cut -f 1,11 | awk '{print "UPDATE candidate SET stop="$2" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 
cat overlapping_stops.dat  | tr -d "," | cut -f 6,12 | awk '{print "UPDATE candidate SET stop="$2" WHERE precand_pk="$1";"}' |  mysql --user=csoeder --password=tha_snazzle murple -N 


echo "CREATE TABLE gene SELECT * FROM candidate WHERE 1=0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v3_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN badmap;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v3_igv_thumbs;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v3_igv_notes;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN confirmed_splice_v3;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN notes_v3;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN morenotes_v3;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v3_charlie_thumbs;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN ucsc_coords;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v4_triage_thumbs;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v4_triage_notes;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN old_start;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN old_stop;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN phase3orphan;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v4_igv_notes;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN v4_igv_thumbs;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN confirmed_splice_v4;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_pan145;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_pan146;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_gor142;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_gor143;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_panNHPRTR;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene DROP COLUMN unseen_in_gorNHPRTR;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene ADD COLUMN cand_id INT;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene ADD COLUMN confirmed_splice BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene ADD COLUMN triage_notes TEXT;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene ADD COLUMN legit BOOLEAN DEFAULT 1;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene ADD COLUMN gene_pk INT AUTO_INCREMENT PRIMARY KEY;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE gene CHANGE COLUMN full_sneakthrough_ILS full_sneakthrough_ILS INT DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN full_sneakthrough_accum full_sneakthrough_accum INT DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN full_sneakthrough_other full_sneakthrough_other INT DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_lookback fragmentary_lookback INT DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN blast_ghosts blast_ghosts INT DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_pan145 fragmentary_in_pan145 BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_pan146 fragmentary_in_pan146 BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_gor142 fragmentary_in_gor142 BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_gor143 fragmentary_in_gor143 BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_panNHPRTR fragmentary_in_panNHPRTR BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene CHANGE COLUMN fragmentary_in_gorNHPRTR fragmentary_in_gorNHPRTR BOOLEAN DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "INSERT INTO gene (chrom, start, stop, strand) (SELECT DISTINCT chrom, start, stop, strand FROM candidate WHERE (v4_igv_thumbs='up' or v3_igv_thumbs='up'));" | mysql --user=csoeder --password=tha_snazzle murple -N

#echo "SELECT DISTINCT chrom, start, stop, strand FROM candidate WHERE (v4_igv_thumbs='up' or v3_igv_thumbs='up');" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "CREATE TABLE gene_lookup SELECT * FROM precandidate_lookup WHERE 1=0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene_lookup CHANGE COLUMN precandlookup_pk genelookup_pk INT;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE gene_lookup CHANGE COLUMN precand_id gene_id INT;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "CREATE TABLE candidate_promotion (prom_pk INT AUTO_INCREMENT PRIMARY KEY, cand_id INT, gene_id INT);" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "SELECT precand_pk, chrom, start, stop, strand, full_sneakthrough_ILS, full_sneakthrough_accum, full_sneakthrough_other, blast_ghosts, fragmentary_in_pan145, fragmentary_in_pan146, fragmentary_in_gor142, fragmentary_in_gor143, fragmentary_in_panNHPRTR, fragmentary_in_gorNHPRTR FROM candidate WHERE (v4_igv_thumbs='up' or v3_igv_thumbs='up');" | mysql --user=csoeder --password=tha_snazzle murple -N | while read line; do 
	cand_pk=$(echo $line | tr ' ' '\t' | cut -f 1) ; 
	chrom=$(echo $line | tr ' ' '\t' | cut -f 2) ; 
	start=$(echo $line | tr ' ' '\t' | cut -f 3) ; 
	stop=$(echo $line | tr ' ' '\t' | cut -f 4) ; 
	strand=$(echo $line | tr ' ' '\t' | cut -f 5) ; 
	full_sneakthrough_ILS=$(echo $line | tr ' ' '\t' | cut -f 6) ; 
	full_sneakthrough_accum=$(echo $line | tr ' ' '\t' | cut -f 7) ; 
	full_sneakthrough_other=$(echo $line | tr ' ' '\t' | cut -f 8) ; 
	blast_ghosts=$(echo $line | tr ' ' '\t' | cut -f 9) ; 
	fragmentary_in_pan145=$(echo $line | tr ' ' '\t' | cut -f 10) ; 
	fragmentary_in_pan146=$(echo $line | tr ' ' '\t' | cut -f 11) ; 
	fragmentary_in_gor142=$(echo $line | tr ' ' '\t' | cut -f 12) ; 
	fragmentary_in_gor143=$(echo $line | tr ' ' '\t' | cut -f 13) ; 
	fragmentary_in_panNHPRTR=$(echo $line | tr ' ' '\t' | cut -f 14) ; 
	fragmentary_in_gorNHPRTR=$(echo $line | tr ' ' '\t' | cut -f 15) ; 

	gene_pk=$(echo "SELECT gene_pk FROM gene WHERE chrom='"$chrom"' AND start=$start AND stop=$stop AND strand='"$strand"';"| mysql --user=csoeder --password=tha_snazzle murple -N)
	echo "UPDATE gene SET full_sneakthrough_ILS = full_sneakthrough_ILS + $full_sneakthrough_ILS, full_sneakthrough_accum = full_sneakthrough_accum + $full_sneakthrough_accum, full_sneakthrough_other = full_sneakthrough_other + $full_sneakthrough_other, blast_ghosts = blast_ghosts + $blast_ghosts WHERE gene_pk=$gene_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N 
	echo "UPDATE gene SET fragmentary_in_pan145=$fragmentary_in_pan145, fragmentary_in_pan146=$fragmentary_in_pan146, fragmentary_in_gor142=$fragmentary_in_gor142, fragmentary_in_gor143=$fragmentary_in_gor143, fragmentary_in_panNHPRTR=$fragmentary_in_panNHPRTR, fragmentary_in_gorNHPRTR=$fragmentary_in_gorNHPRTR WHERE gene_pk=$gene_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N 
#	echo "UPDATE gene SET triage_notes=CONCAT_WS(';', '$(echo "SELECT v3_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )',  '$(echo "SELECT notes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT morenotes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT v4_triage_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT v4_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )' ) WHERE gene_pk=$gene_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N 
#	echo "UPDATE gene SET triage_notes=CONCAT_WS(';', '$(echo "SELECT v3_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )',  '$(echo "SELECT notes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT morenotes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT v4_triage_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )', '$(echo "SELECT v4_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N | tr -d "?" | tr -d "!" )' ) WHERE gene_pk=$gene_pk;" 

	echo "UPDATE gene SET triage_notes=CONCAT_WS(';', '$(echo "SELECT v3_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )',  '$(echo "SELECT notes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT morenotes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT v4_triage_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT v4_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )' ) WHERE gene_pk=$gene_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N 
	echo "UPDATE gene SET triage_notes=CONCAT_WS(';', '$(echo "SELECT v3_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )',  '$(echo "SELECT notes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT morenotes_v3 FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT v4_triage_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )', '$(echo "SELECT v4_igv_notes FROM candidate WHERE precand_pk=$cand_pk;" | mysql --user=csoeder --password=tha_snazzle murple -N )' ) WHERE gene_pk=$gene_pk;" 

	echo "INSERT INTO gene_lookup (orf_id, aln_id, person_id, person_name, gene_id) (SELECT orf_id, aln_id, person_id, person_name, $gene_pk FROM precandidate_lookup WHERE precand_id=$cand_pk);" | mysql --user=csoeder --password=tha_snazzle murple -N 

	echo "INSERT INTO candidate_promotion (cand_id, gene_id) VALUES ($cand_pk, $gene_pk);" | mysql --user=csoeder --password=tha_snazzle murple -N 
done


UPDATE gene SET confirmed_splice=1 WHERE  


###
#	Annotate proteomics:
#	location-based (riboSeq)
#	sequence-based (https://www.proteomicsdb.org/#peptideSearch ; http://sysbio.sysu.edu.cn/rpfdb/index.html ?)

###	
#	do a ncRNA comparison

###	coding potential
##Wang, L., Park, H. J., Dasari, S., Wang, S., Kocher, J. P., & Li, W. (2013). CPAT: Coding-potential assessment tool using an alignment-free logistic regression model. Nucleic Acids Research, 41(6), 1–7. doi:10.1093/nar/gkt006

CPAT_DIR="/Users/csoeder/Downloads/CPAT-1.2.1"


echo "SELECT '>', trans_pk, sequence FROM transcript;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print $1$2"\n"$3}' > transcripts.fa
cpat.py -g transcripts.fa -d $CPAT_DIR/dat/Human_train.RData -x $CPAT_DIR/dat/Human_Hexamer.tab -o transcripts.cpat.out
tail -n +2 transcripts.cpat.out > "transcripts.cpat.tmp" && mv "transcripts.cpat.tmp" "transcripts.cpat.out"
sudo cp transcripts.cpat.out /usr/local/mysql/data/murple/
echo "ALTER TABLE transcript ADD COLUMN mrna_len int;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE transcript ADD COLUMN orf_len int;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE transcript ADD COLUMN fickett_score float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE transcript ADD COLUMN hexamer_score float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE transcript ADD COLUMN coding_prob float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "CREATE TABLE temp ( trans_pk int, mrna_len int, orf_len int, fickett_score float(10), hexamer_score float(10), coding_prob float(10));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'transcripts.cpat.out' INTO TABLE temp (trans_pk, mrna_len, orf_len, fickett_score, hexamer_score, coding_prob) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE transcript s, temp t SET s.mrna_len=t.mrna_len, s.orf_len=t.orf_len, s.fickett_score=t.fickett_score, s.hexamer_score=t.hexamer_score, s.coding_prob=t.coding_prob WHERE s.trans_pk=t.trans_pk ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DROP TABLE temp;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "select '>', auxtrans_pk, sequence from auxiliary_transcript;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print $1$2"\n"$3}' > auxiliary_transcripts.fa
cpat.py -g auxiliary_transcripts.fa -d $CPAT_DIR/dat/Human_train.RData -x $CPAT_DIR/dat/Human_Hexamer.tab -o auxiliary_transcripts.cpat.out
tail -n +2 auxiliary_transcripts.cpat.out > "auxiliary_transcripts.cpat.tmp" && mv "auxiliary_transcripts.cpat.tmp" "auxiliary_transcripts.cpat.out"
sudo cp auxiliary_transcripts.cpat.out /usr/local/mysql/data/murple/
echo "ALTER TABLE auxiliary_transcript ADD COLUMN mrna_len int;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_transcript ADD COLUMN orf_len int;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_transcript ADD COLUMN fickett_score float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_transcript ADD COLUMN hexamer_score float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "ALTER TABLE auxiliary_transcript ADD COLUMN coding_prob float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "CREATE TABLE temp ( trans_pk int, mrna_len int, orf_len int, fickett_score float(10), hexamer_score float(10), coding_prob float(10));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'auxiliary_transcripts.cpat.out' INTO TABLE temp (trans_pk, mrna_len, orf_len, fickett_score, hexamer_score, coding_prob) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE auxiliary_transcript s, temp t SET s.mrna_len=t.mrna_len, s.orf_len=t.orf_len, s.fickett_score=t.fickett_score, s.hexamer_score=t.hexamer_score, s.coding_prob=t.coding_prob WHERE s.auxtrans_pk=t.trans_pk ;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "DROP TABLE temp;" | mysql --user=csoeder --password=tha_snazzle murple -N


#pull gene by pk
#peakay=1
#echo "select o.person_name, o.old_pk, o.sequence orf, t.person_name, t.old_pk, t.sequence transcript from gene_lookup l, orf o, transcript t where l.orf_id=o.old_pk and l.person_name=o.person_name and t.comp_name=o.trans and t.person_name=o.person_name and gene_id=$peakay;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print ">orf_"$1"_"$2"\n"$3"\n>trans_"$4"_"$5"\n"$6}'  
#limit to three
	echo "select o.person_name, o.old_pk, o.sequence orf, t.person_name, t.old_pk, t.sequence transcript from gene_lookup l, orf o, transcript t where l.orf_id=o.old_pk and l.person_name=o.person_name and t.comp_name=o.trans and t.person_name=o.person_name and gene_id=$peakay limit 3;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print ">orf_"$1"_"$2"\n"$3"\n>trans_"$4"_"$5"\n"$6}'  






# candidate info: splicing data, lowcov warning
# 


###
#Mouse transcriptome:
#Pervouchine, D. D., Djebali, S., Breschi, A., Davis, C. A., Barja, P. P., Dobin, A., … Gingeras, T. R. (2015). Enhanced transcriptome maps from multiple mouse tissues reveal evolutionary constraint in gene expression. Nature Communications, 6, 5903. doi:10.1038/ncomms6903
#Supp. info table 1




######	GWIPS
# http://gwips.ucc.ie/ : data/riboSeq.bed
#wget http://hgdownload.cse.ucsc.edu/gbdb/hg19/bbi/gwipsvizRiboseq.bw
#grep -v "#" gwipsvizRiboseq.wig > gwipsvizRiboseq.UCSC.wig
echo "ALTER TABLE candidate ADD COLUMN gwips float(10);" | mysql --user=csoeder --password=tha_snazzle murple -N
#bedtools map -a candidates.sort.bed -b data/gwipsvizRiboseq.UCSC.wig -o sum -c 4 | awk '{print $4,$6/($3-$2)}' | tr ' ' '\t' > length_weighted_GWIPS.dat
bedtools map -a candidates.v4.unFiltered.sorted.bed -b data/gwipsvizRiboseq.UCSC.wig -o sum -c 4 | awk '{print "UPDATE candidate SET gwips="$5/($3-$2)" WHERE precand_pk="$4";"}' > gwips.upload.sql
cat gwips.upload.sql | mysql --user=csoeder --password=tha_snazzle murple -N



######	SORFS
#	upcoming SORFS update
# http://sorfs.org/ : data/sorfs.bed
# grep NA results.txt | awk '{if($3==-1)print "chr"$2,$4,$5,$1,"-"}' |  tr ' ' '\t' | grep -v Stra > sorfs_unspliced.bed
# grep NA results.txt | awk '{if($3==1)print "chr"$2,$4,$5,$1,"+"}' |  tr ' ' '\t' | grep -v Stra >> sorfs_unspliced.bed
# grep -v NA results.txt | grep -v Stra |tr '_' ',' | awk '{if($3==-1)print "chr"$2,$4,$5,$1,"-",$4,$5,"0,0,0",$7,$6}' | tr ' ' '\t' > sorfs.spliced.prebed 
# grep -v NA results.txt | grep -v Stra |tr '_' ',' | awk '{if($3==1)print "chr"$2,$4,$5,$1,"+",$4,$5,"0,0,0",$6,$7}' | tr ' ' '\t' >> sorfs.spliced.prebed 
# python ../Research/Human_deNovo/sorf_to_bed12.py > sorfs.spliced.bed 

echo "ALTER TABLE candidate ADD COLUMN sorf_strong boolean;" | mysql --user=csoeder --password=tha_snazzle murple -N
for precand_pk in $(bedtools intersect -wa -wb -a candidates.bed -b data/sorfs_unspliced.bed | awk '{if($5==$10)print;}' | tr ' ' '\t' | cut -f 4 | sort | uniq); do
	echo "UPDATE candidate SET sorf_strong=1 WHERE precand_pk = $precand_pk;" >> sorfs_upload.sql ;
done
cat sorfs_upload.sql | mysql --user=csoeder --password=tha_snazzle glurge -N











##	Annotate absent_from_TRACE
#	(web utility, copy-paste from spreadsheet...)
echo "ALTER TABLE orf ADD COLUMN unseen_in_pan_trace boolean default 0;" | mysql --user=csoeder --password=tha_snazzle murple -N 	#	the default assumption is that you don't need to look at trace
cat absent_from_panTrace.dat | cut -f 1,3 |  awk '{ print "UPDATE orf SET unseen_in_pan_trace='\''"$2"'\'' WHERE orf.orf_pk="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N 	#given that you're looking in trace, assume you can't find
cat absent_from_panTrace.dat | grep NO | cut -f 1,4 | tr -d N | tr "O" "0" | awk '{ print "UPDATE orf SET unseen_in_pan_trace='\''"$2"'\'' WHERE orf.orf_pk="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N 	#	mark all the ones that were found in race
echo "ALTER TABLE orf ADD COLUMN unseen_in_gor_trace boolean default 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
cat absent_from_gorTrace.dat | cut -f 1,3 |  awk '{ print "UPDATE orf SET unseen_in_gor_trace='\''"$2"'\'' WHERE orf.orf_pk="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N 	#given that you're looking in trace, assume you can't find
cat absent_from_gorTrace.dat | grep NO | cut -f 1,4 | tr -d N | tr "O" "0" | awk '{ print "UPDATE orf SET unseen_in_gor_trace='\''"$2"'\'' WHERE orf.orf_pk="$1";" }' | mysql --user=csoeder --password=tha_snazzle murple -N 	#	mark all the ones that were found in race




###	Detonate
for folder in $(ls) ; do cd $folder; bsub -q week ~/modules/detonate/rsem-eval/rsem-eval-calculate-score --keep-intermediate-files --paired-end *1.fastq *2.fastq Trinity_files.Trinity.fasta "$folder"_detonate 75 ; cd ..; done
echo "ALTER TABLE transcript ADD COLUMN detonate_fpkm float;"| mysql --user=csoeder --password=tha_snazzle murple -N 
echo "select person_name, comp_name from transcript;" | mysql --user=csoeder --password=tha_snazzle murple -N | sed -e 's/revComp_//' | awk '{print "grep -w "$2" individuals/"$1"/"$1"_detonate.genes.results | sed -e 's/^/'"$1"~'/' >> detonate_meta.dat"}' > detonate_collector.sh


###Direct riboseq evaluation




