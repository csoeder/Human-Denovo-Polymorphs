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

num_seqs = {}
seq_lens = {}
span = 0
curr.execute("SELECT id, start, stop FROM location WHERE location.poly IS TRUE;")
all_genes = curr.fetchall()
for jean in all_genes:
	span += jean[2]-jean[1]
	num_seqs[jean[0]]=[]
	seq_lens[jean[0]]=[]
	curr.execute("SELECT seq FROM find WHERE find.loc=%s;")
	all_seqs = curr.fetchall()
	lens = []
	seqs = []
	for seek in all_seqs:
		curr.execute("SELECT seq FROM sequence WHERE sequence.id=%s;"%seek[0])
		nukes = curr.fetchall()[0][0]
		seqs.append(seek[0])
		lens.append(len(nukes))
	num_seqs[jean[0]].append(len(seqs))
	seq_lens[jean[0]].append(mean(lens))


phial.open('Sequence_Basicfacts.txt','w')
phial.write('The %s genomic sites were expressed in the form of %s unique RNA sequences. The maximum number of sequences per location was %s.\n'%tuple([len(all_genes), sum(num_seqs), max(num_seqs)]))
phial.write('\nThe sequence length varied from %s bp to %s bp, with a mean and median of %s and %s bp, respectively. (ORFs shorter than 75 bp were rejected.)\n'%tuple([min(seq_lens), max(seq_lens), mean(seq_lens), median(seq_lens)]))
phial.close()



