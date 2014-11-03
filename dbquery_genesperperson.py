import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, mean, median
from subprocess import call, check_output
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()



curr.execute("SELECT id, source, seq, loc FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT pk FROM person;")
peeps = curr.fetchall()
curr.execute("SELECT count(*) FROM location;")
numjeanz = curr.fetchone()[0]

person_dict = {}
for d00d in peeps:
	person_dict[d00d[0]] =0
for find in all_finds:
	if find[1] in person_dict.keys():
		person_dict[find[1]] += 1
stats = [max(person_dict.values()), mean(person_dict.values()), median(person_dict.values())]
mackses = ''
for d00d in person_dict:
	if person_dict[d00d] == stats[0]:
		mackses = '%s %s,'%tuple([mackses, d00d])

phial = open('Genes_per_person.txt','w')
phial.write('The %s genes found were distributed across %s individuals.'%tuple([numjeanz, len(person_dict.keys())]))
phial.write('Of these %s people investigated, %s had no polymorphic denovo genes detected.'%tuple([len(person_dict.keys()), person_dict.values().count(0)]))
phial.write('The most genes detected in an individual was %s, in %s'%tuple([stats[0], mackses]))
phial.write('The mean genes sighted per individual was %s; the median was %s.'%tuple([stats[1], stats[2]]))
phial.close()

plt.hist(person_dict.values(), bins=stats[0])
plt.xlabel('Genes per Individual')
plt.ylabel('# Individuals')
plt.title('Polymorphic De Novo Genes per Individual')
plt.savefig('Genes_per_person.png')


