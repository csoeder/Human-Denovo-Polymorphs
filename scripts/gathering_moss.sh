#!/bin/bash

#use example
#sh scripts/gathering_moss.sh  mapped_reads/mapspliceMulti/HG00099/accumulation/HG00099.blat.mapspliceMulti mapped_reads/mapspliceMulti/HG00099/HG00099.mapspliceMulti.reads.bed "NCBIrefSeq,/proj/cdjones_lab/Genomics_Data_Commons/annotations/homo_sapiens/ncbiRefSeq.hg38.gtf;cmplxRepeat,/proj/cdjones_lab/Genomics_Data_Commons/annotations/homo_sapiens/repeatMasker.complex.hg38.gtf" /proj/cdjones_lab/Genomics_Data_Commons/genomes/homo_sapiens/hg38/hg38.fa.fai

filebase=$1
mapped_reads=$2
annotations=$3 
fai=$4

echo $filebase
echo $mapped_reads
echo $annotations
echo $fai

j=0

echo -e "$j\tSTART\t$(date)\t0\t0"

bedtools subtract -split -a "$filebase".noForbiddenAnnot.footprints.iter.bed  -b "$filebase".noForbiddenAnnot.footprints.init.bed > "$filebase".diff.bed

#the JEHB! one liner 
#https://twitter.com/jehb/status/1255637827745910784
# $ awk '{ split($2,a,","); for (i in a) print $1, a[i], $3; }' test.in


while [ $( cat "$filebase".diff.bed | wc -l) -ne 0 ]; do 

#	echo bang;
	echo -e "$j\tITERDIFF\t$(date)\t$( cat "$filebase".diff.bed | wc -l)\t$(cat "$filebase".diff.bed | awk '{print$3-$2;}' | awk '{sum+=$1;} END {print sum;}')";
#	echo boom;
	cp "$filebase".noForbiddenAnnot.footprints.iter.bed "$filebase".noForbiddenAnnot.footprints.init.bed;
	bedtools intersect -split -sorted -wb -a "$filebase".noForbiddenAnnot.footprints.init.bed -b "$mapped_reads" | cut -f 4,8 | sed -e 's/\/[12]//g' | awk '{ split($1,a,","); for (i in a) print a[i], $2; }' | tr " " "\t"  | sort | uniq > "$filebase".list;
	echo -e "$j\tREADGATH\t$(date)\t0\t0";
	grep -wFf <( cat "$filebase".list | cut -f 2 | sort | uniq ) "$mapped_reads" > "$filebase".footprints.bed;
	echo -e "$j\tFOOTPRINT\t$(date)\t0\t0";
	LANG=en_EN join -1 4 -2 2 <( cat "$filebase".footprints.bed | sed -e 's/\/[12]//g' | LANG=en_EN sort -k 4 ) <( cat "$filebase".list | LANG=en_EN sort -k 2 ) | tr " " "\t" | awk '{print$2,$3,$4,$13,$5,$6,$7,$8,$9,$10,$11,$12}'| tr " " "\t" > "$filebase".footprints.renamed.bed;
	#https://unix.stackexchange.com/questions/12942/join-file-2-not-in-sorted-order
	echo -e "$j\tRENAME\t$(date)\t0\t0";

	megapath=" ";

	for anne in $(echo "$annotations" | tr ";" "\t"); do 
		nom=$(echo "$anne" | cut -f 1 -d ,);
		path=$(echo "$anne" | cut -f 2 -d ,);
		megapath="$megapath $path "
		echo -e "$j\tEGG\t$(date)\t$nom\t0";
		bedtools intersect -split -wa -wb -a "$filebase".footprints.renamed.bed -b "$path" | cut -f 4,21 | tr '"' '\t' | cut -f 1,3  >> "$filebase".badboiz."$nom".list
	done;

	echo -e "$j\tINTERSECTED\t$(date)\t0\t0";

	cat "$filebase".footprints.renamed.bed | bedtools intersect -split -v -a - -b $megapath | bedtools bed12tobed6 -i | sort -k 1,1 -k2,2n | bedtools slop -b 100 -g "$fai" -i -  | bedtools merge -c 4 -o distinct -i - > "$filebase".noForbiddenAnnot.footprints.iter.bed

	echo -e "$j\tFILTERED\t$(date)\t0\t0";

	bedtools subtract -split -a "$filebase".noForbiddenAnnot.footprints.iter.bed  -b "$filebase".noForbiddenAnnot.footprints.init.bed > "$filebase".diff.bed
	cp "$filebase".noForbiddenAnnot.footprints.iter.bed "$filebase".noForbiddenAnnot.footprints.iter"$j".bed
	j=$((j+1));

done;

echo -e "$j\tEND\t$(date)\t0\t0"

