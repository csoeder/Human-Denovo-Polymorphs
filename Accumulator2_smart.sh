#!/bin/sh

DATA_DIR='/netscr/csoeder/1kGen/data'
SCRIPT_DIR='/netscr/csoeder/1kGen/v3.5'

#	$1 is the seed file
#	$2 is the BAM file of mapspliced reads

cp $1 new.bed #	the seed file is the first file to be considered
sh $SCRIPT_DIR/churning_smart.sh $2	#	use mapspliced reads to churn

