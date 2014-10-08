from subprocess import call, check_output
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Blast.Applications import NcbiblastxCommandline, NcbiblastnCommandline
from Bio.Seq import Seq
import re
import os
import sys


filein = sys.argv[1]


handle = SeqIO.parse(filein, "fasta")
count = 0
while 1:
	try:

		record = handle.next()
		SeqIO.write([record], 'temp.fa', 'fasta')
#		blastx_cline = NcbiblastxCommandline(query="temp.fa", db="/netscr/csoeder/1kGen/data/blastdb/hg19", outfmt=7, 
#out="BLASTs/blasted%i.tbl"%count)#evalue=0.001
		#blastx_cline = NcbiblastnCommandline(query="temp.fa", 
#db="/netscr/csoeder/1kGen/data/blastdb/hg19", outfmt=7,out="BLASTs/blasted%i.tbl"%count, 
#evalue=0.001)
		blastx_cline = NcbiblastxCommandline(query="temp.fa", db="/nas02/data/blast/pdbaa", outfmt=7, out="BLASTs/blasted%i.tbl"%count)#evalue=0.001
		stdout, stderr = blastx_cline()

		call(['rm', 'temp.fa'])
		count += 1

	except StopIteration:
		break










