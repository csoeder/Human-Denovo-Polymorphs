#!/bin/sh
SCRIPT_DIR='/netscr/csoeder/1kGen/data-scrape'
#############################################
#	Load config								#
source $SCRIPT_DIR/pipeline_config.sh					#
#############################################
filter=$1	#	to select a subset of individuals - usually HG or NA
#############################################

echo "w00tw00t we're piping" | write csoeder

for folder in $( cut -f 1 $SCRIPT_DIR/dwnld_list.txt | grep -v Source | grep $filter | sort | uniq`; do
	echo "$folder queued" | write csoeder;
	sh  $SCRIPT_DIR/pipeline.sh $folder > redirect_$folder.out;
	echo "$folder submitted" | write csoeder;
	sleep $SUBMISSION_DELAY;
done




