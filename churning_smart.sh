#!/bin/sh

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the BAM file of mapspliced reads

mv new.bed old.bed
echo OLD.BED CONTAINS:
head old.bed

sh $SCRIPT_DIR/bedfilter_detect.sh old.bed overlap.bed

if [[ -s overlap.bed ]]; then
	echo OVERLAP FOUND
	#ls
	exit
else
	bedtools flank -i old.bed -g $DATA_DIR/chromInfo.txt -b 75 > flanks.bed
	bedtools sort -i flanks.bed > flanks_sorted.bed
	bedtools merge -i flanks_sorted.bed > merged_flanks.bed
	bedtools intersect -split -bed -wa -abam ../../$1 -b merged_flanks.bed > new_reads.bed
	cat old.bed new_reads.bed | sort -k1,1 -k2,2n -k3,3n -k4,4 -u - > new.bed

	cmp --silent old.bed new.bed || sh $SCRIPT_DIR/churning_smart.sh $1
fi

echo DONE
