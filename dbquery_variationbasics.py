
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from subprocess import call, check_output
import vcf

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr= conn.cursor()

curr.execute("SELECT find_pk, source, seq, loc FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT location_pk, chrom, start, stop FROM location WHERE location.poly IS TRUE and handchecked IS TRUE;") #	add handchecked = True clause?
all_places = curr.fetchall()
curr.execute("SELECT person_pk, person_name, sex, pop FROM person;")
all_peeps = curr.fetchall()
transcriber_ids = []
for find in all_finds:
	transcriber_ids.append(find[1])
transcriber_ids = list(set(transcriber_ids))


phial = open('Variation_Background.txt','w')
phial.write('%s%s'%tuple(['%s'%'~'*50, '\n']))


phial.write('These %s included the following populations:\n'%len(all_peeps))
for key in pop_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, pop_dict[key]]))
phial.write('\nand the following sex distribution:\n')
for key in sex_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, sex_dict[key]]))
