#!/bin/sh
#Check each gene to make sure it's not on the blacklist!

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load bedtools						#
#############################################

here=$(pwd)

for folder in `ls | grep HG | grep -v redirect`; do #For each individual...
	cd $folder/mapt/chunked_genes/deNovos/
	for file in `ls | grep -v blklst`; do
		bedtools intersect -v -a $file -b $here/blk.lst > $file.blklst;
		#	Pull out every element of $file which does not overlap a blacklisted site
		if [[ -s $file.blklst ]]; then #	If this is empty, there's overlap. 
			mv $file ../primate_homologs/
		fi
	done; 
	rm *.blklst #	Cleanup
	cd $here 	#	GTFO, next folder.
done











