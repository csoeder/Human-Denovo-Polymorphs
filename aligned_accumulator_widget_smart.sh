#!/bin/sh
DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the mapsplice BAM file
#	$2 is the name of the assembly being accumulated


date1=$(date +"%s")
#tr ' ' '\t' < temp.bed > shemp.bed
cp temp.bed shemp.bed
#Gather the Accumulation - use smart_churn!
echo ACCUMULATE
#date
#echo
#ls
#echo

if [ -s shemp.bed ]; then

	sh $SCRIPT_DIR/Accumulator2_smart.sh shemp.bed $1
#echo
#ls
#if there is no overlap detected between the Accumulation and annotations, add it to the clean assemblies
	if [[ ! -s overlap.bed ]]; then
		head curly.bed >> ../clean_assemblies.bed
		flag="PASS"
		echo "w00t pass"
	else
		head curly.bed >> ../rejects.bed
		flag=FAIL
		echo "fuck you"
	fi

else
	flag="MT";

fi


echo $flag
cd ..
#rm -rf $2
date2=$(date +"%s")
diff=$(($date2-$date1))
echo "$2   $(($diff / 60))m   $(($diff % 60))s   $flag" >> tick.tock
flag="DERP"
