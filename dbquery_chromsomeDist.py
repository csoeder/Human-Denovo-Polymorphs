import csv
import sys
from numpy import arange, mean, median, std, logical_and
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
from math import log as ln 

csv_in = sys.argv[1]

chrom_list = list(arange(1,23))
chrom_list.extend(['X','Y'])
chrom_names = ['chr%s'%tuple([i]) for i in chrom_list]

chrom_dist = {}
with open(csv_in, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for row in spamreader:
		chrom_dist[row[0]] = int(row[1])

plt.bar(arange(len(chrom_dist.keys())), [chrom_dist[i] for i in chrom_names])
plt.xticks(list(arange(0, 24)), chrom_names, rotation=30)
plt.xlabel('Chromosome')
plt.ylabel('# genes')
plt.title('Number of Polymorphic de novo Genes, by Chromosome')
#plt.show()
plt.savefig('Distribution_across_chromosomes.png')

