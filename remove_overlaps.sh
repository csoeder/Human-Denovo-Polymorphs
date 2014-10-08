#!/bin/sh

SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

for gene in `ls | grep exon`;

	do sh $SCRIPT_DIR/bedfilter_detect.sh $gene overlap.bed ;
	if [[ -s overlap.bed ]]; 
		then rm $gene; fi
	rm no*.bed
	rm overlap.bed 

done


