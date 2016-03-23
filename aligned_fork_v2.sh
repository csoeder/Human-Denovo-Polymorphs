#!/bin/sh
echo "#	$4 is being align-forked"
echo "###############################################"
echo "#	Loading config file...	"
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'					#"
source $SCRIPT_DIR/pipeline_config.sh					#
echo "#	... done."
echo "#############################################"
#	$1 is the SAM file of mapped Trinity assemblies
MAPPED_TRINITY=$1
#	$2 is the file of MapSpliced RNA-Seq reads
MAPSPLICED=$2
#	$3 is the indexed Trinity FASTA
TRINITY_FASTA=$3
#	$4 is the individual's identifier
IDENTIFIER=$4
echo "###	Start colleting ILS anomalies. ########"	
#samtools view -hSb $MAPPED_TRINITY | samtools sort -f - "$IDENTIFIER"_Assemblies_mapped.sort.bam; echo "#	Gathering the mapped Trinity assemblies, remove any overlapping known annotations..."
#bedtools intersect -split -v -abam "$IDENTIFIER"_Assemblies_mapped.sort.bam -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/complicated_repeats.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/yalepseudo.bed > "$IDENTIFIER"_ILS_anomalies.bam
#samtools sort -f "$IDENTIFIER"_ILS_anomalies.bam "$IDENTIFIER"_ILS_anomalies.sort.bam; echo "#	Collecting the resulting information and library science anomalies."

#awk '{if(($3-$2)/$7 > 0.9)print;}' blatAlign.bed | bedtools intersect -split -v -a - -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/complicated_repeats.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -a - -b $DATA_DIR/yalepseudo.bed > ILS_anomalies.bed
blat $DATA_DIR/hg19.fa Trinity_files.Trinity.fasta "$4"_blatAlign.psl # saw no particular blat parameters to change...
cat "$4"_blatAlign.psl | psl2bed > "$4"_blatAlign.bed
awk '{if(($3-$2)/$7 > 0.9)print;}' "$4"_blatAlign.bed | bedtools intersect -wa -a - -b $DATA_DIR/hg19.clean.bed | bedtools intersect -split -v -a - -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/complicated_repeats.bed  | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -a - -b $DATA_DIR/yalepseudo.bed > ILS_anomalies.bed

echo "#	ILS anomalies collected!"
echo "#############################################"
echo "#	entering working subdirectory...	"
mkdir mapt
cd mapt
echo "#############################################"
###############################################################
# bundle parameters############################################
BUN_NUM=0 #		The first bundle is number zero
COUNTER=0 #		Nothing in the present bundle
###############################################################
###	Where shall we keep our output? ###########################
#touch clean_assemblies.bed
mkdir clean_assemblies
touch rejects.bed
HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')	#	define the uppermost folder to return to; ie containing individual data
###############################################################
echo '#!/bin/sh' > bundle_$BUN_NUM.sh # 	The bundle is a script
echo "###############################################################"
echo "###	Begin laying down data, script bundles to handle it. ######"
echo "###############################################################"
#total_reads=$(samtools view -c ../"$IDENTIFIER"_ILS_anomalies.sort.bam)
total_reads=$(wc -l ../ILS_anomalies.bed | tr ' ' '\t' | cut -f 1)
#bamToBed -bed12 -i ../"$IDENTIFIER"_ILS_anomalies.sort.bam | while read line;
cat ../ILS_anomalies.bed | while read line;

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
		while [ -d "$path" ]				#	Rename if necessary
			do comp=$(echo $comp | awk '{print $0"_"}');
			path=''; for i in $(echo $comp | cut -f 1 -d _ | cut -f 2 -d p | grep -o .); do path="$path$i/"; done; path="$path/c$(echo $comp | cut -f 3 -d c)" ; #	This will create a depth-first path to the data
		done
		mkdir -p $path #	Create that directory structure
		cd $path
		echo $line | tr ' ' '\t' > curly.bed #	Write the interval being investigated
		samtools view -b $HOMEBASE$MAPSPLICED $chrom:$start-$stop | bamToBed  -bed12 -i - | bedtools intersect -split -wa -a stdin -b curly.bed > temp.bed #	Collect the mapspliced RNA-Seq reads overlapping (but not splice-spanning) the interval
		cd $HOMEBASE/mapt/ #	Return to the mapt directory to write to the script bundle
		### Lay down the script ########################################################
		echo "cd $path" >> bundle_$BUN_NUM.sh 		#	push
		echo "echo $comp" >> bundle_$BUN_NUM.sh 	#	ohai
		echo "sh $SCRIPT_DIR/aligned_accumulator_widget_smart.sh $MAPSPLICED $comp" >> bundle_$BUN_NUM.sh #	go
		echo "cd $(pwd)" >> bundle_$BUN_NUM.sh 			#	pop
		echo "rm -rf $path" >> bundle_$BUN_NUM.sh 	#	EXTERMINATE
		################################################################################
		let COUNTER+=1 #					Next!
		###	If the bundle is full, then start a new one! ################################
		if [ $COUNTER -gt $BATCH_SIZE ]; then let BUN_NUM+=1 ; echo "######	$BUN_NUM of $((total_reads/BATCH_SIZE)) bundles prepared"; echo '#!/bin/sh' > bundle_$BUN_NUM.sh; COUNTER=0; fi
	done
echo "###	Done recording data and writing bundle scripts. ###########"
echo "#################################################################"
echo "###	Now run the bundle scripts ################################"
for script in `ls | grep -v lsf | grep .sh`;
		#		submit the job, wait a while, repeat...
		do bsub -J align_grind_$IDENTIFIER -o $script.lsf.out -q week -n 3 -R "span[hosts=1]" sh $script; sleep $WAIT_TIME; 	#	Special settings so Jenny doesn't yell at me
	done
echo "########################################################"
echo "###	Chill out until the bundle scripts are all done ##############"
while [ `bjobs -w | grep align_grind_$IDENTIFIER | wc -l` -gt 0 ]
		do sleep 60;
	done
echo "###	Accumulation-checking is DONE! ##############"
echo "########################################################"
echo "###	Clean up the mess###################################"
bsub -J detrivore -o /dev/null "rm -rf 1; rm -rf 2; rm -rf 3; rm -rf 4; rm -rf 5; rm -rf 6; rm -rf 7; rm -rf 8; rm -rf 9;"	#	Cleanup the depth-first file structure
mkdir detritus
mv bundle_* detritus/
echo "###########################################################"
echo "###	Unpack the cleared assemblies into a FASTA 			#"
echo "###	of nucleotide sequences...	#########################"
cut -f 4 clean_assemblies/* > clean_assemblies.list
rm -rf clean_assemblies
touch clean_assemblies.fa
while read assembly;	#	For each clean assembly...
	do 
	samtools faidx ../$TRINITY_FASTA $assembly >> clean_assemblies.fa #	put it in a new file!
	done < clean_assemblies.list
echo "... done!"
echo "########################################################"
echo "###	Pull all ORFs out of these OK'd assemblies"
python $SCRIPT_DIR/ORF_extract.py clean_assemblies.fa rough_ORFs.fa
echo "###	And then filter them for length"
python $SCRIPT_DIR/garbageman.py rough_ORFs.fa precleaned_ORFs.fa
echo "########################################################"
echo "###	BLAST!"
echo "###	Blast the ORFs to make sure they're not known proteins..."
blastx -outfmt 6 -db $DATA_DIR/blast/pdbaa -query precleaned_ORFs.fa -out PDB_BLASTX_results.out #	make like nitroglycerine and blastx
cut -f 1 PDB_BLASTX_results.out | sort | uniq > found_in_PDB.list #						collect the names of all the sequences which stuck to PDB
grep ">" precleaned_ORFs.fa| cut -f 2 -d '>' | grep -v -wFf found_in_PDB.list > absent_from_PDB.list
echo "###	... done! Collect the nucleotide sequences in a FASTA..."
while read assembly;	#	For each clean assembly...
	do 
	samtools faidx ../$TRINITY_FASTA $assembly >> absent_from_PDB.fasta #	put it in a new file!
	done < absent_from_PDB.list
echo "###	...done!"
echo "########################################################"
echo "###	Realign the ORFs with BLAT"
blat $DATA_DIR/hg19.fa absent_from_PDB.fasta absent_from_PDB.blatted.psl
echo "###	Use the output for quality control re: duplicates in the genome"
for ORF in $(grep ">" absent_from_PDB.fasta | cut -f 2 -d ">" ); do #	pull each ORF mapping. 
	numhits=$(grep $ORF absent_from_PDB.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort | uniq | grep -c $ORF );

	if [[ $numhits -eq 1 ]] ; then	#	If there's only one example 
		line=$(grep $ORF absent_from_PDB.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" |sort |uniq | head -n 1);
		first=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 1,2,3,4,5,6 )
		last=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 18,19,21 )
		echo -e "$first\t0\t0\t0,0,0\t$last" >> no_duplicates.bed	#	then it's clean - write it!
	else						#	If there are more than one ...
		grep $ORF absent_from_PDB.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort | uniq > duplicates.psl.temp;	# collect those records one at a time
		sort -k1,1 -r -g duplicates.psl.temp > duplicates.sorted.psl.temp
		python $SCRIPT_DIR/blatcheck.py duplicates.sorted.psl.temp; #	double check: is one alignment half the size of the other? etc.
		if [[ -e cleared_sequence.psl.temp ]] ; then	# if blatcheck decided it was ok...
			line=$(head -n 1 duplicates.sorted.psl.temp) 
			first=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 1,2,3,4,5,6 )
			last=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 18,19,21 )			
			echo -e "$first\t0\t0\t0,0,0\t$last" >> no_duplicates.bed;	#	write it to the no-dupes file
		fi
		#	Otherwise, blatcheck has written to the .list files about it, so move on
		rm *.temp # clean up the detritus
	fi
done
echo "###	... duplicates removed!"
echo "########################################################"
echo "###	chunk any spliced ORFs into exons"
bedtools bed12tobed6 -i no_duplicates.bed > no_duplicates.chunked.bed
echo "###	last-minute cleanup: do any stragglers intersect with annotations?"
echo "###	they shouldn't, but check escapees.lookback.bed for specifics. >.>"
sh $SCRIPT_DIR/bedfilter_detect_retro.sh no_duplicates.bed 	#	Do any of the sites intersect with annotations? 
echo "########################################################"
echo "###	reCollect sequences which have passed inspection thusfar into a FASTA of nt sequences..."
cut -f4 no_duplicates.bed | while read assembly;	
	do 
	samtools faidx $HOMEBASE/$TRINITY_FASTA $assembly >> human_candidates.fasta
	done
echo "###	... done!"
echo "########################################################"
echo "###	Time to check comparative primatology"
echo "########################################################"
blat $DATA_DIR/chimp/panTro4.fa human_candidates.fasta chimpCompare.blatted.psl 	#	BLAT vs. chimp
echo "###	*	BLAT vs. chimp"
blat $DATA_DIR/gorilla/gorGor3.fa human_candidates.fasta gorillaCompare.blatted.psl #	BLAT vs. gorilla
echo "###	*	BLAT vs. gorilla"
echo "###	scanning comparative primatology results, excluding hits with clear homology to a coding sequence..."
total_regions=$(grep chr[1-9,X,Y][0-9]*"\s" no_duplicates.bed | cut -f 4 | sort | uniq | grep -c comp);
loop_num=0;
for assembly in $(grep chr[1-9,X,Y][0-9]*"\s" no_duplicates.bed | cut -f 4 | sort | uniq ); do #	going to take all the candidates thusfar, see who's in chimp/gorilla
	numhits_pan=$(grep -c $assembly chimpCompare.blatted.psl);
	numhits_gor=$(grep -c $assembly gorillaCompare.blatted.psl);

	if [ $numhits_pan -eq 0  -a $numhits_gor -eq 0 ]; then
		grep $assembly no_duplicates.bed >> unseen_in_pan_and_gor.bed; 
	fi;

	if [ $numhits_pan -gt 0  -o $numhits_gor -gt 0 ]; then
		grep $assembly chimpCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > chimphit.psl.temp #	write the PSL lines from the chimp blat to a temp file
		grep $assembly gorillaCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > gorillahit.psl.temp #	remove wonky chromomomes. same with gorilla. 
        python $SCRIPT_DIR/blatcheck_compprim.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp; 					#	Do a check to make try and determine if the homologous sequence
        python $SCRIPT_DIR/blatcheck_compprim.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla; 				#	is an ORF
#	python $SCRIPT_DIR/ORFome_puzzler.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp; 
#	python $SCRIPT_DIR/ORFome_puzzler.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla;
	fi;
	let loopnum+=1;
	if [[ $((loopnum%10)) -eq 0 ]]; then echo "Site $loopnum of $total_regions checked!"; fi
	rm *.temp
done;
cut -f 1 broken_in_chimp.log > broken_in_chimp.list
cut -f 1 broken_in_gorilla.log > broken_in_gorilla.list
#cp chimp.noncoding broken_in_chimp.list
#cp gorilla.noncoding broken_in_gorilla.list
grep  -wFf broken_in_chimp.list no_duplicates.bed | grep -wFf broken_in_gorilla.list > broken_in_pan_and_gor.bed
cat unseen_in_pan_and_gor.bed broken_in_pan_and_gor.bed | sort | uniq | bedtools intersect -wa -v -a - -b $DATA_DIR/complicated_repeats.bed  > no_compprim_homology.bed
echo "###	... done!"
echo "########################################################"
echo "#	Data ready for database upload!"
echo "########################################################"

cd $HOMEBASE
mkdir runtime_logs
mv *.lsf.out runtime_logs
mv *.log runtime_logs

echo "$IDENTIFIER has been align-forked!	########################################################"
echo "################################################################################################################"
