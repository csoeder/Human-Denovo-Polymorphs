#!/bin/sh
#Takes a single argument, the folder to be processed, which is expected to have a Trinity file to be processed.
#Trinity assemblies have come from a previous version of the script - see commented out Assembly section.

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load bedtools 						#
#############################################

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'
#	$1 = input BED file
#	$2 = output BED file
#####################################################################################################################################################################
###More filtration: remove overlap with annotated genomic locations																									#
##################################################################################																					#
###		Remove annotated human genes 											#																					#
###			-	UCSC Genes 														#																					#
bedtools intersect -split -a $1 -b $DATA_DIR/UCSC_genes.bed > no_UCSC.bed	#
bedtools intersect -split -a $1 -b $DATA_DIR/refSeq_genes.bed > no_refSeq.bed	#
cat no_UCSC.bed no_refSeq.bed > no_genes.bed
if [[ -s no_genes.bed ]]; then
	mv no_genes.bed $2
#	echo "GENE FOUND"
	exit
fi
#################################################################################																					#
###		Remove repetitive elements												#																					#
###			-	UCSC Repeat Masker												#																					#
#bedtools intersect -split -a $1 -b $DATA_DIR/repeatmasker.bed > no_rpts.bed								#
#if [[ -s no_rpts.bed ]]; then
#	mv no_rpts.bed $2
#	echo "ITS REPETITIVE"
#	exit
#fi
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
bedtools intersect -a $1 -b $DATA_DIR/retroposed1.bed > no_rpts_no_est_no_mRNA_no_retro1.bed
###			-	UCSC retroExpressed5											#																					#
bedtools intersect -a $1 -b $DATA_DIR/retroposed2.bed > no_rpts_no_est_no_mRNA_no_retro2.bed
###			-	UCSC retroInfo5													#																					#
bedtools intersect -a $1 -b $DATA_DIR/retroposed3.bed > no_rpts_no_est_no_mRNA_no_retro3.bed
###		Remove pseudogenes too													#																					#
###			-	UCSC YalePseudo60												#																					#
bedtools intersect -a $1 -b $DATA_DIR/yalepseudo.bed > no_rpts_no_est_no_mRNA_no_retro_no_pseudo.bed
cat no_rpts_no_est_no_mRNA_no_retro* > no_retros.bed
if [[ -s no_retros.bed ]]; then
	mv no_retros.bed $2
#	echo "HOW RETRO"
	exit
fi
#################################################################################																					#
touch $2	#																									
#################################################################																									#
####################################################################################################################################################################
