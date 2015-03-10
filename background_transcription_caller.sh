#!/bin/sh
person=$1
###	for an individual subject $person, calculate the per-site depth of coverage on non-
#############################################################
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
source $SCRIPT_DIR/pipeline_config.sh	#################################

cd individuals/"$person"

##	Note the lack of -split flags ... intronic regions aren't considered background at the moment
bedtools intersect -v -abam "$person"_Assemblies_mapped.sort.bam -b $DATA_DIR/UCSC_genes.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/refSeq_genes.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/complicated_repeats.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/retroposed1.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/retroposed2.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/retroposed3.bed | bedtools intersect -v -abam stdin -b $DATA_DIR/yalepseudo.bed | samtools sort "$person"_genomicwasteland.sort
bedtools genomecov -d -ibam "$person"_genomicwasteland.sort.bam -g $DATA_DIR/hg19.genome > background.coverage
cut -f 3 background.coverage | tr '\n' '\t' > "$person"_covlist.csv





