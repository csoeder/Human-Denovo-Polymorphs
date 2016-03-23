import csv
import sys
from random import shuffle, uniform
import matplotlib.pyplot as plt


candidate_vs_people = sys.argv[1]
people=sys.argv[2]

with open(candidate_vs_people, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	rose=list(spamreader)

with open(people, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	peeps=list(spamreader)

expression_dict={}
peeplist = []
for d00d in peeps:
	expression_dict[d00d[0]]=[]
	peeplist.append(d00d[0])

for rho in rose:
	if rho[0] in expression_dict.keys():
		expression_dict[rho[0]].append(rho[1])


def chunks(l, n):
    """ Yield successive n-sized chunks from l.
    """
    #http://stackoverflow.com/questions/312443/how-do-you-split-a-list-into-evenly-sized-chunks-in-python
    for i in xrange(0, len(l), n):
        yield l[i:i+n]


def stochastic_sampler(lust):
	#Inputs lust, a list of individuals in the database. This is shuffled, binned, and the added novelty of each bin is computed.
	bin_size = 5 
	shuffle(lust)
	old_news = []
	new_news = []
	novelty = [0]
	abcissa = [0]
	truffle_shuffle = list(chunks(lust, bin_size))
	counted = 0
	nov=0
	for members in truffle_shuffle:
		new_news=list(old_news)
		for goonie in members:
				new_news.extend(expression_dict[goonie])
		old_news = set(new_news)
		counted+=len(members)
		novelty.append(len(old_news))
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


















