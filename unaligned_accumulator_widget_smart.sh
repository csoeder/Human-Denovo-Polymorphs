#!/bin/sh

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is BEDfile of mapspliced reads
#	$2 is BAMfile of mapspliced reads
#	$3 is FASTA of trinity assemblies
#	$4 is the name of the assembly being crunched



date1=$(date +"%s")
bedtools bamtobed -bed12 -i preseed.bam | cut -f 4 - > preseed.list
#this gives a list of QNAMES for the RNA-Seq reads. Now pull the mapsplice 
	#alignments for each read..
grep -wFf preseed.list ../../$1 > seed.bed

if [ -s seed.bed ];

	then 
		#use them to seed the accumulator
		sh $SCRIPT_DIR/Accumulator2_smart.sh seed.bed $2;
		if [[ ! -s overlap.bed ]]; then
		        samtools faidx ../../$3 $4 >> ../clean_assemblies.fa
        		flag="PASS";
		else
		        samtools faidx ../../$3 $4 >> ../rejects.fa
        		flag="FAIL";
		fi

	else

		flag="MT";
fi
 
#use them to seed the accumulator
#sh $SCRIPT_DIR/Accumulator2_smart.sh seed.bed $2

#if there has been no overlap detected between the Accumulation and annotations, add to list
#if [[ ! -s overlap.bed ]]; then
#	samtools faidx ../../$3 $4 >> ../clean_assemblies.fa
#	flag="PASS"
#else
#	samtools faidx ../../$3 $4 >> ../rejects.fa
#	flag="FAIL"
#fi
date2=$(date +"%s")
cd ..
#rm -rf $4
diff=$(($date2-$date1))
echo "$4   $(($diff / 60))m   $(($diff % 60))s   $flag" >> tick.tock
flag="DERP"
