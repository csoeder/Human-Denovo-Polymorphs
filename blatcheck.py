'''
A script for the processing of BLAT results - discard hits with many duplicates
'''
########################################################
###	Gather tools
from subprocess import call, check_output
import os
import re
import time
import csv
import re
import sys
from Bio import SeqIO
########################################################
#index = re.compile('blat(\d*).psl')	#	what does a BLAT result look like?
#listing = os.listdir('BLATs')		#	Gather the BLAT results

PSL_IN = sys.argv[1]

with open(PSL_IN,'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	row1 = spamreader.next()
	numhits1 = float(row1[0])	#how many matches did the alignment get?
	numtargets = float(row[10])	#how many matches were there to get?
	row2 = spamreader.next()
	numhits2 = float(row2[0])

	if numhits1/numtargets > 0.9:	# if the top score is a legit hit, not a partial one
		if numhits2/numhits1 < 0.75: #	If there is a big step-down, 
			phial = open('cleared_sequence.psl.temp', 'w')
			phial.write('%s\t'*len(row1)%tuple(row1))	#then it's actually ok; write it!
			phial.close()
		else:	#		If there's no step down, take note
			phial = open('genome_duplicates.list', 'a')
			phial.write('%s\n'%tuple([row1[9]]))
			phial.close()
	else: #			If it doesn't show up in BLAT (wtf) take note
		phial = open('fragmentary_blathits.list', 'a')
		phial.write('%s\n'%tuple([row1[9]]))
		phial.close()

