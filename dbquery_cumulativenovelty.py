import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, mean, median
from random import shuffle, uniform
from subprocess import call, check_output
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()


curr.execute("SELECT pk FROM person;")
all_peeps = curr.fetchall()
peeplist = []
for d00d in all_peeps:
	peeplist.append(d00d[0])

def chunks(l, n):
    """ Yield successive n-sized chunks from l.
    """
    #http://stackoverflow.com/questions/312443/how-do-you-split-a-list-into-evenly-sized-chunks-in-python
    for i in xrange(0, len(l), n):
        yield l[i:i+n]

def stochastic_sampler(lust):
	#Inputs lust, a list of individuals in the database. This is shuffled, binned, and the added novelty of each bin is computed.
	bin_size = 5#	size of the bin
	shuffle(lust)
	old_news = []
	novelty = [0]
	abcissa = [0]
	truffle_shuffle = list(chunks(lust, bin_size))
	counted = 0
	nov=0
	for members in truffle_shuffle:
		for goonie in members:
			curr.execute("SELECT id FROM location WHERE id IN (SELECT loc FROM find WHERE source=%s);"%goonie)
			all_genes = curr.fetchall()
			for jean in all_genes:
				if jean[0] in old_news:
					pass
				else:
					nov+=1
					old_news.append(jean[0])
		counted+=len(members)
		novelty.append(nov)
		abcissa.append(counted)
	return novelty, abcissa

run1, axis = stochastic_sampler(peeplist)
run2, axis = stochastic_sampler(peeplist)
run3, axis = stochastic_sampler(peeplist)
run4, axis = stochastic_sampler(peeplist)
run5, axis = stochastic_sampler(peeplist)


plt.plot(axis, run1, 'ro-')
plt.plot(axis, run2, 'bo-')
plt.plot(axis, run3, 'go-')
plt.plot(axis, run4, 'mo-')
plt.plot(axis, run5, 'ko-')

plt.xlabel('Number Individuals Checked')
plt.ylabel('# New Genes')
plt.title('Cumulative Novel Genes Observed')
plt.savefig('Cumulativenovelty.png')

plt.hold(False)
plt.close()


if __name__ == '__main__':

	#run a simulation to demonstrate saturation
	num_genes = 15
	pop_size = 75
	flat_prob = 0.08
	bun_size = 5
	jeanz = range(0, num_genes)
	demog = []
	for i in range(0, pop_size):
		d00d = []
		for i in jeanz:
			u = uniform(0.0,1.0)
			if u < flat_prob:
				d00d.append(i)
		demog.append(d00d)
	counted = 0
	saturation = []
	observed = []
	abcis = []
	samples = list(chunks(demog, bun_size))	
	for sub in samples:
		for d00d in sub:
			observed.extend(d00d)
		saturation.append( len( set( observed)))
		counted += len(sub)
		abcis.append(counted)
	plt.plot(abcis, saturation, 'bo-')
	plt.savefig('Cumulative_Novelty_Saturation_Simulation.png')


















