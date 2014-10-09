#!/bin/sh
#	Takes a single argumement, the folder to be processed. It expects this folder to contain
#	the paired-end reads (ERR*_1/2.fastq) and in this version, the Trinity transcripts assembled in 
#	v1

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load python/2.7.1 					#
module load bedtools 						#
module load samtools 						#
module load blast 							#
module load blat 							#
module load bowtie2 						#
module load bwa 							#
#############################################


#############################################################
#Enter the folder containing the files to be processed.		#
cd $1
touch ticktock.txt 		#log files 							#
touch monitor.txt											#
#############################################################

sh ../the_mapsplicer.sh $1
while [ `bjobs -w | grep -c alert_$1` -gt 0 ]
		do sleep 3600;
	done
sh ../post_mapsplice.sh $1 
