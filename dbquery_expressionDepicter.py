import matplotlib 
import sys
import matplotlib.pyplot as plt
import csv
import scipy.stats as stats
import numpy as np

all_expression_file = sys.argv[1]
#all_expression_file = 'all_expression_2681.dat'
expressers_file = sys.argv[2]
#expressers_file = 'expresser_expression_2681.dat'
#locus = 2681
locus=sys.argv[3]

all_expression = []
with open(all_expression_file, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for i in spamreader:
		all_expression.append(float(i[0]))


######## Add population !!!
expresser_expression = []
with open(expressers_file, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for i in spamreader:
		expresser_expression.append(float(i[0]))


n, bins, patches = plt.hist(all_expression, bins=75, color='b', alpha=0.75, label="all expression") #, log=True)
for expresser in expresser_expression:
	plt.vlines(expresser, 0, n[len(bins[bins<expresser])], 'r', linewidth=5)
plt.title("Histogram of Expression at Locus %s"%locus)
plt.ylabel('Number of Individuals')
plt.xlabel('FPKM')
#plt.show()
plt.savefig('expression_figures/Locus_%s_expression_histogram.png'%locus)
plt.close()



plt.plot(range(0,len(all_expression)), all_expression, color='b')
for expresser in expresser_expression:
	x=all_expression.index(expresser)
	plt.vlines(x, 0, expresser, 'r', linewidth=5)
plt.title("Ranked Expression at Locus %s"%locus)
plt.ylabel('FPKM')
plt.xlabel('Individual by Rank')
#plt.show()
plt.savefig('expression_figures/Locus_%s_expression_rankplot.png'%locus)
# plt.close()








