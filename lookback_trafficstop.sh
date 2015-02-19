#!/bin/sh


DATA_DIR='/netscr/csoeder/1kGen/data'

touch lookback_bins.dat

while read line; do

	pk=$( echo $line | cut -f 4 -d ' ')

	touch review.dat;
	echo $line, $pk
	for person in $( ls individuals );
		do	echo $person;	#	This following regex command looks for $pk specifically in the QNAME column of a BEDfile
		transcript=$(grep -P "^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t$pk\t" individuals/"$person"/"$person"_lookback.bed | cut -f 1);	#	find the transcript which the sequence stuck to
		grep "$transcript" individuals/"$person"/mapt/rejects.bed | cut -f 2 >> review.dat #	Look for it in the rejects.bed file; move the flag to review
	done;

	sort review.dat | uniq > flags.dat 	#	collect any flags found across all individuals

	flags=''
	while read flag; do
		flags='"$flags","$flag"';
	done < flags.dat 	#	concatenate flags into a single string


	if [[ -s review.dat ]]; then
		echo -e "$pk\tCLEAN\n" >> lookback_bins.dat #	Unflagged hits are "clean"
	else
		echo -e "$pk\t$flags\n" >> lookback_bins.dat #	Otherwise, make note
	fi

	rm review.dat;

done < lookback_report.dat 



#	^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t230\t
#	grep -P "^[a-zA-Z0-9_]*\t[0-9]*\t[0-9]*\t$a\t" HG00096_lookback.bed
