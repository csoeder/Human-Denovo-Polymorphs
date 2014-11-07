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




pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

#curr.execute("CREATE TABLE variant (id serial PRIMARY KEY, chrom varchar(20), pos bigint, ref_allele text, alt_alleles text, hom_refs text, hom_alts text, hets text, heterozygosity float(10), is_snp boolean, is_indel boolean, pi_hat float(10), meta text )")


span = 0
totVar = 0
num_seqs = {}
varz_dict={}
numSnps = 0
numIndels = 0
curr.execute("SELECT id, start, stop, chrom FROM location WHERE location.poly IS TRUE;")
all_genes = curr.fetchall()
for jean in all_genes:
	num_seqs[jean[0]] = []#snps, indels, total
	varz_dict[jean[0]]=[]
	span += jean[2]-jean[1]
	curr.execute("SELECT id, is_snp, is_indel FROM variant WHERE variant.chrom=%s AND variant.pos<%s AND variant.pos>%s;"%tuple([jean[3], jean[2], jean[1]]))
	all_varz = curr.fetchall()
	for vee in all_varz:
		varz_dict[jean[0]].append(vee[0])
		totVar+=1
		num_seqs[jean[0]][2]+=1
		if vee[1]:
			numSnps+=1
		elif vee[2]:
			numIndels+=1

curr.execute("SELECT id FROM location WHERE location.poly IS FALSE;")
monogs = curr.fetchall()


phial = open('Variation_BasicFacts.txt', 'w')
phial.write('Over %s genes, spanning %s nucleotides, there were observed %s variant sites within the 1kGen variation data. \n This translates to a variant density of %s variants per kilobase.\n'%tuple([len(all_genes), span, totVar, totVar*1000./span]))
###		compare to the genome at large???
###						known genes?
phial.write('\nThis includes %s SNPs (%s%%, %s per kilobase) and %s indels (%s%%, %s per kilobase).\n'%tuple([numSnps, numSnps*100./totVar, numSnps*1000./span, numIndels, numIndels*100./totVar, numIndels*1000./span]))
###		compare to the genome at large???
###						known genes?

varz_per_site=[]
for jean in all_genes:
	varz_per_site.append(len(num_seqs[jean[0]]))
phial.write('\nThe number of variant sites per gene ranged from %s to %s. The mean was %s and the median was %s.\n'%tuple([min(varz_per_site), max(varz_per_site), mean(varz_per_site), median(varz_per_site)]))

phial.write('\nAn additional %s sites met the criteria for a de novo human gene, but were not polymorphic.\n'%tuple([len(monogs)]))
phial.write('\n'%tuple([]))
phial.write('\n'%tuple([]))
phial.close()


