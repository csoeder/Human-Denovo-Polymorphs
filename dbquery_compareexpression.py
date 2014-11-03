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

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()


curr.execute("SELECT id FROM location;")
all_places = curr.fetchall()
curr.execute("SELECT pk FROM person;")
all_peeps = curr.fetchall()


for place in all_places:
	has_it = []
	doesnt = []
	for d00d in all_peeps:
		yes = []
		no = []
		curr.execute("SELECT abs_cov FROM antifind WHERE antifind.source=%s AND antifind.loc=%s;"%tuple([d00d[0], place[0]]))
		cov = curr.fetchall()
		if cov == []:
			curr.execute("SELECT abs_cov FROM find WHERE find.source=%s AND find.loc=%s;"%tuple([d00d[0], place[0]]))
			no.append(cov[0])
		else:
			yes.append(cov[0])
	has_it.append(yes)
	doesnt.append(no)


#http://stackoverflow.com/questions/9215658/plot-a-circle-with-pyplot
#plot circles to highlight 2-sigma.
plt.hold(True)
rings = []
for i in range(0, len(all_places)):
	rings.append(plt.Circle((1, mean(doesnt[i])), 2*std(doesnt[i]), color='g', fill=False))
	rings.append(plt.Circle((2, mean(has_it[i])), 2*std(has_it[i]),color='g', fill=False))
fig = plt.gcf()
for circle in rings:
	fig.gca().add_artist(circle)

peas = []
diffs = []
for i in range(0, len(all_places)):
	peas.append(ttest_ind(has_it[i], doesnt[i])[1])
	diffs.append(mean(has_it[i]) - mean(doesnt[i]))
	if diffs[-1] < 0 and peas[-1] <0.05:#	Serious problem: significant decline
		style = 'r-'
	elif diffs[-1] < 0 and peas[-1] > 0.05:#	Problem: decline
		style = 'r--' 
	elif diffs[-1] > 0 and peas[-1] > 0.05:#	Insignificant increase
		style = 'b--'
	else:
		style = 'b-'
	plt.plot(1, mean(doesnt[i]), 'ko')
	plt.plot(2, mean(has_it[i]), 'ko')

peas = np.array(peas)
diffs = np.array(diffs)

phial.open('CompareAbsoluteExpression.txt')
phial.write('Expression levels at each site are compared between transcribers and non-transcribers. This is done with the absolute depth of coverage of RNA-Seq reads at the site.\n')
phial.write('Expression is expected to be significantly higher in transcribers, ie, a positive difference. The difference between average expression ranged from %s to %s reads per nucleotide.\n'%tuple([min(diffs), max(diffs)]))
phial.write('Of the %s gene sites, %s (%s percent) show the expected increase (blue). The increase is significant in %s (%s percent) of these. (blue, solid) (p<0.05, by a two-tailed independent t-test).\n'%tuple([len(all_places), len(diffs[diffs>0]), len(diffs[diffs>0])*100.0/len(all_places), len(diffs[logical_and(diffs>0, peas<0.05)]), len(diffs[logical_and(diffs>0, peas<0.05)])*100.0/len(diffs[diffs>0]) ]) )
phial.write('Of the %s gene sites, %s (%s percent) show an anomalous decrease (red). The decline is significant in %s (%s percent) of these. (red, solid) (p<0.05, by a two-tailed independent t-test).\n'%tuple([len(all_places), len(diffs[diffs<0]), len(diffs[diffs<0])*100.0/len(all_places), len(diffs[logical_and(diffs<0, peas<0.05)]), len(diffs[logical_and(diffs<0, peas<0.05)])*100.0/len(diffs[diffs<0]) ]) )
phial.write('Green circles indicate the 1-sigma variation at each genomic site, among transcribers/non-transcribers.')
phial.close()


plt.xticks([1,2]], ['Non-transcribers', 'Transcribers'], rotation=30)
plt.ylabel('Average Absolute Expression (Reads/Base)')
plt.title('Expression (in RNA coverage) at Sites of Transcribers and Non-transcribers')
plt.savefig('Cumulativenovelty.png')








