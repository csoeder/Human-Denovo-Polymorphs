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

 
curr.execute("SELECT person_pk FROM person WHERE person.person_pk IN (SELECT DISTINCT source FROM find WHERE find.loc IN ( select location_pk FROM location WHERE location.poly IS TRUE AN location.handchecked IS TRUE ));")
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
			curr.execute("SELECT location_pk FROM location WHERE location_pk IN (SELECT loc FROM find WHERE find.source=%s) AND WHERE location.poly IS TRUE AND location.handchecked;"%goonie)
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
	num_genes = 45
	pop_size = 50
	flat_prob = 0.05
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
		saturation.append( len( set( observed)) * 100.0/num_genes)
		counted += len(sub)
		abcis.append(counted*100.0/pop_size)
	plt.plot(abcis, saturation, 'bo-')
	plt.title("Saturation of Novelty as Population is Queried\n(Simulated Data)")
	plt.xlabel("Percentage of Population Examined")
	plt.ylabel("Percentage of Existing Genes Found")
	plt.savefig('Cumulative_Novelty_Saturation_Simulation.png')


















