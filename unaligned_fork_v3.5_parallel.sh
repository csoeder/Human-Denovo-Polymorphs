#!/bin/sh

#############################################
#Load relevant modules 						#
#. /nas02/apps/Modules/default/init/bash		#
#module load python/2.7.1 					#
#module load bedtools 						#
#module load samtools 						#
#module load blast 							#
#module load blat 							#
#module load bedops 							#
#module load bowtie 							#
#module load bwa 							#
#############################################

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the SAM file of unaligned Trinity assemblies
#	$2 is the BAM file of mapspliced RNA-Seq reads 
#	$3 is the indexed FASTA of Trinity assemblies
#	$4 is the RNA-Seq reads mapped to Trinity
#	$5 is the BED file of mapsliced RNA-Seq reads (faster) - may change this later, with 
#better pipeline or with builtin build from bamtobed $2 
#	$6 is the individual's name


mkdir unmapt
cd unmapt

echo START
date
echo

BATCH_SIZE=200
WAIT_TIME=60


touch clean_assemblies.fa
touch rejects.fa
BUN_NUM=0
COUNTER=0
echo '#!/bin/sh' > bundle_$BUN_NUM.sh

cut -f 1 ../$1 | grep -v "@"| while read assembly;

	do

		while [ -d "$assembly" ]
			do assembly=$(echo $assembly | awk '{print $0"_"}')
		done

		mkdir $assembly
		cd $assembly
		samtools view -hb ../../$4 $assembly > preseed.bam
		cd ..

		echo "cd $assembly" >> bundle_$BUN_NUM.sh
		echo "echo $assembly" >> bundle_$BUN_NUM.sh
		echo "sh $SCRIPT_DIR/unaligned_accumulator_widget_smart.sh $5 $2 $3 $assembly" >> bundle_$BUN_NUM.sh
		echo "cd .." >> bundle_$BUN_NUM.sh
		#echo "rm -rf $assembly" >> bundle_$BUN_NUM.sh

		#bsub -J unalign_grind_$6 -o $assembly.lsf.out sh $SCRIPT_DIR/unaligned_accumulator_widget_smart.sh $5 $2 $3 $assembly

		let COUNTER+=1
		if [ $COUNTER -gt $BATCH_SIZE ]; then let BUN_NUM+=1; echo '#!/bin/sh' > bundle_$BUN_NUM.sh;  COUNTER=0;  fi
	done



for script in `ls | grep .sh`;
		do bsub -J unalign_grind_$6 -o bundle_$BUN_NUM.lsf.out sh bundle_$BUN_NUM.sh; sleep $WAIT_TIME;
	done

bsub -J unalign_grind_$6 -o bundle_$BUN_NUM.lsf.out sh bundle_$BUN_NUM.sh
bsub -K -J chillout -w "done(unalign_grind_$6)" echo 'over and out'

python $SCRIPT_DIR/ORF_extract_v3.py clean_assemblies.fa rough_ORFs.fa
python $SCRIPT_DIR/garbageman_v3.py rough_ORFs.fa precleaned_ORFs.fa





