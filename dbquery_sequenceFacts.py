import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, mean, median, std, logical_and, array
from random import shuffle
from subprocess import call, check_output
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
from math import log as ln 


pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

phial=open('Sequence_facts.txt','w')

curated_sites = []
curr.execute("SELECT location_pk, start, stop FROM location WHERE location.poly IS TRUE and gor_noncoding IS TRUE AND pan_noncoding IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE;")
all_genes = curr.fetchall()
for site in all_genes:
	curated_sites.append(int(site[2])-int(site[1]))
print len(curated_sites), mean(curated_sites), median(curated_sites)


plt.hold(True)
plt.hist( curated_sites, bins=5,  )
plt.legend()
plt.xlabel('ORF Length (nt)')
plt.ylabel('# Genomic Sites')
plt.title('Distribution of ORF Lengths')
plt.savefig('ORF_Lengths.png')

number_transcribed_sequences=[]
curr.execute("SELECT count( distinct seq) FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE and gor_noncoding IS TRUE AND pan_noncoding IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE) GROUP BY loc;")
all_nums=curr.fetchall()
for numb in all_nums:
	number_transcribed_sequences.append(int(numb[0]))
number_transcribed_sequences=array(number_transcribed_sequences)

phial.write("The %s genome sites had a minimum length of %s nt (compared to a cutoff of 75 nt). The maximum length was %s, the mean was %s, and the median was %s.\n"%tuple([len(curated_sites), min(curated_sites), max(curated_sites), mean(curated_sites), median(curated_sites)]))
phial.write("Each genomic site was represented by at least one sequence variant in the assembled transcripts. %s sites had more than one transcribed sequence observed. The maximum was %s. \n"%tuple([len(number_transcribed_sequences[number_transcribed_sequences>1]), max(number_transcribed_sequences)]))


phial.close()
