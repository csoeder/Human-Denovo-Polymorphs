#!/bin/sh
#	Takes a single argument, the folder to be processed, which is expected to have a Trinity assembly file
#	(Trinity_files.Trinity.fasta), paired-end reads (ERR*_1/2.fastq) and a mapsplice alignment from 
#	the_mapsplicer.sh ($1_mapsplice_alignment.*). Processes the Trinity assemblies which do and don't align
#	as separate forks; the unaligned fork is underdeveloped.

#############################################################################
DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'
#############################################################################
### Index the Trinity fasta #################################
bsub -J bwaInducks_$1 -o bwaInducks.lsf.out bwa index Trinity_files.Trinity.fasta
bsub -J faidx_$1 -w "done(bwaInducks_$1)" -o faidx.lsf.out samtools faidx Trinity_files.Trinity.fasta
#############################################################################
### Align the Trinity #######################################
bsub -J TrinAlign_$1 -M 50 -w "done(faidx_$1)" -o TrinAlign.lsf.out bowtie2 -f -x $DATA_DIR/hg19_bowtieindex/hg19 -U Trinity_files.Trinity.fasta -S $1_aligned.sam
bsub -J bamvert2_$1 -w "done(TrinAlign_$1)" -o bamvert2.lsf.out "samtools view -bS $1_aligned.sam > $1_Assembly_Alignment.bam"
bsub -J bamsort2_$1 -w "done(bamvert2_$1)" -o bamsort2.lsf.out "samtools sort $1_Assembly_Alignment.bam $1_Assembly_Alignment.sorted"
#############################################################################
###	Align the paired-end reads to the Trinity transcripts;	#						As long as the unmapped fork is disabled, these jobs are a 
###	hopefully rescue unaligned assemblies in the unaligned 	#						waste of gigaflops & gigabytes
###	fork ####################################################
#bsub -J aln1_$1 -w "done(bwaInducks_$1)" -o aln_1.lsf.out "bwa aln Trinity_files.Trinity.fasta ERR*_1.fastq > ERR_1.sai"
#bsub -J aln2_$1 -w "done(bwaInducks_$1)" -o aln_2.lsf.out "bwa aln Trinity_files.Trinity.fasta ERR*_2.fastq > ERR_2.sai"
#bsub -J sampe_$1 -w "done(aln1_$1) && done(aln2_$1)" -o sampe.lsf.out "bwa sampe Trinity_files.Trinity.fasta ERR_1.sai ERR_2.sai ERR*_1.fastq ERR*_2.fastq > RNASeq_vs_Trinity.sam"
#bsub -J sambam_$1 -w "done(sampe_$1)" -o sambam.lsf.out "samtools view -Sbh RNASeq_vs_Trinity.sam > RNASeq_vs_Trinity.bam"
#bsub -J RNAsort_$1 -w "done(sambam_$1)" -o rnasort.lsf.out "samtools sort RNASeq_vs_Trinity.bam RNASeq_vs_Trinity.sort"
#bsub -J rnaInducks_$1 -w "done(RNAsort_$1)" -o rnaInducks.lsf.out samtools index RNASeq_vs_Trinity.sort.bam
#############################################################################
### Partition the Transcripts into those which align and # 
### those which do not. ##################################
bsub -J gather_maps_$1 -w "done(bamsort2_$1)" -o gather_maps.lsf.out "samtools view -h -F4 $1_Assembly_Alignment.sorted.bam > $1_Assemblies_mapped.sam"
#bsub -J gather_unmaps_$1 -w "done(bamsort2_$1)" -o gather_unmaps.lsf.out "samtools view -h -f4 $1_Assembly_Alignment.sorted.bam > $1_Assemblies_unmapped.sam"
#############################################################################
### Fork a job on each partition ############################
bsub -J $1_aligned_fork -q week -w "done(faidx_$1) && done(gather_maps_$1)" -q week -o aligned_fork.lsf.out "sh $SCRIPT_DIR/aligned_fork_v3.5_parallel.sh $1_Assemblies_mapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta $1"
#bsub -J $1_unaligned_fork -q week -w "done(faidx_$1) && done(gather_unmaps_$1) && done(rnaInducks_$1)" -o unaligned_fork.lsf.out -q week "sh $SCRIPT_DIR/unaligned_fork_v3.5_parallel.sh $1_Assemblies_unmapped.sam $1_mapsplice_alignment.sort.bam Trinity_files.Trinity.fasta RNASeq_vs_Trinity.sort.bam $1_mapsplice_alignment.bed $1"
#	ignore the unaligned fork
############################################################################
### Is it done? Email me. ###################################
bsub -J $1_alert -w "done($1_aligned_fork)" echo $1 has successfully completed
#############################################################################




