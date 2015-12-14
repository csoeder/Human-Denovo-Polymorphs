#!/bin/sh
pswd=$1


#		DATABASE BLACKLIST -  Mask any known imposters
#sh database_blacklist.sh	# <-------	Appears functional!


#############################################
###	Build the database
python database_constructor.py $pswd
python database_uploader.py $pswd

#		collect first-order consolidated information from database
#		store it as BED files, FASTAs, etc
#python database_pullBioinfo.py



#		DATABASE LOOKBACK
#python database_lookback.py

cat /nas02/home/c/s/csoeder/Denovo_Candidates/*/mapt/unseen_in_pan_and_gor.bed | cut -f 1,2,3 | sort | uniq > unseen.bed


psql -h bioapps.its.unc.edu -d denovogenes -U gene -c "SELECT chrom, start, stop, location_pk, 10, strand FROM location where location.lookback_clean=true;" | tr -d ' ' | tr '|' '\t' | grep -v location_pk | grep -v rows | grep -v "+" > genome_locations.lookbackClean.bed #	dummy score included for BED fromatting
bedtools getfasta -fi data/hg19.fa -bed genome_locations.lookbackClean.bed -fo genome_sequences.lookbackClean.fa -name -s

bsub blat -noHead data/gorilla/gorGor3.fa genome_sequences.lookbackClean.fa gorillaCheck.psl
bsub python query-process/ORFome_puzzler.py gorillaCheck.psl data/gorilla/gorGor3.fa GORILLA
uniq GORILLA.coding > GORILLA.coding.uniq
uniq GORILLA.noncoding > GORILLA.noncoding.uniq
comm -23 GORILLA.noncoding.uniq GORILLA.coding.uniq > GORILLA.nevercoding


bsub blat -noHead data/chimp/panTro4.fa genome_sequences.lookbackClean.fa chimpCheck.psl
bsub python query-process/ORFome_puzzler.py chimpCheck.psl data/chimp/panTro4.fa CHIMP
uniq CHIMP.coding > CHIMP.coding.uniq
uniq CHIMP.noncoding > CHIMP.noncoding.uniq
comm -23 CHIMP.noncoding.uniq CHIMP.coding.uniq > CHIMP.nevercoding


python query-process/database_uploadCompPrimReview.py $pswd

x=+-
psql -h bioapps.its.unc.edu -d denovogenes -U gene -c "SELECT chrom, start, stop, location_pk, 10, strand FROM location where lookback_clean is True and pan_noncoding is True and gor_noncoding is True;" | tr -d ' ' | tr '|' '\t' | grep -v location_pk | grep -v rows | grep -v "$x" > genome_locations.lookbackClean.compPrim_scrubbed.bed 
bedtools getfasta -fi data/hg19.fa -bed genome_locations.lookbackClean.compPrim_scrubbed.bed -fo genome_sequences.lookbackClean.compPrim_scrubbed.fa -name -s

## collect the subsetted VCF files
cat genome_locations.lookbackClean.compPrim_scrubbed.bed | cut -f 2 -d 'r' > genome_locations.vcfReady.bed
for i in {1..22}; do bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr"$i".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_"$i".vcf.gz" ; done
bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_X.vcf.gz"
bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrY.phase3_integrated_v1a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_Y.vcf.gz"

### WAIT UNTIL THAT CHILLS OUT; tabix everything
###	Do it for X and Y too

tabix *.vcf.gz
for i in {1..22}; do tabix miniVCF_"$i".vcf.gz ; done
tabix miniVCF_X.vcf.gz 
tabix miniVCF_Y.vcf.gz 
for i in {1..22}; do python query-process/database_vcf_upload.py $pswd miniVCF_"$i".vcf.gz ; done

psql -h bioapps.its.unc.edu -d denovogenes -U gene -c "SELECT chrom, start, stop, location_pk, 10, strand FROM location where lookback_clean is True and pan_noncoding is True and gor_noncoding is True and poly is True;" | tr -d ' ' | tr '|' '\t' | grep -v location_pk | grep -v rows | grep -v "$x" > genome_locations.lookbackClean.compPrim_scrubbed.polymorphicDeNovos.bed
bedtools getfasta -fi data/hg19.fa -bed  genome_locations.lookbackClean.compPrim_scrubbed.polymorphicDeNovos.bed -fo genome_sequences.lookbackClean.compPrim_scrubbed.polymorphicDeNovos.fa -name -s

#		Database antifinder		<----	FUNCTIONAL!
#python database_antifinder.py $pswd	<------- BUT TIME CONSUMING; SUPPRESSED FOR NOW!
#			This is now handled by the coverage uploader


#		Compare to chimp, gorilla transcriptomes
#python database_checkprimates.py 	<<< still needs help?

#		Get coverage data

###	bedtools genomecov -bga -split -ibam individuals/HG00099/HG00099_mapsplice_alignment.sort.bam -g data/hg19.fa.fai > HG99_coverage.bg
###	bedtools intersect -a HG99_coverage.bg -b genome_locations.lookbackClean.compPrim_scrubbed.polymorphicDeNovos.bed > HG99_site_coverage.bg
for folder in $(ls); do bsub -M 33 "bedtools genomecov -bga -split -ibam "$folder"/"$folder"_mapsplice_alignment.sort.bam -g ../data/hg19.fa.fai > "$folder"/"$folder"_coverage.bg"; done

#python database_coverage.py 			???
#python database_coveragecalc.py 		???









#############################################
###	Do some analytics
sh database_metaquery.sh $pswd
#############################################

#		add variation info to DB
#python database_VCFupload.py   #<------FUNCTIONAL! would be good to add a primary key field referencing the location items each variants occur within


