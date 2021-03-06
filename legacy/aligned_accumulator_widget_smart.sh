#!/bin/sh
DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the mapsplice BAM file
#	$2 is the name of the assembly being accumulated

HOMEBASE=$( pwd | awk -F "mapt" '{print $1}')mapt	#	keep track of the uppermost folder for this mess

date1=$(date +"%s")
cp temp.bed shemp.bed

#Gather the Accumulation - use smart_churn!

if [ -s shemp.bed ]; then	#	If there's data in the file; ie, it's nonempty
	cp shemp.bed new.bed
	sh $SCRIPT_DIR/churning_smart.sh $1

	if [[ ! -s overlap.bed ]]; then 	#	if there is no overlap detected between the Accumulation and annotations
		head curly.bed >> $HOMEBASE/clean_assemblies.bed #	then add it to the clean assemblies
		flag="PASS"
	else	#								otherwise,
		head curly.bed >> $HOMEBASE/rejects.bed #	"Rejected", by Don Hertzfeldt
		flag="FAIL"
	fi

else						#	Flag all empties
	flag="MT";
fi

date2=$(date +"%s")	#	Log your Productivity
diff=$(($date2-$date1)) #	in tick.tock
echo "$2   $(($diff / 60))m   $(($diff % 60))s   $flag" >> $HOMEBASE/tick.tock
echo "$2 Accumulated!"
