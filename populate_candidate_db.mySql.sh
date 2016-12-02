
bedtools intersect -wa -wb -a candidates_v3.sorted.bed -b candidates_v4.sorted.bed | awk 'BEGIN{OFS="\t"}{if($2==$7)print}' | awk 'BEGIN{OFS="\t"}{if($3==$8)print}' | awk 'BEGIN{OFS="\t"}{if($4!=$9)print}' | cut -f 4,9 > v3_v4.dischord.list
echo "ALTER TABLE candidate ADD COLUMN v3_pk int;"| mysql --user=csoeder --password=tha_snazzle murple -N
cat v3_v4.dischord.list | awk '{print "UPDATE candidate SET v3_pk ="$1" WHERE precand_pk="$2";"}' | mysql --user=csoeder --password=tha_snazzle murple -N



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


echo "SELECT chrom, start, stop, precand_pk FROM candidate;" | mysql --user=csoeder --password=tha_snazzle murple -N > candidates.v4.unFiltered.bed



###########
## Relevent variants
#	ALL THIS HAPPENS ON KILLDEVIL ATM:
cat candidates.v4.unFiltered.bed | cut -f 2 -d 'r' > candidates.v4.unFiltered.vcfReady.bed
for i in {1..22}; do 
	bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chr"$i".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --bed candidates.v4.unFiltered.vcfReady.bed --recode --stdout | bgzip > miniVCF_"$i".vcf.gz" ; 
done
bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz --bed candidates.v4.unFiltered.vcfReady.bed --recode --stdout | bgzip > miniVCF_X.vcf.gz"
bsub "vcftools --gzvcf /proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1kGen_variation/ALL.chrY.phase3_integrated_v1a.20130502.genotypes.vcf.gz --bed candidates.v4.unFiltered.vcfReady.bed --recode --stdout | bgzip > miniVCF_Y.vcf.gz"

# ### WAIT UNTIL THAT CHILLS OUT; tabix everything

# merge the VCFs??

vcf-concat -p  miniVCF_*.gz > merged.vcf

# bgzip merged.vcf
# tabix merged.vcf.gz
python VCF_to_SQLuploadPrepper.py merged.vcf merged # 	---> merged_variant.dat, merged_variantLookup.dat
sudo cp merged_variant.dat /usr/local/mysql/data/murple/
sudo cp merged_variantLookup.dat /usr/local/mysql/data/murple/
echo "CREATE TABLE variant ( variant_pk int PRIMARY KEY, chrom varchar(20), pos bigint, ref_allele text, alt_alleles text, heterozygosity float(10), pi_hat float(10), snpDBid text, varType text, varSubtype text, meta text );" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'merged_variant.dat' INTO TABLE variant (variant_pk, chrom, pos, ref_allele, alt_alleles, heterozygosity, varType, varSubtype, pi_hat, snpDBid) ;" | mysql --user=csoeder --password=tha_snazzle murple -N
#		variant_sql.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"%tuple([variant_pk,"chr%s"%rec.CHROM, rec.POS, rec.REF, alts, hetZyggy(rec), rec.var_type, rec.var_subtype, piHat(rec), rec.ID]))
echo "CREATE TABLE variant_lookup (varlookup_pk int PRIMARY KEY AUTO_INCREMENT, variant_id int, person_name varchar(20), genotype varchar(5));" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'merged_variantLookup.dat' INTO TABLE variant_lookup (variant_id, person_name, genotype) ;" | mysql --user=csoeder --password=tha_snazzle murple -N

echo "ALTER TABLE candidate ADD COLUMN poly boolean DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "UPDATE candidate c, variant v SET c.poly = 1 WHERE c.chrom=v.chrom AND c.start <= v.pos AND c.stop >= v.pos;" | mysql --user=csoeder --password=tha_snazzle murple -N



##coverage find & antifind

#/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -a <annotation_file> -o <output_file> input_file1 [input_file2] 

####5column bed to 5 column SAF#
#cat candidates.bed | awk '{print $4,$1,$2,$3,$5}' | tr ' ' '\t' > candidates.SAF
#/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -F SAF  -a candidates.SAF -o expression_stats.dat individuals/*/*_mapsplice_alignment.sort.bam
#tail -n +2 expression_stats.dat > expression_stats.nohead.dat
python featureCounts_to_SQLuploadPrepper.py expression_stats.dat expression_stats.dat.summary expression_stats 
cut -f 3 expression_stats.absoluteExpression.dat | paste expression_stats.relativeExpression.dat - > expression_stats.uploadReady.dat 
sudo cp expression_stats.uploadReady.dat /usr/local/mysql/data/murple/
echo "CREATE TABLE expression (express_pk int PRIMARY KEY AUTO_INCREMENT, person_name varchar(20), candidate_id int, FPKM float(10), abs_frag_number float(10) );" | mysql --user=csoeder --password=tha_snazzle murple -N
echo "LOAD DATA INFILE 'expression_stats.uploadReady.dat' INTO TABLE expression (person_name, candidate_id, FPKM, abs_frag_number) ;" | mysql --user=csoeder --password=tha_snazzle murple -N





## chimp/gor regions mapped to
# 



###
#	Annotate proteomics:
#	location-based (riboSeq)
#	sequence-based (https://www.proteomicsdb.org/#peptideSearch ; http://sysbio.sysu.edu.cn/rpfdb/index.html ?)

###	
#	do a ncRNA comparison

###	coding potential
##Wang, L., Park, H. J., Dasari, S., Wang, S., Kocher, J. P., & Li, W. (2013). CPAT: Coding-potential assessment tool using an alignment-free logistic regression model. Nucleic Acids Research, 41(6), 1–7. doi:10.1093/nar/gkt006

CPAT_DIR="/Users/csoeder/Downloads/CPAT-1.2.1"


echo "select '>', trans_pk, sequence from transcript;" | mysql --user=csoeder --password=tha_snazzle murple -N | awk '{print $1$2"\n"$3}' > transcripts.fa
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



# candidate info: splicing data, lowcov warning
# 


###
#Mouse transcriptome:
#Pervouchine, D. D., Djebali, S., Breschi, A., Davis, C. A., Barja, P. P., Dobin, A., … Gingeras, T. R. (2015). Enhanced transcriptome maps from multiple mouse tissues reveal evolutionary constraint in gene expression. Nature Communications, 6, 5903. doi:10.1038/ncomms6903
#Supp. info table 1




