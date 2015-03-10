#!/bin/sh
#Takes a single argument, the folder to be processed, which is expected to have a Trinity file to be processed.
#Trinity assemblies have come from a previous version of the script - see commented out Assembly section.

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
#	$1 = input BED file, containing the exons to be lookback'd. 
#####################################################################################################################################################################
###More filtration: remove overlap with annotated genomic locations																									#
##################################################################################																					#
###		Remove annotated human genes 											#																					#
###			-	UCSC Genes 														#																					#
bedtools intersect -split -wa -a $1 -b $DATA_DIR/UCSC_genes.bed > no_UCSC.bed.temp	#
bedtools intersect -split -wa -a $1 -b $DATA_DIR/refSeq_genes.bed > no_refSeq.bed.temp	#
cat no_UCSC.bed.temp no_refSeq.bed.temp > no_genes.lookback.bed.temp
if [[ -s no_genes.lookback.bed.temp ]]; then
	echo "GENES FOUND ON LOOKBACK"
fi
#################################################################################																					#
###		Remove repetitive elements												#																					#
###			-	UCSC Repeat Masker												#																					#
bedtools intersect -split -wa -a $1 -b $DATA_DIR/complicated_repeats.bed > no_rpts.lookback.bed.temp					#
if [[ -s no_rpts.lookback.bed.temp ]]; then
	echo "repetitives FOUND ON LOOKBACK"
fi
#################################################################################																					#
###		Current version admits known ESTs.	##########							#																					#
#Complement of ESTs in the sorted bed file 										#																					#
#human ESTs - all_EST at UCSC													#																					#
#echo ESTs removed >> monitor.txt												#																					#
#################################################################################																					#
###		Remove annotated human mRNAs 											#																					#
###			-	UCSC Human mRNA (all_mrna)										#																					#
###		mRNAs are currently being soft-filtered - they pass here.
#bedtools intersect -split -a $1 -b $DATA_DIR/human_mRNA.bed > no_rpts_no_est_no_mRNA.bed
#if [[ -s no_rpts_no_est_no_mRNA.bed ]]; then
#	mv no_rpts_no_est_no_mRNA.bed $2
##	echo "mRNA"
#	exit
#fi
#################################################################################																					#
###		Remove retroelements													#																					#
###			-	UCSC retroAli5													#																					#
bedtools intersect -wa  -a $1 -b $DATA_DIR/retroposed1.bed > no_rpts_no_est_no_mRNA_no_retro1.bed.temp
###			-	UCSC retroExpressed5											#																					#
bedtools intersect -wa -a $1 -b $DATA_DIR/retroposed2.bed > no_rpts_no_est_no_mRNA_no_retro2.bed.temp
###			-	UCSC retroInfo5													#																					#
bedtools intersect -wa -a $1 -b $DATA_DIR/retroposed3.bed > no_rpts_no_est_no_mRNA_no_retro3.bed.temp
###		Remove pseudogenes too													#																					#
###			-	UCSC YalePseudo60												#																					#
bedtools intersect -wa -a $1 -b $DATA_DIR/yalepseudo.bed > no_rpts_no_est_no_mRNA_no_retro_no_pseudo.bed.temp
cat no_rpts_no_est_no_mRNA_no_retro* > no_retro_no_psuedo.lookback.bed.temp
if [[ -s no_retro_no_psuedo.lookback.bed.temp ]]; then
	echo "RETRO/PSEUDO FOUND ON LOOKBACK"
fi
cat *.lookback.bed.temp >> escapees.lookback.bed 
rm *.temp
#################################################################################																					#
#################################################################																									#
####################################################################################################################################################################
