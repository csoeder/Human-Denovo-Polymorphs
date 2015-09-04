import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from subprocess import call, check_output
import vcf
import numpy as np
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr= conn.cursor()

curr.execute("SELECT find_pk, source, seq, loc FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT location_pk, chrom, start, stop FROM location WHERE location.poly IS TRUE and pan_noncoding IS TRUE AND gor_noncoding IS TRUE AND lookback_clean IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE;") #	add handchecked = True clause?
all_places = curr.fetchall()
curr.execute("SELECT person_pk, person_name, sex, pop FROM person;")
all_peeps = curr.fetchall()
curr.execute("SELECT person_pk, person_name, sex, pop FROM person WHERE rna_seq IS TRUE;")
transcribers = curr.fetchall()
#for find in all_finds:
#	transcriber_ids.append(find[1])
#transcriber_ids = list(set(transcriber_ids))
curr.execute("select low.location_pk, (low.stop - low.start) gene_len, vee.heterozygosity, vee.pi_hat, vee.vartype, vee.varsubtype from variant vee, location low where vee.chrom=low.chrom and vee.pos < low.stop and vee.pos > low.start and low.poly IS TRUE AND low.gor_noncoding IS TRUE AND low.pan_noncoding IS TRUE AND low.handchecked IS NOT FALSE AND low.lookback_clean IS TRUE ;")
var_dats = curr.fetchall()



phial = open('Variation_Background.txt','w')
phial.write('%s%s'%tuple(['%s'%'~'*50, '\n']))

phial.write("1000 Genomes Project variant data was used, based on DNA-Seq from %s individuals.\n"%tuple([len(all_peeps)]))
phial.write('These %s included the following populations:\n'%len(all_peeps))

pop_dict = {}
sex_dict = {'M':0, 'F':0}
for person in all_peeps:
	sex_dict[person[2]] +=1
	if person[3] in pop_dict.keys():
		pop_dict[person[3]] +=1
	else:
		pop_dict[person[3]] = 1

for key in pop_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, pop_dict[key]]))
phial.write('\nand the following sex distribution:\n')
for key in sex_dict.keys():
	phial.write('\t%s\t%s\n'%tuple([key, sex_dict[key]]))

var_per_site_dict={}
nt_per_site_dict={}
for var in var_dats:
	if var_dats[0] in var_per_site_dict.keys():
		var_per_site_dict[var[0]] += 1
	else:
		var_per_site_dict[var[0]] = 1
		nt_per_site_dict[var[0]]=var[1]

var_per_nt = []
for site in var_per_site_dict.keys():
#	print var_per_site_dict[site]
#	print nt_per_site_dict[site]
	var_per_nt.append(float(var_per_site_dict[site])/nt_per_site_dict[site])
 
phial.write("The %s polymorphic ORFs spanned %s nt total and contained %s total variant sites. A site contained a median of %s variants; there were on average %s variants per nt \n"%tuple([len(all_places), sum(nt_per_site_dict.values()), len(var_dats), np.median(var_per_site_dict.values()), np.mean(var_per_nt)]))


snp_count = 0
snp_dict = {'ts':0, 'tv': 0, 'unknown': 0}
indel_count = 0
indel_dict = {'ins': 0 , 'del':0, 'unknown':0}

for var in var_dats:
	if var[4] == 'snp':
		snp_count+=1 
		snp_dict[var[5]]+=1
	elif var[4] == 'indel':
		indel_count += 1
		indel_dict[var[5]] += 1

phial.write("These variants consist of  %s SNPs and %s indels, including\n"%tuple([snp_count, indel_count]))
phial.write("\t%s transitions\n"%tuple([snp_dict['ts']]))
phial.write("\t%s transversions\n"%tuple([snp_dict['tv']]))
phial.write("\t%s insertions\n"%tuple([indel_dict['ins']]))
phial.write("\t%s deletions\n"%tuple([indel_dict['del']]))

pi_list = []
hetZyg_list = []
for var in var_dats:
	if  type(var[2])==type(1.0):
		hetZyg_list.append(var[2])
	if type(var[3])==type(1.0):
		pi_list.append(var[3])

phial.write("For the %s sites on which it was defined, nucleotide diversity (pi_hat) had a minimum of %s, a maximum of %s, a mean of %s and a median of %s.\n"%tuple([len(pi_list), min(pi_list), max(pi_list), np.mean(pi_list), np.median(pi_list)]) )
phial.write("For the %s sites on which it was defined, heterozygosity had a minimum of %s, a maximum of %s, a mean of %s and a median of%s.\n"%tuple([len(hetZyg_list), min(hetZyg_list), max(hetZyg_list), np.mean(hetZyg_list), np.median(hetZyg_list)]) )

plt.hist(pi_list, color='b', bins=10, label="pi hat", alpha=0.5)
plt.hist(hetZyg_list, color='r', bins=10, label='heterozygosity', alpha=0.5)
plt.legend()
plt.xlabel("Diversity Measure")
plt.ylabel("# of variant sites")
plt.savefig("variant_diversity_hist.png")
