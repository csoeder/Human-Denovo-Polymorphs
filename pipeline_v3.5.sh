#!/bin/sh
#	Takes a single argumement, the folder to be processed. It expects this folder to contain
#	the paired-end reads (ERR*_1/2.fastq) and in this version, the Trinity transcripts assembled in 
#	v1

#############################################################
#Enter the folder containing the files to be processed.		#
cd $1
touch ticktock.log 		#log files 							#
touch monitor.log											#
echo "de novo search begin: subject $1" >> monitor.log
date >> monitor.log
echo "RNA-Seq reads:	" >> monitor.log	#	Note the lack of Trinity assembly frontload
du ERR* >> monitor.log
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
echo "$(date)	META:		modules loaded"	>> monitor.log
#############################################
#############################################################
sh ../the_mapsplicer.sh $1 	#	Run the MapSplice script	#
echo "$(date)	MAPSPLICE:		the_mapsplicer submitted to run" >> monitor.log
sleep 30					#	Chill out for a bit, then submit the post-mapsplice script
bsub -J brief_intermission_$1 -w "done(alert_$1)" -o intermission.lsf.out sh ../post_mapsplice.sh $1 
echo "$(date)	POSTSPLUT:		post_mapsplice queued" >> monitor.log
#############################################################
