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
listing = os.listdir('BLATs')		#	Gather the BLAT results
for item in listing:	#		For each one...
	number = index.match(item).groups()[0]	#	scrape the ID number
	call(['touch', 'BLATs/%s.snipt'%item])	#	Slice and dice...
	os.system('sed 1,5d BLATs/%s | grep chr[1-9,X,Y][0-9]*"\s" > BLATs/%s.snipt'%tuple([item, item]))	#remove header; remove chrXXrandomY_blahblahblah hits
	os.system('sort -k1,1 -r BLATs/%s.snipt > BLATs/%s.snipt.sortd'%tuple([item, item]))
	os.system('head -n1 BLATs/%s.snipt.sortd > BLATs/%s.snipt.sortd.clipt'%tuple([item, item]))

