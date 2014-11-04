import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, array, mean, median, std, logical_and
from random import shuffle
from subprocess import call, check_output
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
import networkx as nx

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

curr.execute('SELECT id FROM location;')
all_genes = curr.fetchall()

assoc_list = []
num_expressers = []
for jean in all_genes:
	curr.execute('SELECT pk FROM person WHERE person.pk IN (SELECT source FROM find WHERE find.loc=%s);'%jean[0])
	peeps = curr.fetchall()
	num_expressers.append(len(peeps))
	associates = []
	for d00d in peeps:
		curr.execute('SELECT loc FROM find WHERE find.source=%s;'%d00d[0])
		some_neighbors = curr.fetchall()
		for nay in some_neighbors:
			associates.append(nay[0])
	a = list(set(associates))
	a.remove(jean[0])
	assoc_list.append(a)


#
phial = open('Associativity_and_Avoidance.txt','w')
phial.write('Association relationships amongst the %s genes were investigated. \n'%tuple([len(all_genes)]))
num_assoc = []
for assocs in assoc_list:
	num_assoc.append(len(assocs))
num_assoc = array(num_assoc)
phial.write('%s genes (%s percent) appeared entirely alone, unassociated with any other polymorphic de novo.\n'%tuple([len(num_assoc[num_assoc==0]), len(num_assoc[num_assoc==0])*100.0/len(all_genes)]) )
phial.write('The most highly associative genes associated with %s other genes. This represents %s (%s percent)\n'%tuple([]))
phial.close()

###########################################################################
###############		Comparison figures with simulated unstructured data
###########################################################################

plt.hist(num_assoc, bins=12)
plt.title('Distribution of Associativities of Genes')
plt.xlabel('# of other genes expressed with')
plt.ylabel('# of genes')
plt.savefig('AssociativityHistogram.png')
plt.close()

plt.hold(True)
plt.plot(num_expressers, num_assoc, 'bo')
plt.xlabel("# Individuals Expressing")
plt.ylabel("# Associated Genes")

plt.title("Associativity versus Prevalence")
plt.savefig("AssociativityPlot.png")
plt.close()
###########################################################################
###############		Network figure!		(make it fancier...)
###########################################################################

network = nx.Graph
for jean in all_genes:
	network.add_node(jean[0])
for i in range(0, len(all_genes)):
	for j in assoc_list[i]:
		network.add_edge(all_genes[i], j)
nx.draw_spring(network)
plt.savefig('AssociationNetwork.png')












