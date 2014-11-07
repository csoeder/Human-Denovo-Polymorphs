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
span = 0
curr.execute("SELECT id, start, stop FROM location WHERE location.poly IS TRUE;")
all_genes = curr.fetchall()
for jean in all_genes:
	span += jean[2]-jean[1]
	num_seqs[jean[0]]=[]
	curr.execute("SELECT seq FROM find WHERE find.loc=%s;")
	all_seqs = curr.fetchall()
	for seek in all_seqs:
		num_seqs[jean[0]].append(seek[0])