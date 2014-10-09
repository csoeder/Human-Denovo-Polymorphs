#!/bin/sh
#Takes a single argument, the folder to be processed, which is expected to have a Trinity file to be processed.
#Trinity assemblies have come from a previous version of the script - see commented out Assembly section.

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load python/2.7.1 					#
module load bedtools 						#
module load samtools 						#
module load blast 							#
module load blat 							#
#module load bedops 							#
module load bowtie2 							#
module load bwa 							#
#############################################

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'



#############################################################
#Enter the folder containing the files to be processed.		#
cd $1 #push													#
touch ticktock.txt #log files 								#
touch monitor.txt											#
#############################################################

############################################################
###index the Trinity fasta #################################
bsub -J bwaInducks_$1 -o bwaInducks.lsf.out bwa index Trinity_files.Trinity.fasta
bsub -J faidx_$1 -w "done(bwaInducks_$1)" -o faidx.lsf.out samtools faidx Trinity_files.Trinity.fasta
############################################################
###Align the Trinity########################################
#bsub -J TrinAlign_$1 -M 50 -w "done(faidx_$1)" -o TrinAlign.lsf.out "bwa mem $DATA_DIR/hg19.fa Trinity_files.Trinity.fasta > $1_aligned.sam"
bsub -J TrinAlign_$1 -M 50 -w "done(faidx_$1)" -o TrinAlign.lsf.out bowtie2 -f -x $DATA_DIR/hg19_bowtieindex/hg19 -U Trinity_files.Trinity.fasta -S $1_aligned.sam
############################################################


############################################################
bsub -J aln1_$1 -w "done(bwaInducks_$1)" -o aln_1.lsf.out "bwa aln Trinity_files.Trinity.fasta ERR*_1.fastq > ERR_1.sai"
bsub -J aln2_$1 -w "done(bwaInducks_$1)" -o aln_2.lsf.out "bwa aln Trinity_files.Trinity.fasta ERR*_2.fastq > ERR_2.sai"
bsub -J sampe_$1 -w "done(aln1_$1) && done(aln2_$1)" -o sampe.lsf.out "bwa sampe Trinity_files.Trinity.fasta ERR_1.sai ERR_2.sai ERR*_1.fastq ERR*_2.fastq > RNASeq_vs_Trinity.sam"
bsub -J sambam_$1 -w "done(sampe_$1)" -o sambam.lsf.out "samtools view -Sbh RNASeq_vs_Trinity.sam > RNASeq_vs_Trinity.bam"
bsub -J RNAsort_$1 -w "done(sambam_$1)" -o rnasort.lsf.out "samtools sort RNASeq_vs_Trinity.bam RNASeq_vs_Trinity.sort"
bsub -J rnaInducks_$1 -w "done(RNAsort_$1)" -o rnaInducks.lsf.out samtools index RNASeq_vs_Trinity.sort.bam
############################################################

#############################################################
###Mapsplice the reads######################################
#bsub -J mapsplut_$1 -o mapsplut.lsf.out -M 75 -q week python /nas02/apps/mapsplice-2.1.4/src/MapSplice-v2.1.4/mapsplice.py -c /netscr/csoeder/1kGen/data/hg19_split/ -x /netscr/csoeder/1kGen/data/hg19_bowtieindex/hg19 -1 ERR*_1.fastq -2 ERR*_2.fastq 
bsub -J mapsplut_$1 -o mapsplut.lsf.out echo derp
#bsub -J mvsplut_$1 -w "done(mapsplut_$1)" -o mvsplut.lsf.out  mv mapsplice_out/alignments.sam $1_mapsplice_alignment.sam
bsub -J mvsplut_$1 -w "done(mapsplut_$1)" -o mvsplut.lsf.out echo derp
#bsub -J splutvert_$1 -w "done(mvsplut_$1)" -o splutvert.lsf.out "samtools view -Sbh $1_mapsplice_alignment.sam > $1_mapsplice_alignment.bam"
bsub -J splutvert_$1 -w "done(mvsplut_$1)" -o splutvert.lsf.out echo derp
#bsub -J bamsort_$1 -w "done(splutvert_$1)" -o bamsort.lsf.out samtools sort $1_mapsplice_alignment.bam $1_mapsplice_alignment.sort 
bsub -J bamsort_$1 -w "done(splutvert_$1)" -o bamsort.lsf.out echo derp
#bsub -J splutDex_$1 -w "done(bamsort_$1)" -o splutDex.lsf.out samtools index $1_mapsplice_alignment.sort.bam
bsub -J splutDex_$1 -w "done(bamsort_$1)" -o splutDex.lsf.out echo derp
#bsub -J bam2bed_$1 -w "done(bamsort_$1)" -o bam2bed.lsf.out "bedtools bamtobed -bed12 -i $1_mapsplice_alignment.sort.bam > $1_mapsplice_alignment.bed"
bsub -J bam2bed_$1 -w "done(bamsort_$1)" -o bam2bed.lsf.out echo derp
#############################################################

#########################################
###Assemble the reads####################
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


###BWA Alignement################################################################################################################################
#This has already been done...
#bsub -J aln_$1 -K -M 50 -o aln_$1_1.lsf.out "bwa aln ../data/hg19.fa Trinity_files.Trinity.fasta > $1_Trinity.sai"								#
#echo align end 																																	#
#bsub -J samse_$1 -K -M 50 -o samse_$1.lsf.out "bwa samse -n 10 ../data/hg19.fa $1_Trinity.sai Trinity_files.Trinity.fasta > $1_aligned.sam"		#
###																																				#
###this multimapper takes any entries in the SAM file which map to multiple locations, and collects them all in final.bed 						#
#bsub -J sam2bed -K -o bam2bed.lsf.out "python ../BWA_multimap_scraper.py $1_aligned.sam final.bed"		
#convert alignment to BAM, sort that stuff																														#
bsub -J bamvert2_$1 -w "done(TrinAlign_$1)" -o bamvert2.lsf.out "samtools view -bS $1_aligned.sam > $1_Assembly_Alignment.bam"
bsub -J bamsort2_$1 -w "done(bamvert2_$1)" -o bamsort2.lsf.out "samtools sort $1_Assembly_Alignment.bam $1_Assembly_Alignment.sorted"
#################################################################################################################################################


#############################################################################
###Partition the Transcripts into those which align and those which do not.
bsub -J gather_maps_$1 -w "done(bamsort2_$1)" -o gather_maps.lsf.out "samtools view -h -F4 $1_Assembly_Alignment.sorted.bam > $1_Assemblies_mapped.sam"
bsub -J gather_unmaps_$1 -w "done(bamsort2_$1)" -o gather_unmaps.lsf.out "samtools view -h -f4 $1_Assembly_Alignment.sorted.bam > $1_Assemblies_unmapped.sam"
#############################################################################

#bsub -J ready_$1 -o ready.lsf.out -w "done(BAMsort_$1) && done(gather_maps_$1) && done(gather_unmaps_$1) && done(bam2bed_$1) && done(sampe_$1)" echo YES


#bsub -J $1_aligned_fork -w "done(faidx_$1) && done(bamsort_$1) && done(gather_maps_$1)" -o aligned_fork.lsf.out -q week "sh ../aligned_fork_v3.5.sh 
#$1_Assemblies_mapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta"
#bsub -J $1_unaligned_fork -w "done(faidx_$1) && done(bamsort_$1) && done(gather_unmaps_$1) && done(rnaInducks_$1) && done(bam2bed_$1)" -o unaligned_fork.lsf.out -q 
#week "sh ../unaligned_fork_v3.5.sh $1_Assemblies_unmapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta RNASeq_vs_Trinity.sort.bam 
#$1_mapsplice_alignment.bed"

bsub -J $1_aligned_fork -q week -w "done(faidx_$1) && done(bamsort_$1) && done(gather_maps_$1)" -q week "sh $SCRIPT_DIR/aligned_fork_v3.5_parallel.sh $1_Assemblies_mapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta $1"
bsub -J $1_unaligned_fork -q week -w "done(faidx_$1) && done(bamsort_$1) && done(gather_unmaps_$1) && done(rnaInducks_$1) && done(bam2bed_$1)" -o unaligned_fork.lsf.out -q week "sh $SCRIPT_DIR/unaligned_fork_v3.5_parallel.sh $1_Assemblies_unmapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta RNASeq_vs_Trinity.sort.bam $1_mapsplice_alignment.bed $1"

#	$1 is the SAM file of mapped Trinity assemblies
#	$2 is the file of MapSpliced RNA-Seq reads
#	$3 is the indexed Trinity FASTA


bsub -J $1_alert -w "done($1_aligned_fork)" echo $1 has successfully completed





