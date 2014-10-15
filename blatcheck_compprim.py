'''

A homology detector: given the chimp & gorilla hits from autoblat_compprim.py, 
	can a homologous coding sequence be detected?

	$1	:	BLAT output file (*.psl)
	$2	:	genome to be compared
'''


########################################################
###	Gather toolbox
from subprocess import call, check_output
import os
import re
import sys
from Bio import SeqIO
########################################################

phial  = sys.argv[1]
genome  = sys.argv[1]

index = re.compile('blat(\d*)\w*.psl')	#	what does a BLAT result look like?
number = index.match(item).groups()[0]	#	scrape the ID number
##########################################	Slice and dice...
os.system('sed 1,5d compprimBLATs/%s | grep chr[1-9,X,Y][0-9]*"\s" > compprimBLATs/%s.snipt'%tuple([item, item]))	#remove header; remove chrXXrandomY_blahblahblah hits
os.system('sort -k1,1 -r compprimBLATs/%s.snipt > compprimBLATs/%s.snipt.sortd'%tuple([item, item]))
os.system('head -n1 compprimBLATs/%s.snipt.sortd > compprimBLATs/%s.snipt.sortd.clipt'%tuple([item, item]))

