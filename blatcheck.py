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
index = re.compile('blat(\d*).psl')	#	what does a BLAT result look like?
listing = os.listdir('BLATs')		#	Gather the BLAT results
for item in listing:	#		For each one...
	number = index.match(item).groups()[0]	#	scrape the ID number
	call(['touch', 'BLATs/%s.snipt'%item])	#	Slice and dice...
	os.system('sed 1,5d BLATs/%s > BLATs/%s.snipt'%tuple([item, item]))
	os.system('sort -k1,1 -r BLATs/%s.snipt > BLATs/%s.snipt.sortd'%tuple([item, item]))
	os.system('head -n3 BLATs/%s.snipt.sortd > BLATs/%s.snipt.sortd.clipt'%tuple([item, item]))

	r1, r2 = 0, 0	#	The ratios between successive lines of the BLAT results
	try:			#
		scores = []
		with open('BLATs/%s.snipt.sortd.clipt'%item, 'rb') as csvfile:
			spamreader = csv.reader(csvfile, delimiter='\t')
			for row in spamreader:
				scores.append(float(row[0]))
		r1, r2 = scores[1]/scores[0], scores[2]/scores[1]
	except IndexError:
		pass
	########################################################
	if r1 < 0.75 or r2 < 0.75:#if there is a "step-down" in score values
		pass	#	Fuggedaboddit
	else:		#	Get rid of that nonsense
		call(['rm', "BLATs/%s"%item])
		call(['rm', "BLATs/%s.snipt"%item])
		call(['rm', "BLATs/%s.snipt.sortd"%item])
		call(['rm', "BLATs/%s.snipt.sortd.clipt"%item])
	########################################################
########################################################