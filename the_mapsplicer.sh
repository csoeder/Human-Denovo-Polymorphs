#!/bin/sh


DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'


#############################################################
#Enter the folder containing the files to be processed.		#
cd $1
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
bsub -J alert_$1 -w "done(bam2bed_$1)" echo $1 has successfully mapsplutted
