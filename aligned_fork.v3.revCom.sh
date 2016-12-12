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


mkdir revComp
cd revComp

for assembly in $(cut -f 4 ../"$IDENTIFIER"_blatAlign.goodAlign.ILS_anomalies.bed.derpy | sort | uniq); do samtools faidx ../$TRINITY_FASTA $assembly >> clean_assemblies.fa ; done 
fasta_formatter -i clean_assemblies.fa -w 0 | fastx_reverse_complement | sed 's/>c/>revComp_c/g' > clean_assemblies.revComp.fa

echo "########################################################"
echo "###	Pull all ORFs out of these OK'd assemblies"
python $SCRIPT_DIR/ORF_extract.py clean_assemblies.revComp.fa rough_ORFs.fa
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

 	let loopnum+=1;
 	if [[ $((loopnum%10)) -eq 0 ]]; then echo "Site $loopnum of $total_regions checked!"; fi
 	rm *.temp
done;
#cut -f 1 broken_in_chimp.log > broken_in_chimp.list
#cut -f 1 broken_in_gorilla.log > broken_in_gorilla.list
echo "###	... done!"
echo "########################################################"
echo "#	Data ready for database upload!"
echo "########################################################"

