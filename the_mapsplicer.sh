#!/bin/sh
###	A script to automate the MapSplicing and post-mapsplice processing
#############################################################
DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'
#############################################################
###Mapsplice the reads######################################
if [ ! -f $1_mapsplice_alignment.sam ]; then
	bsub -J mapsplut_$1 -o mapsplut.lsf.out -M 75 -q week python /nas02/apps/mapsplice-2.1.4/src/MapSplice-v2.1.4/mapsplice.py -c /netscr/csoeder/1kGen/data/hg19_split/ -x /netscr/csoeder/1kGen/data/hg19_bowtieindex/hg19 -1 ERR*_1.fastq -2 ERR*_2.fastq 
	bsub -J mvsplut_$1 -w "done(mapsplut_$1)" -o mvsplut.lsf.out  mv mapsplice_out/alignments.sam $1_mapsplice_alignment.sam
	bsub -J splutvert_$1 -w "done(mvsplut_$1)" -o splutvert.lsf.out "samtools view -Sbh $1_mapsplice_alignment.sam > $1_mapsplice_alignment.bam"
	bsub -J bamsort_$1 -w "done(splutvert_$1)" -o bamsort.lsf.out samtools sort $1_mapsplice_alignment.bam $1_mapsplice_alignment.sort 
	bsub -J splutDex_$1 -w "done(bamsort_$1)" -o splutDex.lsf.out samtools index $1_mapsplice_alignment.sort.bam
	bsub -J bam2bed_$1 -w "done(bamsort_$1)" -o bam2bed.lsf.out "bedtools bamtobed -bed12 -i $1_mapsplice_alignment.sort.bam > $1_mapsplice_alignment.bed"
	echo "$(date)	MAPSPLICER:		MapSplice jobs submitted"	>> monitor.log
else
	bsub -J splutDex_$1 -o splutDex.lsf.out echo "trivial"
	bsub -J bam2bed_$1 -o bam2bed.lsf.out echo "trivial"
fi
#########################################
###Assemble the reads####################
if [ ! -f Trinity_files.Trinity.fasta ]; then
	mkdir Trinity_files					#
	bsub -J Trinity_$1 -x -q week -o Trinity_$1.lsf.out -M 75 '/nas02/home/k/e/keklund/bin/perl /nas02/home/k/e/keklund/bin/trinityrnaseq_r2013-02-25/Trinity.pl --CPU 6 --JM 50G --seqType fq --inchworm_cpu 6 --bflyCPU 6 --left left.fastq --right right.fastq --output Trinity_files --full_cleanup'
else									#
	bsub -J Trinity_$1 -q week -o Trinity_$1.lsf.out echo "trivial"
fi 										#
#echo Trinity end, RNA-seq reads have been assembled. Hello Trinity.fa >> monitor.txt
#date >> monitor.txt					#
#echo >> monitor.txt					#
#										#
#										#
#date >> ticktock.txt					#
#du -sk Trinity_files.Trinity.fasta >> ticktock.txt
#echo >> ticktock.txt					#
#########################################
touch a.fastq
bsub -J alert_$1 -w "done(bam2bed_$1) && done(splutDex_$1) && done(Trinity_$1)" -o heavylifting.lsf.out rm *.fastq
#############################################################
