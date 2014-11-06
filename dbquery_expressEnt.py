import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, mean, median, std, logical_and
from random import shuffle
from subprocess import call, check_output
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
from math import log as ln 


def S(dist):#define entropy of a distribution
	tot = float(sum(dist))
	normdist = [i/tot for i in dist]
	s=0
	for p in normdist:
		if p > 0:
			s -= p*ln(p)
	return s

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()


curr.execute("SELECT id FROM location;")
all_genes = curr.fetchall()
popS = {}
sexS = {}
for jean in all_genes:
	pop_dict={}
	sax_dict={}
	curr.execute("SELECT pop, sex FROM person WHERE person.pk IN (SELECT source FROM find WHERE find.loc=%s);"%tuple([jean[0]]))
	peepz = curr.fetchall()
	for p in peepz:
		if p[0] not in pop_dict.keys():
			pop_dict[p[0]] = 1
		else:
			pop_dict[p[0]] += 1
		if p[0] not in sax_dict.keys():
			sax_dict[p[1]] = 1
		else:
			sax_dict[p[1]] += 1
	total = sum(pop_dict.values())
	if total not in popS.keys():
		popS[total] = [S(pop_dict.values())]
	else:
		popS[total].append(S(pop_dict.values()))
	if total not in sexS.keys():
		sexS[total] = [S(sex_dict.values())]
	else:
		sexS[total].append(S(sex_dict.values()))

all_pop_S = []
for i in popS.values:
	all_pop_S.extend(i)
all_sex_S = []
for i in sexS.values:
	all_sex_S.extend(i)


phial = open('ExpressionEntropy.txt', 'w')
phial.write('The entropy of the distribution of the expression of each gene was measured, across population and sex.\n An entropy of zero is equivalent to gene which is expressed in a single population or sex.\n Entropy is maximized when the expression is equally common in all subpopulations.\n'%tuple([]))
phial.write('\nThe minimum entropy across populations was %s. The maximum was %s. There are %s populations, giving a maximum possible entropy of %s.\n'%tuple([min(all_pop_S), max(all_pop_S), 4, S([1]*4)]))
phial.write('\nThe minimum entropy across sexes was %s. The maximum was %s. Given two sexes, the maximum possible entropy is %s.\n'%tuple([min(all_sex_S), max(all_sex_S), S([1,1])]))
phial.write('\n'%tuple([]))
phial.close()


n, bins, patches = plt.hist(all_pop_S, bins=15)
plt.vlines(0, 0, max(n), color='k')
plt.vlines(S([1]*4), 0, max(n), color='k')
plt.title("Shannon Entropy of Gene Expression Across Populations")
plt.xlabel("Entropy")
plt.ylabel("# Genes")
plt.savefig("Population_expression_entropy_hist.png")
plt.close()

for thing in popS.items():
	for ess in thing[1]:
		plt.plot(thing[0], ess, 'ko')
#		plt.hlines( , thing[0]-0.25, thing[0]+0.25, color='r', linestyles='dashed')
plt.title("Shannon Entropy of Gene Expression Across Populations\nAs A Function of Expression Prevalence")
plt.xlabel('# Individuals Expressing')
plt.ylabel('Entropy')
plt.savefig("Population_expression_entropy_plot.png")
plt.close()

n, bins, patches = plt.hist(all_pop_S, bins=15)
plt.vlines(0, 0, max(n), color='k')
plt.vlines(S([1]*2), 0, max(n), color='k')
plt.title("Shannon Entropy of Gene Expression Across Sexes")
plt.xlabel("Entropy")
plt.ylabel("# Genes")
plt.savefig("Sex_expression_entropy_hist.png")
plt.close()

for thing in sexS.items():
	for ess in thing[1]:
		plt.plot(thing[0], ess, 'ko')
#		plt.hlines( , thing[0]-0.25, thing[0]+0.25, color='r', linestyles='dashed')
plt.title("Shannon Entropy of Gene Expression Across Sexes\nAs A Function of Expression Prevalence")
plt.xlabel('# Individuals Expressing')
plt.ylabel('Entropy')
plt.savefig("Sex_expression_entropy_plot.png")
plt.close()





