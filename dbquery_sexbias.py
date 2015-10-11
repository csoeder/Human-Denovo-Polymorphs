#import matplotlib 
#matplotlib.use('agg')
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

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()



sexes =[]
def unchunker(x):
	return x[0]

curr.execute("SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.handchecked IS NOT FALSE;")
locations = list(curr.fetchall())
for loc in locations:
	curr.execute("SELECT sex FROM person WHERE person_pk in (SELECT source FROM find WHERE find.loc=%s);"%tuple([loc[0]]))
	tmp_list = list(curr.fetchall())
	sexes.append(map(unchunker, tmp_list))

fem_freqs=[] 
for s in sexes:
	fem_freqs.append(s.count("F")/float(len(s)))

m, bins, patches = plt.hist(fem_freqs, bins=13)
plt.title("Sex Ratio of Expressers, by Candidate Location")
plt.xlabel("Fraction of Female Expressers")
plt.ylabel("# Candidates")
plt.ylim(0,1.1*max(m))
plt.show()



fem_freqs=[] 
for s in sexes:
	if len(s)>1:
		fem_freqs.append(s.count("F")/float(len(s)))

m, bins, patches = plt.hist(fem_freqs, bins=13)
plt.title("Sex Ratio of Expressers, by Candidate Location (Singletons Excluded)")
plt.xlabel("Fraction of Female Expressers")
plt.ylabel("# Candidates")
plt.ylim(0,1.1*max(m))
plt.show()
