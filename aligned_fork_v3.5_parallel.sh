#!/bin/sh

#############################################
#	Load relevant modules 					#
. /nas02/apps/Modules/default/init/bash		#
module load bedops							#
#############################################
#	Load config								#
source pipeline_config.sh					#
#############################################
#	$1 is the SAM file of mapped Trinity assemblies
#	$2 is the file of MapSpliced RNA-Seq reads
#	$3 is the indexed Trinity FASTA
#	$4 is the individual's identifier


samtools view -hSb $1 | samtools sort -f - $4_Assemblies_mapped.sort.bam
bedtools intersect -split -v -abam $4_Assemblies_mapped.sort.bam -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/repeatmasker.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed1.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed2.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/retroposed3.bed | bedtools intersect -split -v -abam stdin -b $DATA_DIR/yalepseudo.bed > $4_ILS_anomalies.bam
samtools sort -f $4_ILS_anomalies.bam $4_ILS_anomalies.sort.bam

mkdir mapt
cd mapt

date
echo "$4 is being align-forked"


###############################################################
# bundle parameters############################################
BUN_NUM=0 #		The first bundle is number zero
COUNTER=0 #		Nothing in the present bundle
###############################################################
###	Where shall we keep our output? ###########################
touch clean_assemblies.bed
touch rejects.bed
###############################################################
echo '#!/bin/sh' > bundle_$BUN_NUM.sh # 	The bundle is a script
###############################################################
###	Begin laying down data, script bundles to handle it. ######
###############################################################
bamToBed -bed12 -i ../$4_ILS_anomalies.sort.bam | while read line;
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
		mkdir $comp
		cd $comp
		echo $line | tr ' ' '\t' > curly.bed		
		samtools view -b ../../$2 $chrom:$start-$stop | bamToBed  -bed12 -i - | bedtools intersect -split -a stdin -b curly.bed > temp.bed
#		sh $SCRIPT_DIR/bedfilter_detect.sh temp.bed overlap.bed
		cd ..

		### Lay down the script ########################################################
		echo "cd $comp" >> bundle_$BUN_NUM.sh 		#	push
		echo "echo $comp" >> bundle_$BUN_NUM.sh 	#	ohai
		echo "sh $SCRIPT_DIR/aligned_accumulator_widget_smart.sh $2 $comp" >> bundle_$BUN_NUM.sh #	go
		echo "cd .." >> bundle_$BUN_NUM.sh 			#	pop
		echo "rm -rf $comp" >> bundle_$BUN_NUM.sh 	#	EXTERMINATE
		################################################################################
		let COUNTER+=1 #					Next!

		###	If the bundle is full, then start a new one! ################################
		if [ $COUNTER -gt $BATCH_SIZE ]; then let BUN_NUM+=1 ; echo '#!/bin/sh' > bundle_$BUN_NUM.sh; COUNTER=0; fi
	done
########################################################
###	Now run the scripts ################################
for script in `ls | grep -v lsf | grep .sh`;
		#		submit the job, wait a while, repeat...
		do bsub -J align_grind_$4 -o $script.lsf.out -q week sh $script; sleep $WAIT_TIME;
	done
########################################################
###	Chill out until the jobs are all done ##############
while [ `bjobs -w | grep align_grind_$4 | wc -l` -gt 0 ]
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
	samtools faidx ../$3 $assembly >> clean_assemblies.fa #	put it in a new file!
	done
########################################################
###	Pull all ORFs out of these OK'd assemblies
python $SCRIPT_DIR/ORF_extract_v3.py clean_assemblies.fa rough_ORFs.fa
###	And then process them; in particular for length
python $SCRIPT_DIR/garbageman_v3.py rough_ORFs.fa precleaned_ORFs.fa
########################################################
###	BLAST!
mkdir BLASTs
###	Blast the ORFs to make sure they're not known proteins
python $SCRIPT_DIR/blaster_v3.py precleaned_ORFs.fa
###	Collect the results
python $SCRIPT_DIR/unblaster_v3.py
########################################################
###	Realign the ORFs with BLAT
python $SCRIPT_DIR/autoblat.py Transcriptome_ORFs.fa
rm BLATs/*.fa
########################################################
###	Pull out those with many genomic duplicates
python $SCRIPT_DIR/blatcheck.py 
########################################################
###	chunk any spliced ORFs into exons
sh $SCRIPT_DIR/exon_chunker.sh
cd chunked_genes
###	last-minute cleanup >.>
sh $SCRIPT_DIR/remove_overlaps.sh
########################################################

mkdir compprimBLATs
for candidate in `ls | grep exon`; do
        num=$(echo $candidate | cut -f 2 -d '_' |cut -f 1 -d '.');
        region=$(head -n 1 exons_$num.bed | cut -f 4);
        echo $region is the best!
        samtools faidx ../../Trinity_files.Trinity.fasta $region > compprimBLATs/temp_$num.fa
        python $SCRIPT_DIR/autoblat_compprim.py $num $4;
done

while [ `bjobs -w | grep BLAT_pan_$4 | wc -l` -gt 0 ] && [ `bjobs -w | grep BLAT_gor_$4 | wc -l` -gt 0 ]
                do echo "chillin...";
                sleep 60;
done

mkdir primate_homologs
for candidate in `ls | grep exon`; do
        num=$(echo $candidate | cut -f 2 -d '_' |cut -f 1 -d '.');
        python $SCRIPT_DIR/blatcheck_compprim.py pan_blat$num.psl $DATA_DIR/chimp/panTro4.fa
        python $SCRIPT_DIR/blatcheck_compprim.py gor_blat$num.psl $DATA_DIR/gorilla/gorGor3.fa
done

mkdir deNovos
for candidate in `ls | grep exon`; do
        if [ ! -e  primate_homologs/$candidate ];
                then cp $candidate deNovos/
        fi

done

mkdir ~/Denovo_Candidates/$4/
cp deNovos/* ~/Denovo_Candidates/$4/


echo DONE
date
echo
