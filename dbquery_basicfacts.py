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
curr.execute("SELECT location_pk, chrom, start, stop FROM location WHERE location.poly IS TRUE and pan_noncoding IS TRUE AND gor_noncoding IS TRUE AND handchecked IS NOT FALSE  AND lookback_clean IS TRUE;") #	add handchecked = True clause?
all_places = curr.fetchall()
curr.execute("SELECT person_pk, person_name, sex, pop FROM person;")
all_peeps = curr.fetchall()
curr.execute("SELECT person_pk, person_name, sex, pop FROM person WHERE rna_seq IS TRUE;")
pipelined=curr.fetchall()
transcriber_ids = []
curr.execute("SELECT person_pk, person_name, sex, pop FROM person WHERE person_pk IN (SELECT source FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE and pan_noncoding IS TRUE AND gor_noncoding IS TRUE AND lookback_clean IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE));")
transcribers=curr.fetchall()


phial = open('genelist.dat', 'w')
phial.write('A list of genes observed in the database.\n')
phial.write('primary_key\tChromosome\tStart\tStop\n')
for place in all_places:
	phial.write('%s\t%s\t%s\t%s\n'%tuple(place))
phial.close()

phial = open('Basic_Facts.txt','w')
phial.write('%s%s'%tuple(['%s'%'~'*50, '\n']))


phial.write('Transcriptome measurements, processed through the pipeline, were collected from %s individuals.'%tuple([len(pipelined)]))#	change this
phial.write(' Of these, %s (%s percent) were observed transcribing at least one polymorphic de novo gene.\n'%tuple([len(transcribers),  len(transcribers)*100./len(pipelined)])) # change this
pop_dict = {}
sex_dict = {'M':0, 'F':0}
for person in pipelined:
	sex_dict[person[2]] +=1
	if person[3] in pop_dict.keys():
		pop_dict[person[3]] +=1
	else:
		pop_dict[person[3]] = 1
phial.write('These %s included the following populations:\n'%len(pipelined))
for key in pop_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, pop_dict[key]]))
phial.write('\nand the following sex distribution:\n')
for key in sex_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, sex_dict[key]]))
phial.write('The %s transcribers included the following populations:\n'%len(transcribers))
pop_dict = {}
sex_dict = {'M':0, 'F':0}
for person in transcribers:
	sex_dict[person[2]] +=1
	if person[3] in pop_dict.keys():
		pop_dict[person[3]] +=1
	else:
		pop_dict[person[3]] = 1
for key in pop_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, pop_dict[key]]))
phial.write('\nand the following sex distribution:\n')
for key in sex_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, sex_dict[key]]))

phial.write('\n')
phial.close()

###########
#	ADD VCF DATUMZ

conn.commit()
curr.close()
conn.close()
