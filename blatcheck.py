'''
A script for the processing of BLAT results - discard hits with many duplicates
usage:
	python blatcheck.py PSL_IN
	-> outputs the query name from PSL_IN to the appropriate .list file
'''
########################################################
# Gather tools
from subprocess import call, check_output
import os
import re
import time
import csv
import re
import sys
from Bio import SeqIO
########################################################
# index = re.compile('blat(\d*).psl')	#	what does a BLAT result look like?
# listing = os.listdir('BLATs')		#	Gather the BLAT results

PSL_IN = sys.argv[1]

banned_substrings = ['Un', 'rand', 'hap']  # names of funky chromosomes

with open(PSL_IN, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	rows = list(spamreader)
	goodrows = []
	for rho in rows:
		chr_name = rho[13]
		if any(substring in chr_name for substring in banned_substrings):
			pass
		else:
			goodrows.append(rho)
	try:  # if blatcheck is being run, there *should* be
		#   at least two potential alignments to consider
		row1 = goodrows[0]
		numhits1 = float(row1[0])  		# how many matches did the alignment get?
		numtargets = float(row1[10])  	# how many matches were there to get?
		row2 = goodrows[1]
		numhits2 = float(row2[0])

		if numhits1/numtargets > 0.9:  	# if the top score is a legit hit,
			#  							 not a partial one
			if numhits2/numhits1 < 0.75:  	# If there is a big step-down...
				phial = open('cleared_sequence.psl.temp', 'w')
				phial.write('%s\t'*len(row1) % tuple(row1))  	# then it's ok; write it!
				phial.close()
			else:  	# If there's no step down, take note
				phial = open('genome_duplicates.list', 'a')
				phial.write('%s\n' % tuple([row1[9]]))
				phial.close()
		else:  # If it doesn't show up in BLAT (wtf) take note
			phial = open('fragmentary_blathits.list', 'a')
			phial.write('%s\n' % tuple([row1[9]]))
			phial.close()

	except IndexError:
		# If the try block failed, it's *probably* because the ORF is
		# only sticking to wonky chromosome; annotate it as fragmentary
		phial = open('fragmentary_blathits.list', 'a')
		phial.write('%s\n' % tuple([rows[0][9]]))
		phial.close()
