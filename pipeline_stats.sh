#!/bin/sh

SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
#############################################
#	Load config								#
source $SCRIPT_DIR/pipeline_config.sh		#
#############################################
FOLDER=$1

#numreads??
num_mapped_reads=$( samtools view -c -F 4 "$FOLDER"_mapsplice_alignment.sort.bam )
num_assemblies=$( grep -c comp Trinity_files.Trinity.fasta )
num_mapped_assemblies=$( samtools view -c "$FOLDER"_Assemblies_mapped.sort.bam  )
num_ILS_anomalies=$( samtools view -c "$FOLDER"_ILS_anomalies.sort.bam )
num_cleanAssemblies=$( wc -l mapt/clean_assemblies.bed )	#	things that pass the accumulator
num_rawORFs=$( grep -c comp mapt/precleaned_ORFs.fa )	#	Number of ORFs in those assemblies
num_inPDB=$( wc -l mapt/found_in_PDB.list )	#	Number of ORFs found in PDB
num_absentPDB=$( wc -l mapt/absent_from_PDB.list )	#	Number of ORFs absent in PDB
num_noDupes=$( wc -l mapt/no_duplicates.bed )	#	number of ORFs with no genomic duplicates
num_Dupes=$( wc -l mapt/genome_duplicates.list )
num_noHomology=$( wc -l no_compprim_homology.bed )

