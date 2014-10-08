#!/bin/sh

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load bedops
#############################################

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the SAM file of mapped Trinity assemblies
#	$2 is the file of MapSpliced RNA-Seq reads
#	$3 is the indexed Trinity FASTA
#	$4 is the individual's identifier

mkdir mapt
cd mapt
echo START
date
echo

touch clean_assemblies.bed
touch rejects.bed


BUN_NUM=0
echo '#!/bin/sh' > bundle_$BUN_NUM.sh

BATCH_SIZE=200
WAIT_TIME=90
COUNTER=0
samtools view ../$1 -Sb | bamToBed -bed12 -i - | while read line;



	do 
                chrom=$(echo $line | cut -f1 -d' ')
                start=$(echo $line | cut -f2 -d' ')
                stop=$(echo $line | cut -f3 -d' ')
		comp=$(echo $line | cut -f4 -d' ')

		while [ -d "$comp" ]
			do comp=$(echo $comp | awk '{print $0"_"}')
		done

		mkdir $comp
		cd $comp
		samtools view -b ../../$2 $chrom:$start-$stop | bamToBed -bed12 -i - > temp.bed
		echo $line | tr ' ' '\t' > curly.bed
		cd ..

		echo "cd $comp" >> bundle_$BUN_NUM.sh
		echo "echo $comp" >> bundle_$BUN_NUM.sh
		echo "sh $SCRIPT_DIR/aligned_accumulator_widget_smart.sh $2 $comp" >> bundle_$BUN_NUM.sh
		echo "cd .." >> bundle_$BUN_NUM.sh 
		echo "rm -rf $comp" >> bundle_$BUN_NUM.sh

		#echo $BUN_NUM
		let COUNTER+=1

		if [ $COUNTER -gt $BATCH_SIZE ]; then let BUN_NUM+=1 ; echo '#!/bin/sh' > bundle_$BUN_NUM.sh; COUNTER=0; fi

	done



for script in `ls | grep -v lsf | grep .sh`; 

		do bsub -J align_grind_$4 -o $script.lsf.out sh $script; sleep $WAIT_TIME;

	done

#bsub -J align_grind_$4 -o bundle_$BUN_NUM.lsf.out sh bundle_$BUN_NUM.sh
#bsub -K -J chillout -w "done(align_grind_$4)" echo 'over and out'

while [ bjobs -w | grep align_grind_$4 | wc -l -gt 0 ]

		do sleep 60;

	done


touch clean_assemblies.fa
echo ASSEMBLE
date
cut -f4 clean_assemblies.bed | while read assembly;
	do 

	samtools faidx ../$3 $assembly >> clean_assemblies.fa

	done




python $SCRIPT_DIR/ORF_extract_v3.py clean_assemblies.fa rough_ORFs.fa
python $SCRIPT_DIR/garbageman_v3.py rough_ORFs.fa precleaned_ORFs.fa

mkdir BLASTs

####pool the precleaned ORFs from aligned & unaligned Trinities and blast/unblast them together?
python $SCRIPT_DIR/blaster_v3.py precleaned_ORFs.fa
python $SCRIPT_DIR/unblaster_v3.py
python $SCRIPT_DIR/autoblat.py Transcriptome_ORFs.fa
rm BLATs/*.fa
python $SCRIPT_DIR/blatcheck.py 
sh $SCRIPT_DIR/exon_chunker.sh
cd chunked_genes
sh $SCRIPT_DIR/remove_overlaps.sh




echo DONE
date
echo
