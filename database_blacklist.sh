#!/bin/sh
#Check each gene to make sure it's not on the blacklist!

#############################################
#Load relevant modules 						#
. /nas02/apps/Modules/default/init/bash		#
module load bedtools						#
#############################################

for folder in `ls | grep HG | grep -v redirect`; do #For each individual...
	for file in `ls $folder/mapt/chunked_genes/deNovos/`; do #For each candidate gene...
		bedtools intersect -wa -a blk.lst -b $folder/mapt/chunked_genes/deNovos/$file > overlups.bed; #check for overlaps with the blacklist.
		if [[ -s overlups.bed ]]; then #if there's an overlap, move it out!
			head $folder/mapt/chunked_genes/deNovos/$file
			mv $folder/mapt/chunked_genes/deNovos/$file $folder/mapt/chunked_genes/primate_homologs/$file
		fi
	done; 
done


for folder in `ls | grep NA | grep -v redirect`; do #For each individual...
	for file in `ls $folder/mapt/chunked_genes/deNovos/`; do #For each candidate gene...
		bedtools intersect -wa -a blk.lst -b $folder/mapt/chunked_genes/deNovos/$file > overlups.bed; #check for overlaps with the blacklist.
		if [[ -s overlups.bed ]]; then #if there's an overlap, move it out!
			head $folder/mapt/chunked_genes/deNovos/$file
			mv $folder/mapt/chunked_genes/deNovos/$file $folder/mapt/chunked_genes/primate_homologs/$file
		fi
	done; 
done










