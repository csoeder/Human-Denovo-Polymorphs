#!/bin/sh
echo "#	$3 is being align-forked"
echo "###############################################"

echo "#	Loading config file...	"
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'					#"
source $SCRIPT_DIR/pipeline_config.sh					#
echo "#	... done."
echo "#############################################"
#	$1 is the indexed Trinity FASTA
TRINITY_FASTA=$1
#	$2 is the file of MapSpliced RNA-Seq reads
MAPSPLICED=$2
#	$3 is the name of the individual
IDENTIFIER=$3

nucl_run=0;
accum_run=0;
misc_run=0;
echo "TO DO:"
while getopts ":nam" opt; do
	case $opt in
		n)
			echo "process nucleotides";
			nucl_run=1;
		;;

		a)
			echo "check accumulation";
			accum_run=1;
		;;

		m)
			echo "check duplication, compPrim, peptides";
			misc_run=1;
		;;


		\?)
			echo "Invalid option: -$OPTARG" >&2
		;;
	esac
done

if [ $((nucl_run+accum_run+misc_run)) -eq 0 ]; then 
	nucl_run=1;
	echo "process nucleotides";
	accum_run=1;
	echo "check accumulation";
	misc_run=1;
	echo "check duplication, compPrim, peptides";
fi;
#if no options set, run everything

if [ $nucl_run -eq 1 ]; then
####
echo "###		Building BLAST databases from transcriptomes..." ;
makeblastdb -in Trinity_files.Trinity.fasta -dbtype nucl -parse_seqids ;
#### ^^^^ do this in the pipeline??
echo "###	... databases ready for BLASTing!" ;


echo "###	Aligning the Trinity assemblies..." ;
blat -noHead $DATA_DIR/hg19.fa $TRINITY_FASTA "$IDENTIFIER"_blatAlign.psl ;
##	if the total sequence identity is 90+%, keep the alignment
echo "###	Filtering Alignments for quality..." ;
awk '{if(($1+$3)/$11>0.9)print;}' "$IDENTIFIER"_blatAlign.psl > "$IDENTIFIER"_blatAlign.goodAlign.psl ;
##	convert PSL to BED12??
cat "$IDENTIFIER"_blatAlign.goodAlign.psl | psl2bed > "$IDENTIFIER"_blatAlign.goodAlign.bed.derpy ;

echo "###	Rejecting annotated alignments..." ;
##	make a list of transcripts which are well-mapped onto an annotation
bedtools intersect -split -wa -u -a "$IDENTIFIER"_blatAlign.goodAlign.bed.derpy -b $DATA_DIR/UCSC_genes.bed $DATA_DIR/refSeq_genes.bed $DATA_DIR/complicated_repeats.bed $DATA_DIR/retroposed1.bed $DATA_DIR/retroposed2.bed $DATA_DIR/retroposed3.bed $DATA_DIR/yalepseudo.bed | cut -f 4 | sort | uniq > ILS_known.list ;
##	remove those transcripts from consideration entirely
bedtools intersect -split -wa -u -a "$IDENTIFIER"_blatAlign.goodAlign.bed.derpy -b $DATA_DIR/UCSC_genes.bed $DATA_DIR/refSeq_genes.bed | cut -f 4 | sort | uniq > identified_gene_transcripts.list ;
grep -v -wFf ILS_known.list "$IDENTIFIER"_blatAlign.goodAlign.bed.derpy > "$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy ;
cut -f 4 "$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | sort | uniq > ILS_anom.list ;
echo "###	Calculating coverage; flagging low-cov alignments..."
bsub -M 30 -K -o /dev/null "bedtools genomecov -bga -split -ibam "$MAPSPLICED" -g "$DATA_DIR"/hg19.fa.fai > "$IDENTIFIER"_coverage.bg";
bsub -M 30 -K -o /dev/null "bedtools intersect -wa -wb -a "$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy -b "$IDENTIFIER"_coverage.bg | grep -w [01]$ | cut -f 1,2,3,4,6 | sort | uniq > "$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.lowCov_warning" ;
echo "###	Extracting introns called by MapSplice..." ;
bsub -M 30 -K -o /dev/null "samtools view -H "$IDENTIFIER"_mapsplice_alignment.sort.bam > "$IDENTIFIER"_splicedReads.sam " ;
echo "collecting spliced reads"
bsub -M 30 -K -o /dev/null "samtools view "$IDENTIFIER"_mapsplice_alignment.sort.bam |  awk '(\$6 ~ /N/)' >>  "$IDENTIFIER"_splicedReads.sam ";
echo "converting to bed"
bsub -M 30 -K -o /dev/null "samtools view -hbS "$IDENTIFIER"_splicedReads.sam | bamToBed -bed12 -i - > "$IDENTIFIER"_splicedReads.bed12 ";
echo "pulling read regions"
bsub -M 30 -K -o /dev/null "cut -f 1,2,3 "$IDENTIFIER"_splicedReads.bed12 | bedtools sort -i - | bedtools merge -i - > "$IDENTIFIER"_splicedReads.readregions.bed3 ";
echo "pulling read exons"
bsub -M 30 -K -o /dev/null "bed12ToBed6 -i "$IDENTIFIER"_splicedReads.bed12 | bedtools sort -i - | bedtools merge -i - > "$IDENTIFIER"_splicedReads.exons.bed6 ";
echo "pulling read introns"
bsub -M 30 -K -o /dev/null "subtractBed -a "$IDENTIFIER"_splicedReads.readregions.bed3 -b "$IDENTIFIER"_splicedReads.exons.bed6 | cut -f 1,2,3,4,5,6 | bedtools sort -i - |  bedtools merge -i - > "$IDENTIFIER"_splicedReads.introns.bed ";
#thanks biostars et al https://www.biostars.org/p/12626/

# cat "$IDENTIFIER"_blatAlign.psl | psl2bed > "$IDENTIFIER"_blatAlign.bed.derpy
# python "$SCRIPT_DIR"/psl2bed_blockFixr.py "$IDENTIFIER"_blatAlign.bed.derpy "$IDENTIFIER"_blatAlign.bed
# rm "$IDENTIFIER"_blatAlign.bed.derpy
echo "#	... done identifying the ILS alignments, ready to proceed.";
echo "#############################################";
fi
###############################################################
#	Enter the candidates thusfar? (ie, All sequences and locations)
###############################################################
# echo "###	Start colleting ILS anomalies. ########"	
# awk '{if(($3-$2)/$7 > 0.9)print;}' "$IDENTIFIER"_blatAlign.bed | bedtools intersect -split -v -a - -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -a - -b $DATA_DIR/complicated_repeats.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -a - -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -a - -b $DATA_DIR/yalepseudo.bed > ILS_anomalies.bed
# echo "#	... done."
# echo "#############################################"
###############################################################
#	Enter the candidates thusfar? (ie, flag those that survive the Tier I filter, no direct overlap)
###############################################################
echo "#	entering working subdirectory...	"
mkdir mapt
cd mapt
echo "#############################################"
if [ $accum_run -eq 1 ]; then
# bundle parameters############################################
BUN_NUM=0 #		The first bundle is number zero
COUNTER=0 #		Nothing in the present bundle
###############################################################
###	Where shall we keep our output? ###########################
#touch clean_assemblies.bed
mkdir accumulation_clean_assemblies
touch rejects.bed
HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')	#	define the uppermost folder to return to; ie containing individual data
###############################################################
echo '#!/bin/sh' > bundle_$BUN_NUM.sh # 	The bundle is a script
echo "###############################################################"
echo "###	Begin laying down data, script bundles to handle it. ######"
echo "###############################################################"
total_reads=$(wc -l ../ILS_anomalies.bed | tr ' ' '\t' | cut -f 1)

cat ../"$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | while read line;
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

echo "#################################################################"
echo "###	Now run the bundle scripts ################################"
for script in `ls | grep -v lsf | grep .sh`;
		#		submit the job, wait a while, repeat...
		do bsub -J align_grind_"$IDENTIFIER" -o $script.lsf.out -q week -n 3 -R "span[hosts=1]" sh $script; sleep $WAIT_TIME; 	#	Special settings so Jenny doesn't yell at me
	done
echo "########################################################"
echo "###	Chill out until the bundle scripts are all done ##############"
while [ `bjobs -w | grep align_grind_$IDENTIFIER | wc -l` -gt 0 ]
		do sleep 60;
	done ;
cat accumulation_clean_assemblies/* > accumulation_clean_assemblies.bed ;
rm -rf accumulation_clean_assemblies ;
echo "###	Accumulation-checking is DONE! ##############" ;
echo "########################################################" ;
###############################################################
#	Enter the candidates thusfar? (ie, flag those that survive the Tier II filter, no accumulated overlap)
###############################################################
###############################################################
#	Also, update the aligned_accumulator_widget
###############################################################
echo "###	Clean up the mess###################################" ;
bsub -J detrivore -o /dev/null "rm -rf 0; rm -rf 1; rm -rf 2; rm -rf 3; rm -rf 4; rm -rf 5; rm -rf 6; rm -rf 7; rm -rf 8; rm -rf 9;"	;#	Cleanup the depth-first file structure 
mkdir detritus ;
mv bundle_* detritus/ ;
fi
#cut -f 4 clean_assemblies/* > clean_assemblies.list
#rm -rf clean_assemblies
#touch clean_assemblies.fa
if [ $misc_run -eq 1 ]; then
echo "###########################################################"
echo "###       Unpack the Tier-I assemblies into a FASTA                      #"
echo "###       of nucleotide sequences...      #########################"
###############################################################
#	Let's actually keep all but the ORFs failing Tier I (ie, ILS_anomalies)
###############################################################
for assembly in $(cut -f 4 ../"$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | sort | uniq); do samtools faidx ../$TRINITY_FASTA $assembly >> clean_assemblies.fa ; done 
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
echo "###	Known peptides identified!"
###############################################################
#	Another change: all ORFs are blatted, not just absent_from_PDB, so that the two datatags can be separated. 
###############################################################

echo "########################################################"
echo "###	Realign the ORFs with BLAT"
blat $DATA_DIR/hg19.fa precleaned_ORFs.fa precleaned_ORFs.blatted.psl
echo "###	Use the output for quality control re: duplicates in the genome"
for ORF in $(grep ">" precleaned_ORFs.fa | cut -f 2 -d ">" ); do #	pull each ORF mapping. 
	numhits=$(grep $ORF precleaned_ORFs.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | grep -c $ORF );
	if [[ $numhits -eq 1 ]] ; then	#	If there's only one example 
		line=$(grep $ORF precleaned_ORFs.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | head -n 1);
		first=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 1,2,3,4,5,6 )
		last=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 18,19,21 )
		echo -e "$first\t0\t0\t0,0,0\t$last" >> no_duplicates.bed	#	then it's clean - write it!
#	elif [[ $numhits -eq 0 ]] ; then
#		: ;
	else						#	If there are more than one ...
#		grep $ORF precleaned_ORFs.blatted.psl | grep chr[1-9,X,Y,M][0-9,A,B]*"\s" > duplicates.psl.temp;	# collect those records one at a time
		grep $ORF precleaned_ORFs.blatted.psl | sort -k1,1 -r -g > duplicates.psl.temp;	# collect those records one at a time
#		sort -k1,1 -r -g duplicates.psl.temp > duplicates.sorted.psl.temp	#	sort the duplicates by quality
		python $SCRIPT_DIR/blatcheck.py duplicates.psl.temp; #	double check: is one alignment half the size of the other? etc.
		if [[ -e cleared_sequence.psl.temp ]] ; then	# if blatcheck decided it was ok...
			line=$(head -n 1 cleared_sequence.psl.temp) 
			first=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 1,2,3,4,5,6 )
			last=$( echo $line | tr ' ' '\t' | psl2bed | cut -f 18,19,21 )			
			echo -e "$first\t0\t0\t0,0,0\t$last" >> no_duplicates.bed;	#	write it to the no-dupes file
		fi
		#	Otherwise, blatcheck has written to the .list files about it, so move on
		rm *.temp # clean up the detritus
	fi
done
echo "###	... duplicates identified!"
echo "########################################################"
echo "###	chunk any spliced ORFs into exons"
bedtools bed12tobed6 -i no_duplicates.bed > no_duplicates.chunked.bed
echo "###	last-minute cleanup: do any stragglers intersect with annotations?"
echo "###	they shouldn't, but check escapees.lookback.bed for specifics. >.>"
sh $SCRIPT_DIR/bedfilter_detect_retro.sh no_duplicates.bed 	#	Do any of the sites intersect with annotations? 
echo "########################################################"
echo "########################################################"
echo "###	Time to check comparative primatology"
echo "########################################################"

##	blat $DATA_DIR/musmus.GRCm38.fa precleaned_ORFs.fa mouseCompare.blatted.psl;


blat $DATA_DIR/chimp/panTro4.fa precleaned_ORFs.fa chimpCompare.blatted.psl 	#	BLAT vs. chimp
echo "###	*	BLAT vs. chimp"
blat $DATA_DIR/gorilla/gorGor3.fa precleaned_ORFs.fa gorillaCompare.blatted.psl #	BLAT vs. gorilla
echo "###	*	BLAT vs. gorilla"
echo "###	scanning comparative primatology results, excluding hits with clear homology to a coding sequence..."
total_regions=$(grep -c comp precleaned_ORFs.fa );
loop_num=0;
for assembly in $( grep ">" precleaned_ORFs.fa | cut -f 2 -d ">" ); do #	going to take all the candidates thusfar, see who's in chimp/gorilla
 	numhits_pan=$(grep -c $assembly chimpCompare.blatted.psl);
 	numhits_gor=$(grep -c $assembly gorillaCompare.blatted.psl);
 #	numhits_mus=$(grep -c $assembly mouseCompare.blatted.psl );	

 	if [ $numhits_pan -eq 0  -a $numhits_gor -eq 0 ]; then
 		echo $assembly  >> unseen_in_pan_and_gor.list; 
	elif [ $numhits_pan -gt 0 -a $numhits_gor -eq 0 ]; then
		echo $assembly  >> unseen_in_gor.list;
		grep $assembly chimpCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > chimphit.psl.temp ; #	write the PSL lines from the chimp blat to a temp file
		python $SCRIPT_DIR/ORFome_puzzler.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp;
	elif [ $numhits_pan -eq 0 -a $numhits_gor -gt 0 ]; then
		echo $assembly  >> unseen_in_pan.list;
 		grep $assembly gorillaCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > gorillahit.psl.temp #	remove wonky chromomomes. same with gorilla. 
		python $SCRIPT_DIR/ORFome_puzzler.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla;
	else 
 		grep $assembly chimpCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > chimphit.psl.temp #	write the PSL lines from the chimp blat to a temp file
 		grep $assembly gorillaCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > gorillahit.psl.temp #	remove wonky chromomomes. same with gorilla. 
#        python $SCRIPT_DIR/blatcheck_compprim.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp; 					#	Do a check to make try and determine if the homologous sequence
#        python $SCRIPT_DIR/blatcheck_compprim.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla; 				#	is an ORF
		python $SCRIPT_DIR/ORFome_puzzler.py chimphit.psl.temp $DATA_DIR/chimp/panTro4.fa chimp;
		python $SCRIPT_DIR/ORFome_puzzler.py gorillahit.psl.temp $DATA_DIR/gorilla/gorGor3.fa gorilla;
	fi;

 	if [ $numhits_mus -eq 0 ]; then
 		echo $assembly  >> unseen_in_mus.list; 	
 	else
 		grep $assembly mouseCompare.blatted.psl| grep chr[1-9,X,Y,M][0-9,A,B]*"\s" | sort -k1,1 -r -g | head -n1 > mousehit.psl.temp
 		python $SCRIPT_DIR/ORFome_puzzler.py chimphit.psl.temp $DATA_DIR/musmus.GRCm38.fa mouse;
 	fi;

 	let loopnum+=1;
 	if [[ $((loopnum%10)) -eq 0 ]]; then echo "Site $loopnum of $total_regions checked!"; fi
 	rm *.temp
done;
fi
#cut -f 1 broken_in_chimp.log > broken_in_chimp.list
#cut -f 1 broken_in_gorilla.log > broken_in_gorilla.list
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






