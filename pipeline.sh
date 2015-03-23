#!/bin/sh
#	Takes a single argumement, the folder to be processed. It expects this folder to contain
#	the paired-end reads (ERR*_1/2.fastq) and in this version, the Trinity transcripts assembled in 
#	v1
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
#############################################
#	Load config								#
source $SCRIPT_DIR/pipeline_config.sh		#
#############################################
FOLDER=$1

#############################################################
#Enter the folder containing the files to be processed.		#
mkdir -p $FOLDER ################################################
cd $FOLDER 	#####################################################
###	Cleanup any prior runs					#
rm *.lsf.out
rm *.sai
rm *_aligned.sam
rm *_Assembl*
rm -rf mapt
rm -rf mapsplice_out
rm -rf unmapt
rm *.log
rm *.txt
rm RNASeq_vs_Trinity*
rm Trinity_files.Trinity.fasta.*
#############################################################
touch ticktock.log 		#log files 							#
touch monitor.log											#
echo "de novo search begin: subject $FOLDER" >> monitor.log
date >> monitor.log
echo "git commit #" >> monitor.log				#
head $SCRIPT_DIR/.git/FETCH_HEAD | cut -f1 >> monitor.log #
head $SCRIPT_DIR/.git/FETCH_HEAD | cut -f3 >> monitor.log 
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
module load bowtie
echo "$(date)	META:		modules loaded"	>> monitor.log
#############################################
{	#	Try to pull the already-processed reads, if they exist...
	cp /proj/cdjones_lab/csoeder/1kGen_Processed/"$FOLDER"_archived.gz . ;
	tar xf "$FOLDER"_archived.gz ;
	mv "$FOLDER"_archived/* . ;
} || { cp /proj/cdjones_lab/csoeder/1kGen_RNASeq/"$FOLDER"/* . ;
	gzip -d *.gz
	echo "RNA-Seq reads:	" >> monitor.log	#	Note the lack of Trinity assembly frontload
	du ERR* >> monitor.log								#
} #	If the processed files don't exist, pull the raw reads to create them! 
#############################################################
sh $SCRIPT_DIR/the_mapsplicer.sh $FOLDER 	#	Run the MapSplice script	#
echo "$(date)	MAPSPLICE:		the_mapsplicer submitted to run" >> monitor.log
sleep 30					#	Chill out for a bit, then submit the post-mapsplice script
bsub -J brief_intermission_$FOLDER -w "done(alert_$FOLDER)" -o intermission.lsf.out sh $SCRIPT_DIR/post_mapsplice.sh $FOLDER
echo "$(date)	POSTSPLUT:		post_mapsplice queued" >> monitor.log
#############################################################