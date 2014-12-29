#!/bin/sh

SAMPLE_SIZE=$1
WINDOW_SIZE=1000

for i in $(seq 1 $SAMPLE_SIZE);	do

	problem=$(head -$((${RANDOM} % `wc -l < lookback_report.dat`+1 )) lookback_report.dat | tail -1);

	location=$(echo $problem | cut -f 1 -d ' ');
	tagged_carriers=$(echo $problem | cut -f 2 -d ' ');
	silent_carriers=$(echo $problem | cut -f 3 -d ' ');

	echo $location;
	chro=$(echo $location | cut -f 1 -d :);
	start=$(echo $location | cut -f 2 -d : | cut -f 1 -d -);
	stop=$(echo $location | cut -f 2 -d : | cut -f 2 -d -);

	new_start=$(($((start-WINDOW_SIZE))>1?$((start-WINDOW_SIZE)):1))	#take the max of the windowed min and 1 to avoid negative coords
	new_stop=$((stop+WINDOW_SIZE))	#	No biggie for stops - samtools/UCSC won't freak
	new_location=$chro:$new_start-$new_stop
	tagged=$(echo $tagged_carriers | cut -f $((${RANDOM} % `echo $tagged_carriers | tr ',' '\n' | wc -l `+1 )) -d ',' );	#choose a random tagged expresser
	silent=$(echo $silent_carriers | cut -f $((${RANDOM} % `echo $silent_carriers | tr ',' '\n' | wc -l `+1 )) -d ',' );	#choose a random silent expresser
	
	samtools view -hb $tagged/$tagged_mapsplice_alignment.sort.bam $new_location | bedtools bamtobed -bed12 -color 0,0,255 -i - >> unpuzzler_tagged.bed;
	samtools view -hb $silent/$silent_mapsplice_alignment.sort.bam $new_location | bedtools bamtobed -bed12 -color 255,0,0 -i - >> unpuzzler_silent.bed;
	done;

