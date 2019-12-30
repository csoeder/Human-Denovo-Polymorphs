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
curr.execute("SELECT id FROM location WHERE location.poly IS TRUE;")
genes = curr.fetchall()
curr.execute("SELECT count(*) FROM person;")
numpeeps = curr.fetchone()[0]

gene_dict = {}
transcribers = []
for find in all_finds:
	if find[3] in gene_dict.keys():
		gene_dict[find[3]] += 1
	else:
		gene_dict[find[3]] = 1
	transcribers.append(find[1])
transcribers=list(set(transcribers))

stats = [min(gene_dict.values()), max(gene_dict.values()), mean(gene_dict.values()), median(gene_dict.values())]
mackses = ''
mins = ''
singletons = 0
for jean in gene_dict:
	if gene_dict[jean] == stats[0]:
		mins = '%s %s,'%tuple([mins, jean])
	elif gene_dict[jean] == stats[1]:
		mackses = '%s %s,'%tuple([mackses, jean])
	if gene_dict[jean] == 1:
		singletons += 1






phial = open('Individuals_per_gene.txt','w')
phial.write('One or more of the %s gene sites were seen expressed in %s individuals, from a total population of %s.\n'%tuple([len(gene_dict.keys()), len(transcribers), numpeeps]))
phial.write('The most commonly expressed gene was %s, observed in %s individuals.\n'%tuple([mackses, stats[1]]))
phial.write('There were %s genes sighted which were seen only in a single individual.\n'%tuple([singletons]))
phial.write('The mean individuals expressing a given gene was %s and the median was %s.\n'%tuple([stats[2], stats[3]]))
phial.close()

plt.hist(gene_dict.values(), bins=stats[1])
plt.xlabel('Individuals per Gene')
plt.ylabel('# Genes')
plt.title('Number of Individuals Expressing a Gene')
plt.savefig('Individuals_per_gene.png')


