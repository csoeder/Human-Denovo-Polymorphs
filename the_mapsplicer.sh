#!/bin/sh
###	A script to automate the MapSplicing and post-mapsplice processing
#############################################################
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
source $SCRIPT_DIR/pipeline_config.sh	#################################
FOLDER=$1
###Mapsplice the reads#######################################
if [[ ! -f "$FOLDER"_mapsplice_alignment.sam ]]; then
#	bsub -J mapsplut_$FOLDER -o mapsplut.lsf.out -M 75 -q week python /nas02/apps/mapsplice-2.1.4/src/MapSplice-v2.1.4/mapsplice.py -c /netscr/csoeder/1kGen/data/hg19_split/ -x /netscr/csoeder/1kGen/data/hg19_bowtieindex/hg19 -1 ERR*_1.fastq -2 ERR*_2.fastq
	bsub -J mapsplut_$FOLDER -o mapsplut.lsf.out -q week python /nas02/apps/mapsplice-2.1.4/src/MapSplice-v2.1.4/mapsplice.py -c /netscr/csoeder/1kGen/data/hg19_split/ -x /netscr/csoeder/1kGen/data/hg19_bowtieindex/hg19 -1 ERR*_1.fastq -2 ERR*_2.fastq
	bsub -J mvsplut_$FOLDER -w "done(mapsplut_$FOLDER)" -o mvsplut.lsf.out  cp mapsplice_out/alignments.sam "$FOLDER"_mapsplice_alignment.sam
	bsub -J splutvert_$FOLDER -w "done(mvsplut_$FOLDER)" -o splutvert.lsf.out "samtools view -Sbh "$FOLDER"_mapsplice_alignment.sam > "$FOLDER"_mapsplice_alignment.bam"
	bsub -J bamsort_$FOLDER -w "done(splutvert_$FOLDER)" -o bamsort.lsf.out samtools sort "$FOLDER"_mapsplice_alignment.bam "$FOLDER"_mapsplice_alignment.sort
	bsub -J splutDex_$FOLDER -w "done(bamsort_$FOLDER)" -o splutDex.lsf.out samtools index "$FOLDER"_mapsplice_alignment.sort.bam
	bsub -J bam2bed_$FOLDER -w "done(bamsort_$FOLDER)" -o bam2bed.lsf.out "bedtools bamtobed -bed12 -i "$FOLDER"_mapsplice_alignment.sort.bam > "$FOLDER"_mapsplice_alignment.bed"
	echo "$(date)	MAPSPLICER:		MapSplice jobs submitted"	>> monitor.log
else
	bsub -J splutDex_$FOLDER -o splutDex.lsf.out echo "trivial"
	bsub -J bam2bed_$FOLDER -o bam2bed.lsf.out echo "trivial"
fi
#########################################
###Assemble the reads####################
if [ ! -f Trinity_files.Trinity.fasta ]; then
	mkdir Trinity_files					#
	# bsub -J Trinity_$FOLDER -x -q week -o Trinity_$FOLDER.lsf.out -M 75 '/nas02/home/k/e/keklund/bin/perl /nas02/home/k/e/keklund/bin/trinityrnaseq_r2013-02-25/Trinity.pl --CPU 6 --JM 50G --seqType fq --inchworm_cpu 6 --bflyCPU 6 --left ERR*_1.fastq --right ERR*_2.fastq --output Trinity_files --full_cleanup'
	bsub -J Trinity_$FOLDER -x -q week -o Trinity_$FOLDER.lsf.out '/nas02/home/k/e/keklund/bin/perl /nas02/home/k/e/keklund/bin/trinityrnaseq_r2013-02-25/Trinity.pl --CPU 6 --JM 50G --seqType fq --inchworm_cpu 6 --bflyCPU 6 --left ERR*_1.fastq --right ERR*_2.fastq --output Trinity_files --full_cleanup'
else									#
	bsub -J Trinity_$FOLDER -q week -o Trinity_$FOLDER.lsf.out echo "trivial"
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
bsub -J alert_$FOLDER -w "done(bam2bed_$FOLDER) && done(splutDex_$FOLDER) && done(Trinity_$FOLDER)" -o heavylifting.lsf.out rm *.fastq
#############################################################
