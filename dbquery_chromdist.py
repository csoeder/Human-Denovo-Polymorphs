import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange
from subprocess import call, check_output
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()
curr.execute('SELECT chrom, start, stop FROM location;')
locations = curr.fetchall()
chrm_dict={'X':0, 'Y':0}
for place in locations:
	if place[0] in chrm_dict.keys():
		chrm_dict[place[0]] += 1
	else:
		chrm_dict[place[0]] = 1
###	Add in support for any empty chromosomes.

plt.bar(arange(len(chrm_dict)), chrm_dict.values())
plt.xticks(arange(len(chrm_dict)), chrm_dict.keys(), rotation=30)
plt.xlabel('Chromosome')
plt.ylabel('# genes')
plt.title('Number of Polymorphic de novo Genes, by Chromosome')
plt.savefig('Distribution_across_chromosomes.png')

phial = open('Distribution_across_chromosomes.txt','w')
phial.write('The %s genomic locations were '%tuple([len(locations)]))
phial.close()

conn.commit()
curr.close()
conn.close()
