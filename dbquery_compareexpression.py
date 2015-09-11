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
from math import isnan

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()


curr.execute("SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.lookback_clean IS TRUE AND location.handchecked IS NOT FALSE;")
all_places = curr.fetchall()
curr.execute("SELECT person_pk FROM person WHERE person.rna_seq IS TRUE;")
all_peeps = curr.fetchall()

frags_dict = {}	#	Create a dict of dicts... {location: {expressers:[...], nonexpressers:[...], chimp:[...], gorilla:[...]}}
#						Ultimately, also add chimp/gorilla 
fpkm_dict = {}
for place in all_places:
	frags_dict[place[0]] = {'xpress':[], 'nonxpress': [], 'pan': [], 'gor': []}
	fpkm_dict[place[0]] = {'xpress':[], 'nonxpress': [], 'pan': [], 'gor': []}
	for d00d in all_peeps:
		curr.execute("SELECT absolute_coverage, FPKM FROM antifind WHERE antifind.source=%s AND antifind.loc=%s;"%tuple([d00d[0], place[0]]))
		cov = curr.fetchone()
		if cov == None:
			curr.execute("SELECT absolute_coverage, FPKM FROM find WHERE find.source=%s AND find.loc=%s;"%tuple([d00d[0], place[0]]))
			cov = curr.fetchone()
			frags_dict[place[0]]['xpress'].append( cov[0])
			fpkm_dict[place[0]]['xpress'].append(cov[1])
		else:
			frags_dict[place[0]]['nonxpress'].append(cov[0])
			fpkm_dict[place[0]]['nonxpress'].append(cov[1])



def plot_expression(xprs_dict):
	#http://stackoverflow.com/questions/9215658/plot-a-circle-with-pyplot
	#plot circles to highlight 2-sigma.
	plt.hold(True)
	max_std = 0
	min_mean = 0
	max_mean = 0
	rings = []
	for place in all_places:
		rings.append(plt.Circle([1, mean(xprs_dict[place[0]]['nonxpress'])], radius=2*std(xprs_dict[place[0]]['nonxpress']), color='g', fill=False))
		print "frag count: %s +/- %s"%tuple([mean(xprs_dict[place[0]]['nonxpress']), std(xprs_dict[place[0]]['nonxpress'])])
		if mean(xprs_dict[place[0]]['nonxpress']) > max_mean:
			max_mean=mean(xprs_dict[place[0]]['nonxpress'])
		if mean(xprs_dict[place[0]]['nonxpress']) < min_mean:
			min_mean = mean(xprs_dict[place[0]]['nonxpress'])
		if std(xprs_dict[place[0]]['nonxpress']) > max_std:
			max_std = std(xprs_dict[place[0]]['nonxpress'])
	print
	print "expressers!"
	for place in all_places:
		rings.append(plt.Circle([25, mean(xprs_dict[place[0]]['xpress'])], radius=2*std(xprs_dict[place[0]]['xpress']), color='g', fill=False))
		print "frag count: %s +/- %s"%tuple([mean(xprs_dict[place[0]]['xpress']), std(xprs_dict[place[0]]['xpress'])])
		if mean(xprs_dict[place[0]]['xpress']) > max_mean:
			max_mean=mean(xprs_dict[place[0]]['xpress'])
		if mean(xprs_dict[place[0]]['xpress']) < min_mean:
			min_mean = mean(xprs_dict[place[0]]['xpress'])
		if std(xprs_dict[place[0]]['xpress']) > max_std:
			max_std = std(xprs_dict[place[0]]['xpress'])
	fig = plt.gcf()
	for circle in rings:
		fig.gca().add_artist(circle)

	for place in all_places:
		pea = ttest_ind(xprs_dict[place[0]]['nonxpress'], xprs_dict[place[0]]['xpress'])[1]
		diff = mean(xprs_dict[place[0]]['xpress']) - mean(xprs_dict[place[0]]['nonxpress'])

		if isnan(pea):
			style='k:'
		elif diff < 0 and pea <0.05:#	Serious problem: significant decline
			style = 'r-'
		elif diff < 0 and pea > 0.05:#	Problem: decline
			style = 'r--' 
		elif diff > 0 and pea > 0.05:#	Insignificant increase
			style = 'b--'
		else:
			style = 'b-'
		print pea
		xpressor_tick = 25 #1 + 2.2 * max_std
		plt.plot([1, xpressor_tick], [mean(xprs_dict[place[0]]['nonxpress']), mean(xprs_dict[place[0]]['xpress'])], style)
		plt.plot(1, mean(xprs_dict[place[0]]['nonxpress']), 'ko')
		plt.plot(xpressor_tick, mean(xprs_dict[place[0]]['xpress']), 'ko')
		plt.xticks([1,xpressor_tick], ['Non-transcribers', 'Transcribers'])#, rotation=30)
#		plt.xlim([-5, 30])
#		plt.ylim([min_mean-1.1*max_std, max_mean+1.1*2*max_std])


# phial.open('CompareAbsoluteExpression.txt')
# phial.write('Expression levels at each site are compared between transcribers and non-transcribers. This is done with the absolute depth of coverage of RNA-Seq reads at the site.\n')
# phial.write('Expression is expected to be significantly higher in transcribers, ie, a positive difference. The difference between average expression ranged from %s to %s reads per nucleotide.\n'%tuple([min(diffs), max(diffs)]))
# phial.write('Of the %s gene sites, %s (%s percent) show the expected increase (blue). The increase is significant in %s (%s percent) of these. (blue, solid) (p<0.05, by a two-tailed independent t-test).\n'%tuple([len(all_places), len(diffs[diffs>0]), len(diffs[diffs>0])*100.0/len(all_places), len(diffs[logical_and(diffs>0, peas<0.05)]), len(diffs[logical_and(diffs>0, peas<0.05)])*100.0/len(diffs[diffs>0]) ]) )
# phial.write('Of the %s gene sites, %s (%s percent) show an anomalous decrease (red). The decline is significant in %s (%s percent) of these. (red, solid) (p<0.05, by a two-tailed independent t-test).\n'%tuple([len(all_places), len(diffs[diffs<0]), len(diffs[diffs<0])*100.0/len(all_places), len(diffs[logical_and(diffs<0, peas<0.05)]), len(diffs[logical_and(diffs<0, peas<0.05)])*100.0/len(diffs[diffs<0]) ]) )
# phial.write('Green circles indicate the 1-sigma variation at each genomic site, among transcribers/non-transcribers.')
# phial.close()


plot_expression(frags_dict)
plt.ylabel("# RNA-Seq Fragments Overlapping")
plt.title('Absolute Expression (in RNA coverage) at Sites of Transcribers and Non-transcribers')
plt.savefig('comparative_expression_absolute.png')

plt.hold(False)
plt.close()
plt.hold(True)

plot_expression(fpkm_dict)

plt.ylabel("FPKM")
plt.title('Relative Expression (in FPKM) at Sites of Transcribers and Non-transcribers')
plt.savefig('comparative_expression_relative.png')






