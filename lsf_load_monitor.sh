#!/bin/sh


while :
do
	dee=$(date);
	total=$(bjobs -w | grep -c csoeder);
	running=$(bjobs -w | grep -c RUN);
	pending=$(bjobs -w | grep -c PEND);
	echo -e "$dee\t$total\t$running\t$pending\n" >> lsf.log;
	sleep 300;
done





