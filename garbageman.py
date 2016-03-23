'''
Removes ORFs < 75 nt
Usage:
	python garbageman.py Unfiltered_IN.fa Filtered_OUT.fa
'''
########################################################
import sys
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
########################################################
filein = sys.argv[1]  # Unfiltered ORFs
fileout = sys.argv[2]  # Filtered ORFs
########################################################
parser = SeqIO.parse(filein, 'fasta')
rex = []
for rec in parser:
	seek = rec.seq
	if len(seek) > 75:
		rex.append(rec)
SeqIO.write(rex, fileout, 'fasta')
########################################################
