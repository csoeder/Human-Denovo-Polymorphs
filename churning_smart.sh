#!/bin/sh

###		A script which recursively accumulates RNA-Seq reads and checks 
###		if the accumulate overlaps an annotation.
#	$1 is the BAM file of mapspliced reads

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')mapt
SERIAL=$( echo $(pwd | awk -F"mapt" '{print $2}') | tr -d '/' )
OLDTIME=$(date +"%s")

mv new.bed old.bed #	bedfilter the initial .BED
sh $SCRIPT_DIR/bedfilter_detect_accumulate.sh old.bed overlap.bed

NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
echo -e ""$SERIAL"\tinitcheck\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log

if [[ -s overlap.bed ]]; then
	exit			#	If the initial .BED overlaps, you're done
else				#	Otherwise...
	bedtools flank -i old.bed -g $DATA_DIR/chromInfo.txt -b 75 > flanks.bed #	Extend existing reads
	NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
	echo -e ""$SERIAL"\tflank\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log
	bedtools sort -i flanks.bed > flanks_sorted.bed 						# 	Sort the extensions
	NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
	echo -e ""$SERIAL"\tsort\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log
	bedtools merge -i flanks_sorted.bed > merged_flanks.bed 				#	Merge them
	NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
	echo -e ""$SERIAL"\tmerge\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log
	bedtools intersect -split -bed -wa -abam $( pwd | awk -F "mapt" '{print $1}')$1 -b merged_flanks.bed > new_reads.bed #	Pull any reads that overlap the extension
	NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
	echo -e ""$SERIAL"\tintersect\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log
	cat old.bed new_reads.bed | sort -k1,1 -k2,2n -k3,3n -k4,4 -u - > new.bed #	Assimilate
	NEWTIME=$(date +"%s"); diff=$(($NEWTIME-$OLDTIME)); OLDTIME=NEWTIME
	echo -e ""$SERIAL"\tassimilate\t""$(($diff / 60))"m"$(($diff % 60))"s"\n" >> $HOMEBASE/accumulator_timelord.log
	cmp --silent old.bed new.bed || sh $SCRIPT_DIR/churning_smart.sh $1 	#	churn this new accumulation!
fi

