#!/bin/sh


DATA_DIR='/nas02/home/c/s/csoeder/1kGen_data'

touch lookback_bins.dat

while read line
do
    pk=$( cut -f 4 line)

	touch review.bed;

	for person in $(tail -n +2 dwnld_list.txt| cut -f 1 | sort | uniq );
		do echo $person;
		transcript=$(grep -P "^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t$a\t" $person/$person_lookback.bed | cut -f 1);
		grep $transcript $person_Assemblies_mapped.bed >> review.bed;
	done;

	bedtools intersect -split -a review.bed -b $DATA_DIR/repeatmasker.bed > no_rpts.bed;				#
	bedtools intersect -split -a review.bed -b $DATA_DIR/UCSC_genes.bed > no_genes.bed;
	bedtools intersect -split -a review.bed -b $DATA_DIR/refSeq_genes.bed >> no_genes.bed;

	if [[ -s no_rpts.bed ]]; then
		echo "$pk\tREPEAT\n" >> lookback_bins.dat
	elif [[ -s no_genes.bed ]]; then
		echo "$pk\tGENE\n" >> lookback_bins.dat
	else
		echo "$pk\tCLEAN\n" >> lookback_bins.dat
	fi

	rm review.bed;
	rm no_rpts.bed;
	nm no_genes.bed;

done < lookback_report.dat



#	^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t230\t
#	grep -P "^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t$a\t" HG00096_lookback.bed