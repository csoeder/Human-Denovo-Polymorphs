#!/bin/sh

#############################################
#	Load config								#
source pipeline_config.sh					#
#############################################
filter=$1	#	to select a subset of individuals - usually HG or NA
#############################################

echo "w00tw00t we're piping" | write csoeder

for folder in `cut -f 1 dwnld_list.txt | grep -v Source | grep $filter | sort | uniq`; do
	echo "$folder queued" | write csoeder;
	sh pipeline_v3.5.sh $folder > redirect_$folder.out;
	echo "$folder submitted" | write csoeder;
	sleep $SUBMISSION_DELAY;
done




