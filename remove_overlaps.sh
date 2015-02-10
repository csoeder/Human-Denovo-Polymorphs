#!/bin/sh
###		A file to remove any chunked genes which overlap an annotation
#############################################################
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
#############################################################
for gene in `ls | grep exon`;	#		for all exons
	do sh $SCRIPT_DIR/bedfilter_detect_retro.sh $gene overlap.bed ;	
	if [[ -s overlap.bed ]]; 	#		If bedfilter detects overlap
		then rm $gene; fi 		#		Trash it
	rm no*.bed 					#		
	rm overlap.bed 				#		Cover your tracks
done


