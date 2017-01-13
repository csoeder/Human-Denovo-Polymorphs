#!/bin/sh

chrom=$1
start=$2
stop=$3
xml_in=$4
commands_out="$5".script
snapshotDir=/netscr/csoeder/1kGen/snapshot_directory_v4_up/
sessionDir=/netscr/csoeder/1kGen/XMLpath_v4_up/

echo "this: " $commands_out
touch $commands_out
echo "load $sessionDir$xml_in.xml" >> $commands_out
echo "snapshotDirectory $snapshotDir" >> $commands_out
#echo "genome hg19" >> $commands_out
echo "goto $chrom:$start-$stop" >> $commands_out
echo "snapshot "$xml_in".png" >> $commands_out
echo "new" >> $commands_out

