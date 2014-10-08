
from subprocess import call, check_output

import os
import re
import time
import csv
import re
import sys
from Bio import SeqIO
#import psycopg2


#conn = psycopg2.connect("dbname=testdb user=postgres password=password")
#conn = psycopg2.connect("dbname=denovogenes user=gene password=den0V0jeandata host=bioapps.its.unc.edu")
#curr = conn.cursor()



filein = sys.argv[1]
os.mkdir('BLATs')

parser = SeqIO.parse(filein, 'fasta')

n=0
for rec in parser:
	SeqIO.write([rec], open('BLATs/temp%s.fa'%n, 'w'), "fasta")
	call (['blat', '/netscr/csoeder/1kGen/data/hg19.fa', 'BLATs/temp%s.fa'%n, 'BLATs/blat%s.psl'%n])
	n+=1






