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
curr.execute('SELECT chrom, start, stop FROM location;')
locations = curr.fetchall()
chrom_list = list(arange(1,23))
chrom_list.extend(['X','Y'])
chrm_dict={}
for chrom in chrom_list:
	chrm_dict['chr%s'%chrom]=0
for place in locations:
	if place[0] in chrm_dict.keys():
		chrm_dict[place[0]] += 1
###	Add in support for any empty chromosomes.

bars=[] 
for i in chrom_list:
	bars.append(chrm_dict['chr%s'%i])
plt.bar(arange(len(chrm_dict)), bars)
plt.xticks(arange(arange(1.5, 25.5)), chrom_list, rotation=30)
plt.xlabel('Chromosome')
plt.ylabel('# genes')
plt.title('Number of Polymorphic de novo Genes, by Chromosome')
plt.savefig('Distribution_across_chromosomes.png')

phial = open('Distribution_across_chromosomes.txt','w')
zero, nonzero = [], []
for key in chrm_dict:
	if chrm_dict[key] == 0:
		zero.append(key)
	else:
		nonzero.append(key)

phial.write('The %s genomic locations were spread across %s chromosomes. %s chromosomes contained no sites. (%s)'%tuple([len(locations), len(nonzero), len(zero), '%s'*len(zero)%tuple(zero)]))
phial.write('The least populated chromosome had %s sites. The most populated had %s. The mean and median were %s and %s sites, respectively.\n'%tuple([min(bars), max(bars), mean(bars), median(bars)]))
phial.close()

conn.commit()
curr.close()
conn.close()
