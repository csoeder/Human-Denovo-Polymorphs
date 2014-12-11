#!/bin/sh

echo "w00tw00t we're piping" | write csoeder

#######
#For a steady submission rate of 3 per hour, which will finish in approx. 1 week
nap_time=800


for folder in `cut -f 1 dwnld_list.txt | grep -v Source | grep $1 | sort | uniq`; do
	echo "$folder queued" | write csoeder;
	sh pipeline_v3.5.sh $folder > redirect_$folder.out;
	echo "$folder submitted" | write csoeder;
	sleep $nap_time;
done




