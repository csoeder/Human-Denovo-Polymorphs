'''
Automatically BLATs a single file vs. gorilla & chimp
'''
########################################################
###	Gather toolbox
from subprocess import call, check_output
import os
import re
import sys
from Bio import SeqIO
DATA_DIR='/netscr/csoeder/1kGen/data'
########################################################
filein = sys.argv[1]	#	The FASTA to be crunched
os.mkdir('compprimBLATs')		#	Open up the folder for output
########################################################
parser = SeqIO.parse(filein, 'fasta')	#	Parse the FASTA
number=0										#	Initialize the count
for rec in parser:						#	For each record in the FASTA...
	SeqIO.write([rec], open('compprimBLATs/temp%s.fa'%number, 'w'), "fasta")	#	Write it.
	call(['bsub', '-J', 'BLAT_%s_pan'%number, '-o', 'compprimBLATs/blat%s_pan.lsf.out'%number, 'blat', '%s/chimp/panTro4.fa'%DATA_DIR,'compprimBLATs/temp%s.fa'%number,  'compprimBLATs/pan_blat%s.psl'%number ])
	call(['bsub', '-J', 'BLAT_%s_gor'%number, '-o', 'compprimBLATs/blat%s_gor.lsf.out'%number, 'blat', '%s/gorilla/gorGor3.fa'%DATA_DIR, 'compprimBLATs/temp%s.fa'%number,  'compprimBLATs/gor_blat%s.psl'%number ])
#	call (['blat', '/netscr/csoeder/1kGen/data/hg19.fa', 'BLATs/temp%s.fa'%n, 'BLATs/blat%s.psl'%n])
	number+=1 								#	BLAT it, then increment the count





