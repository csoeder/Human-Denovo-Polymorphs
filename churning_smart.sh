#!/bin/sh

###		A script which recursively accumulates RNA-Seq reads and checks 
###		if the accumulate overlaps an annotation.
#	$1 is the BAM file of mapspliced reads

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

mv new.bed old.bed #	bedfilter the initial .BED
sh $SCRIPT_DIR/bedfilter_detect.sh old.bed overlap.bed

if [[ -s overlap.bed ]]; then
	exit			#	If the initial .BED overlaps, you're done
else				#	Otherwise...
	bedtools flank -i old.bed -g $DATA_DIR/chromInfo.txt -b 75 > flanks.bed #	Extend existing reads
	bedtools sort -i flanks.bed > flanks_sorted.bed 						# 	Sort the extensions
	bedtools merge -i flanks_sorted.bed > merged_flanks.bed 				#	Merge them
	bedtools intersect -split -bed -wa -abam ../../$1 -b merged_flanks.bed > new_reads.bed #	Pull any reads that overlap the extension	
	cat old.bed new_reads.bed | sort -k1,1 -k2,2n -k3,3n -k4,4 -u - > new.bed #	Assimilate

	cmp --silent old.bed new.bed || sh $SCRIPT_DIR/churning_smart.sh $1 	#	churn this new accumulation!
fi

