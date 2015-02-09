#!/bin/sh

#############################################
#	Load relevant modules 					#
. /nas02/apps/Modules/default/init/bash		#
module load bedops							#
module load samtools
module load bedtools
#############################################
#	Load config								#
source ../pipeline_config.sh					#
#############################################
#	$1 is the SAM file of mapped Trinity assemblies
MAPPED_TRINITY=$1
#	$2 is the file of MapSpliced RNA-Seq reads
MAPSPLICED=$2
#	$3 is the indexed Trinity FASTA
TRINITY_FASTA=$3
#	$4 is the individual's identifier
IDENTIFIER=$4

samtools view -hSb $MAPPED_TRINITY | samtools sort -f - "$IDENTIFIER"_Assemblies_mapped.sort.bam #	Gather the mapped Trinity assemblies, remove any overlapping known annotations...
bedtools intersect -split -v -abam "$IDENTIFIER"_Assemblies_mapped.sort.bam -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/repeatmasker.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/yalepseudo.bed > "$IDENTIFIER"_ILS_anomalies.bam
samtools sort -f "$IDENTIFIER"_ILS_anomalies.bam "$IDENTIFIER"_ILS_anomalies.sort.bam #	Collect the resulting information and library science anomalies.

mkdir mapt
cd mapt

date
echo "$IDENTIFIER is being align-forked"


###############################################################
# bundle parameters############################################
BUN_NUM=0 #		The first bundle is number zero
COUNTER=0 #		Nothing in the present bundle
###############################################################
###	Where shall we keep our output? ###########################
touch clean_assemblies.bed
touch rejects.bed
HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')	#	define the uppermost folder to return to; ie containing individual data
###############################################################
echo '#!/bin/sh' > bundle_$BUN_NUM.sh # 	The bundle is a script
###############################################################
###	Begin laying down data, script bundles to handle it. ######
###############################################################
total_reads=$(samtools view -c ../"$IDENTIFIER"_ILS_anomalies.sort.bam)
bamToBed -bed12 -i ../"$IDENTIFIER"_ILS_anomalies.sort.bam | while read line;
	###		for each aligned transcript
	do 
        chrom=$(echo $line | cut -f1 -d' ')	#	Grab the genomic coords...
        start=$(echo $line | cut -f2 -d' ')
        stop=$(echo $line | cut -f3 -d' ')
		comp=$(echo $line | cut -f4 -d' ')	#	... and its name

		while [ -d "$comp" ]				#	Rename if necessary
			do comp=$(echo $comp | awk '{print $0"_"}')
		done
		### Lay down the data ########################################################
		path=''; for i in $(echo $comp | cut -f 1 -d _ | cut -f 2 -d p | grep -o .); do path="$path$i/"; done; path="$path/c$(echo $comp | cut -f 3 -d c)" #	This will create a depth-first path to the data

		mkdir -p $path
		cd $path
		echo $line | tr ' ' '\t' > curly.bed
		samtools view -b $HOMEBASE$MAPSPLICED $chrom:$start-$stop | bamToBed  -bed12 -i - | bedtools intersect -split -wa -a stdin -b curly.bed > temp.bed
#		sh $SCRIPT_DIR/bedfilter_detect.sh temp.bed overlap.bed
		cd $HOMEBASE/mapt/

		### Lay down the script ########################################################
		echo "cd $path" >> bundle_$BUN_NUM.sh 		#	push
		echo "echo $comp" >> bundle_$BUN_NUM.sh 	#	ohai
		echo "sh $SCRIPT_DIR/aligned_accumulator_widget_smart.sh $MAPSPLICED $comp" >> bundle_$BUN_NUM.sh #	go
		echo "cd $(pwd)" >> bundle_$BUN_NUM.sh 			#	pop
		echo "rm -rf $path" >> bundle_$BUN_NUM.sh 	#	EXTERMINATE
		################################################################################
		let COUNTER+=1 #					Next!

		###	If the bundle is full, then start a new one! ################################
		if [ $COUNTER -gt $BATCH_SIZE ]; then let BUN_NUM+=1 ; echo "$BUN_NUM of $((total_reads/BATCH_SIZE)) bundles prepared"; echo '#!/bin/sh' > bundle_$BUN_NUM.sh; COUNTER=0; fi
	done
########################################################
###	Now run the scripts ################################
for script in `ls | grep -v lsf | grep .sh`;
		#		submit the job, wait a while, repeat...
		do bsub -J align_grind_$IDENTIFIER -o $script.lsf.out -q week sh $script; sleep $WAIT_TIME;
	done
########################################################
###	Chill out until the jobs are all done ##############
while [ `bjobs -w | grep align_grind_$IDENTIFIER | wc -l` -gt 0 ]
		do echo "chillin...";
		sleep 60;
	done
########################################################
###	Clean up the mess###################################
mkdir detritus
mv bundle_* detritus/
#########################################################
###	Unpack the cleared assemblies into a FASTA 			#
###	of nt sequences	####################################~
touch clean_assemblies.fa
cut -f4 clean_assemblies.bed | while read assembly;	#	For each clean assembly...
	do 
	samtools faidx ../$TRINITY_FASTA $assembly >> clean_assemblies.fa #	put it in a new file!
	done
########################################################
###	Pull all ORFs out of these OK'd assemblies
python $SCRIPT_DIR/ORF_extract.py clean_assemblies.fa rough_ORFs.fa
###	And then process them; in particular for length
python $SCRIPT_DIR/garbageman.py rough_ORFs.fa precleaned_ORFs.fa
########################################################
###	BLAST!
###	Blast the ORFs to make sure they're not known proteins
blastx -outfmt 6 -db $DATA_DIR/blast/pdbaa -query precleaned_ORFs.fa -out PDB_BLASTX_results.out #	make like nitroglycerine and blastx
cut -f 1 PDB_BLASTX_results.out | sort | uniq > found_in_PDB.list #						collect the names of all the sequences which stuck to PDB
grep ">" precleaned_ORFs.fa| cut -f 2 -d '>' | grep -v -wFf found_in_PDB.list > absent_from_PDB.list
grep -wFf absent_from_PDB.list clean_assemblies.bed > absent_from_PDB.bed #			exclude them from clean_assemblies to a new BED file
touch absent_from_PDB.fasta
cut -f4 absent_from_PDB.bed | while read assembly;	#	For each clean assembly...
	do 
	samtools faidx ../$TRINITY_FASTA $assembly >> absent_from_PDB.fasta #	put it in a new file!
	done
###	Collect the results.... Done!

########################################################
###	Realign the ORFs with BLAT
blat $DATA_DIR/hg19.fa absent_from_PDB.fasta absent_from_PDB.blatted.psl
#	Use the output for quality control re: duplicates in the genome
for assembly in $(grep chr[1-9,X,Y][0-9]*"\s" absent_from_PDB.bed | cut -f 4 | sort | uniq ); do #	pull each assembly mapping. 
	numhits=$(grep -c $assembly absent_from_PDB.blatted.psl);


	if [[ $numhits -eq 1 ]] ; then	#	If there's only one example 
		grep $assembly absent_from_PDB.bed >> no_duplicates.bed	#	then it's clean - write it!
	else						#	If there are more than one ...
		grep $assembly absent_from_PDB.blatted.psl > duplicates.psl.temp;	# collect those records one at a time
		sort -k1,1 -r duplicates.psl.temp > duplicates.sorted.psl.temp
		python $SCRIPT_DIR/blatcheck.py duplicates.sorted.psl.temp; #	double check: is one alignment half the size of the other? etc.
		if [[ -e cleared_sequence.psl.temp ]] ; then	# if blatcheck decided it was ok...
			grep $assembly absent_from_PDB.bed >> no_duplicates.bed; #	write it to the no-dupes file
		fi
		#	Otherwise, blatcheck has written to the .list files about it, so move on
	fi
	rm *.temp # clean up the detritus
done
########################################################

########################################################
###	chunk any spliced ORFs into exons
bedtools bed12ToBed6 -i no_duplicates.bed > no_duplicates.chunked.bed
###	last-minute cleanup >.>
sh $SCRIPT_DIR/bedfilter_detect_retro.sh no_duplicates.bed 	#	Do any of the sites intersect with annotations? they shouldn't, but check *.lookback.bed for specifics.
########################################################
cut -f4 no_duplicates.bed | while read assembly;	
	do 
	samtools faidx $HOMEBASE/$TRINITY_FASTA $assembly >> human_candidates.fasta
	done
#	reCollect sequences which have passed inspection thusfar.
########################################################
#	Time to check comparative primatology
########################################################
blat $DATA_DIR/chimp/panTro4.fa human_candidates.fasta chimpCompare.blatted.psl 	#	BLAT vs. chimp
blat $DATA_DIR/gorilla/gorGor3.fa human_candidates.fasta gorillaCompare.blatted.psl #	BLAT vs. gorilla

for assembly in $(grep chr[1-9,X,Y][0-9]*"\s" no_duplicates.bed | cut -f 4 | sort | uniq ); do #	going to take all the candidates thusfar, see who's in chimp/gorilla
	numhits_pan=$(grep -c $assembly chimpCompare.blatted.psl);
	numhits_gor=$(grep -c $assembly gorillaCompare.blatted.psl);

	if [[ $numhits_pan -eq 0 ] -a [$numhits_gor -eq 0 ]]; then
		grep $assembly no_duplicates.bed >> unseen_in_pan_and_gor.bed; 
	fi;

	if [[ $numhits_pan -gt 0 ] -o [$numhits_gor -gt 0 ]]; then
		grep $assembly chimpCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r | head -n1 > chimphit.psl.temp #	write the PSL lines from the chimp blat to a temp file
		grep $assembly gorillaCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r | head -n1 > gorillahit.psl.temp #	remove wonky chromomomes. same with gorilla. 
        python $SCRIPT_DIR/blatcheck_compprim.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp; 					#	Do a check to make try and determine if the homologous sequence
        python $SCRIPT_DIR/blatcheck_compprim.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla; 				#	is an ORF
	fi;
	rm *.temp
done;

grep  -wFf broken_in_chimp.list no_duplicates.bed | grep -wFf broken_in_gorilla.list > broken_in_pan_and_gor.bed
cat unseen_in_pan_and_gor.bed broken_in_pan_and_gor.bed > no_compprim_homology.bed
########################################################
#	Data ready for database upload!
########################################################

cd $HOMEBASE
mkdir runtime_logs
mv *.lsf.out runtime_logs
mv *.log runtime_logs

echo DONE
date
echo
