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

curr.execute("SELECT id, source, seq, loc FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT id, chrom, start, stop FROM location;")
all_places = curr.fetchall()
curr.execute("SELECT pk, id, sex, pop FROM person;")
all_peeps = curr.fetchall()
transcriber_ids = []
for find in all_finds:
	transcriber_ids.append(find[1])
transcriber_ids = list(set(transcriber_ids))
for thing in transcriber_ids:
	curr.execute("SELECT pk, id, sex, pop FROM person where id=%s;"%thing)
trascribers = curr.fetchall()


phial = open('genelist.dat', 'w')
phial.write('A list of genes observed in the database.')
phial.write('#\tChromosome\tStart\tStop\n')
for place in all_places:
	phial.write('%s\t%s\t%s\t%s\n'%tuple(place))
phial.close()

phial = open('Basic_Facts.txt','w')
phial.write('%s\n'%'~'*50)


phial.write('Transcriptome measurements, processed through the pipeline, were collected from %s individuals. Of these, %s (%s\%) were observed transcribing at least one polymorphic de novo gene.\n'%tuple(len(all_peeps), len(transcribers),  len(transcribers)*100./len(all_peeps) ))
pop_dict = {}
sex_dict = {'M':0, 'F':0}
for person in all_peeps:
	sex_dict[person[2]] +=1
	if person[3] in pop_dict.keys():
		pop_dict[person[3]] +=1
	else:
		pop_dict[person[3]] = 1
phial.write('These %s included the following populations:'%len(all_peeps))
for key in pop_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, pop_dict[key]]))
phial.write('\nand the following sex distribution:\n')
for key in sex_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, sex_dict[key]]))
phial.write('The %s transcribers included the following populations:'%len(transcribers))
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
