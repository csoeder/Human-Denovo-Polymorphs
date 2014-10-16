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
number = sys.argv[1]	#	The FASTA to be crunched
callsign = sys.argv[2]
########################################################
call(['bsub', '-J', 'BLAT_pan_%s'%callsign, '-o', 'compprimBLATs/blat%s_pan.lsf.out'%number, 'blat', '%s/chimp/panTro4.fa'%DATA_DIR,'compprimBLATs/temp%s.fa'%number,  'compprimBLATs/pan_blat%s.psl'%number ])
call(['bsub', '-J', 'BLAT_gor_%s'%callsign, '-o', 'compprimBLATs/blat%s_gor.lsf.out'%number, 'blat', '%s/gorilla/gorGor3.fa'%DATA_DIR, 'compprimBLATs/temp%s.fa'%number,  'compprimBLATs/gor_blat%s.psl'%number ])
#	call (['blat', '/netscr/csoeder/1kGen/data/hg19.fa', 'BLATs/temp%s.fa'%n, 'BLATs/blat%s.psl'%n])





