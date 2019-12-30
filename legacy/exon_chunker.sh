#!/bin/sh
###		A script to break spliced ORFs into exons

SCRIPT_DIR=/netscr/csoeder/1kGen/v3.5
###		Create the place to do it
mkdir chunked_genes
count=0
for gene in `ls BLATs | grep snipt.sortd.clipt`;
	do
		head -n 1 BLATs/$gene > chunked_genes/$count.psl
		echo $(psl2bed < chunked_genes/$count.psl | cut -f 1,2,3,4,5,6 ) 0	0	0,0,0	$(psl2bed < chunked_genes/$count.psl | cut -f 18,19,21 ) | tr ' ' '\t' > chunked_genes/derpy_$count.bed
		#see derpy psl2bed specs here: http://bedops.readthedocs.org/en/latest/content/reference/file-management/conversion/psl2bed.html
		python $SCRIPT_DIR/prechunk_underp.py chunked_genes/derpy_$count.bed chunked_genes/full_$count.bed
		bed12ToBed6 -i chunked_genes/full_$count.bed > chunked_genes/exons_$count.bed
		python $SCRIPT_DIR/transcript_exon_collector.py chunked_genes/$count.psl chunked_genes/$count.transcripts
		let count+=1
	done




