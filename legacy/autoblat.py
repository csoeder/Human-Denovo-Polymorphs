'''
Automatically BLATs a single file vs. hg19
'''
########################################################
###	Gather toolbox
from subprocess import call, check_output
import os
import re
import sys
from Bio import SeqIO
########################################################
filein = sys.argv[1]	#	The FASTA to be crunched
os.mkdir('BLATs')		#	Open up the folder for output
########################################################
parser = SeqIO.parse(filein, 'fasta')	#	Parse the FASTA
n=0										#	Initialize the count
for rec in parser:						#	For each record in the FASTA...
	SeqIO.write([rec], open('BLATs/temp%s.fa'%n, 'w'), "fasta")	#	Write it.
	call (['blat', '/netscr/csoeder/1kGen/data/hg19.fa', 'BLATs/temp%s.fa'%n, 'BLATs/blat%s.psl'%n])
	n+=1 								#	BLAT it, then increment the count
