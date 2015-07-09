###
#	A script to pull consolidated database infor into BED files, sequences into FASTA files, etc
#	So that they may be analyzed with misc. tools

import psycopg2
import sys
import os
from numpy import mean
import csv
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import pysam
import numpy as np
from subprocess import call, check_output
from time import sleep
import pickle

script_path='/netscr/csoeder/1kGen/query-process/'
working_path='/netscr/csoeder/1kGen/individuals/'
data_path='/netscr/csoeder/1kGen/data/'

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

###	0	:	DBpull

curr.execute("SELECT location_pk, chrom, start, stop, canon_seq FROM location;")
all_places = curr.fetchall()
#curr.execute("SELECT id, source, loc, seq FROM find;")
#all_finds = curr.fetchall()



bedfile = open('genome_locations.bed','w')
for location in all_places:
	bedfile.write('%s\t%s\t%s\t%s\n'%tuple([location[1], int(location[2]+1), location[3], location[0]]))
bedfile.close()


fastafile = open('canonical_sequences.fasta', 'w')
for location in all_places:
	curr.execute("SELECT seq FROM sequence WHERE sequence.sequence_pk = %s;"%tuple([location[4]]))
	cannon_seq = curr.fetchone()[0]
	fastafile.write('>%s\n'%tuple([location[0]]))
	fastafile.write('%s\n'%tuple([cannon_seq]))
fastafile.close()








