#!/bin/sh

###		A script which recursively accumulates RNA-Seq reads and checks 
###		if the accumulate overlaps an annotation.
#	$1 is the BAM file of mapspliced reads
mapspliced=$1

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')mapt
SERIAL=$( echo $(pwd | awk -F"mapt" '{print $2}') | tr -d '/' )
LOOP_NUM=0


echo "Initial check	:	$SERIAL"
sh $SCRIPT_DIR/bedfilter_detect_accumulate.sh new.bed overlap.bed

churn_it () { 
	let LOOP_NUM+=1;
	echo "Loop number $LOOP_NUM"
	sh $SCRIPT_DIR/bedfilter_detect_accumulate.sh new.bed overlap.bed
	if [[ -s overlap.bed ]]; then
		exit			#	If the initial .BED overlaps, you're done
	else				#	Otherwise...
		mv new.bed old.bed #	move.it
		echo "flank"
		bedtools flank -i old.bed -g $DATA_DIR/chromInfo.txt -b 75 > flanks.bed #	Extend existing reads
		echo "sort"
		bedtools sort -i flanks.bed > flanks_sorted.bed 						# 	Sort the extensions
		echo "merge"
		bedtools merge -i flanks_sorted.bed > merged_flanks.bed 				#	Merge them
		echo intersect
		region=''
		while read line; do region="$region $(echo $line |cut -f 1 -d ' '):$(echo $line | cut -f 2 -d ' ')-$(echo $line | cut -f 3 -d ' ')" ; done < merged_flanks.bed
		samtools view -bh $( pwd | awk -F "mapt" '{print $1}')$mapspliced $region | bedtools bamtobed -bed12 -i - | bedtools intersect -split -wa -a - -b merged_flanks.bed > new_reads.bed
		#time bedtools intersect -split -bed -wa -abam $( pwd | awk -F "mapt" '{print $1}')$1 -b merged_flanks.bed > new_reads.bed #	Pull any reads that overlap the extension
		echo "assimilate"
		cat old.bed new_reads.bed | sort -k1,1 -k2,2n -k3,3n -k4,4 -u - > new.bed #	Assimilate
		cmp --silent old.bed new.bed || churn_it;	#	churn this new accumulation!
	fi
} 

time churn_it