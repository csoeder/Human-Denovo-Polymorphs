#!/bin/sh


DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'


#############################################################

#############################################################
###Mapsplice the reads######################################
bsub -J mapsplut_$1 -o mapsplut.lsf.out -M 75 -q week python /nas02/apps/mapsplice-2.1.4/src/MapSplice-v2.1.4/mapsplice.py -c /netscr/csoeder/1kGen/data/hg19_split/ -x /netscr/csoeder/1kGen/data/hg19_bowtieindex/hg19 -1 ERR*_1.fastq -2 ERR*_2.fastq 
bsub -J mvsplut_$1 -w "done(mapsplut_$1)" -o mvsplut.lsf.out  mv mapsplice_out/alignments.sam $1_mapsplice_alignment.sam
bsub -J splutvert_$1 -w "done(mvsplut_$1)" -o splutvert.lsf.out "samtools view -Sbh $1_mapsplice_alignment.sam > $1_mapsplice_alignment.bam"
bsub -J bamsort_$1 -w "done(splutvert_$1)" -o bamsort.lsf.out samtools sort $1_mapsplice_alignment.bam $1_mapsplice_alignment.sort 
bsub -J splutDex_$1 -w "done(bamsort_$1)" -o splutDex.lsf.out samtools index $1_mapsplice_alignment.sort.bam
bsub -J bam2bed_$1 -w "done(bamsort_$1)" -o bam2bed.lsf.out "bedtools bamtobed -bed12 -i $1_mapsplice_alignment.sort.bam > $1_mapsplice_alignment.bed"
#############################################################

#########################################
###Assemble the reads####################
#this has already been done in v1; otherwise 
#uncomment and add "&& done(Trinity_$1)" to 
#the -w tag on alert_$1 				#
#---------------------------------------#
#mkdir Trinity_files					#
#bsub -J Trinity_$1 -x -K -q week -o Trinity_$1.lsf.out -M 75 '/nas02/home/k/e/keklund/bin/perl /nas02/home/k/e/keklund/bin/trinityrnaseq_r2013-02-25/Trinity.pl --CPU 6 --JM 50G --seqType fq --inchworm_cpu 6 --bflyCPU 6 --left left.fastq --right right.fastq --output Trinity_files --full_cleanup'
#echo TRINITY END >> ticktock.txt		#
#date >> ticktock.txt					#
#echo >> ticktock.txt					#
#										#
#echo Trinity end, RNA-seq reads have been assembled. Hello Trinity.fa >> monitor.txt
#date >> monitor.txt					#
#echo >> monitor.txt					#
#										#
#										#
#date >> ticktock.txt					#
#du -sk Trinity_files.Trinity.fasta >> ticktock.txt
#echo >> ticktock.txt					#
#########################################


bsub -J alert_$1 -w "done(bam2bed_$1) && done(splutDex_$1)" echo $1 has successfully mapsplutted
