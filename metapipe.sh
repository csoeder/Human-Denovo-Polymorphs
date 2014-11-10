#!/bin/sh


#######
#For a steady submission rate of 3 per hour, which will finish in approx. 1 week
nap_time=1200

for folder in `cut -f 1 dwnld_list.txt | grep -v Source | sort | uniq`; do
	sh pipeline_v3.5.sh $folder > redirect_$folder.out;
	sleep $nap_time;
done




