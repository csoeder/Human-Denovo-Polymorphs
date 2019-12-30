#!/bin/sh
#Takes a single argument, the folder to be processed, which is expected to have a Trinity file to be processed.
#Trinity assemblies have come from a previous version of the script - see commented out Assembly section.

#############################################
#Load relevant modules 						#
#. /nas02/apps/Modules/default/init/bash		#
#module load python/2.7.1 					#
#module load bedtools 						#
#module load samtools 						#
#module load blast 							#
#module load blat 							#
#module load bedops 							#
#module load bowtie 							#
#module load bwa 							#
#############################################

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

mv new.bed old.bed
touch new.bed


#	$1 is BAM file of aligned RNA-Seq reads
#	$2 is BED file of splice junctions

#wc -l bedfilter_detect.sh
#sh $SCRIPT_DIR/bedfilter_detect.sh old.bed overlap.bed

bedtools flank -i old.bed -g $DATA_DIR/chromInfo.txt -b 75 > flanks.bed
bedtools sort -i flanks.bed > flanks_sorted.bed
bedtools merge -i flanks_sorted.bed > merged_flanks.bed
bedtools intersect -split -bed -wa -abam ../../$1 -b merged_flanks.bed > new_reads.bed
cat old.bed new_reads.bed | sort -k1,1 -k2,2n -k3,3n -k4,4 -u -	> new.bed

cmp --silent old.bed new.bed || sh $SCRIPT_DIR/churning_collect.sh $1









