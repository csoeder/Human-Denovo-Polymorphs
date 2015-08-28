import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from numpy import arange, mean, median
from subprocess import call, check_output
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()


def puzzler(all_finds, peeps):
	print peeps
	person_dict = {}
	for d00d in peeps:
		person_dict[d00d[0]] =0
	for find in all_finds:
		if find[1] in person_dict.keys():
			person_dict[find[1]] += 1
	print person_dict
	stats = [max(person_dict.values()), mean(person_dict.values()), median(person_dict.values())]
	mackses = ''
	for d00d in person_dict:
		if person_dict[d00d] == stats[0]:
			mackses = '%s %s,'%tuple([mackses, d00d])
	return stats, person_dict, mackses

#curr.execute("SELECT find_pk, source, seq, loc FROM find where find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is  TRUE AND location.handchecked IS TRUE);")
curr.execute("SELECT find_pk, source, seq, loc FROM find where find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.handchecked IS NOT FALSE);")
all_finds = curr.fetchall()
#curr.execute("SELECT person_pk FROM person WHERE person.person_pk IN (SELECT DISTINCT source FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.handchecked IS TRUE));")
#curr.execute("SELECT person_pk FROM person WHERE person.person_pk IN (SELECT DISTINCT source FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.handchecked IS NOT FALSE));")
curr.execute("SELECT person_pk FROM person WHERE person.rna_seq IS TRUE;")
peeps = curr.fetchall()
print "PEEPS"
print
print peeps
print
#curr.execute("SELECT count(*) FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.handchecked IS TRUE;")
curr.execute("SELECT count(*) FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.poly IS TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE;")
numjeanz = curr.fetchone()[0]

##
##
stats, person_dict, mackses = puzzler(all_finds, peeps)

phial = open('Genes_per_person.txt','w')
phial.write('The %s genes found were found in a sample of %s individuals.\n'%tuple([numjeanz, len(person_dict.keys())]))
phial.write('Of these %s people investigated, %s had no polymorphic denovo genes detected.\n'%tuple([len(person_dict.keys()), person_dict.values().count(0)]))
phial.write('The most genes detected in an individual was %s, in %s\n'%tuple([stats[0], mackses]))
phial.write('The mean genes sighted per individual was %s; the median was %s.\n'%tuple([stats[1], stats[2]]))
phial.write('\n')
phial.close()

plt.hist(person_dict.values(), bins=range(0, stats[0]+2))
plt.xlabel('Genes per Individual')
plt.ylabel('# Individuals')
plt.xticks(list(arange(0.5, stats[0]+1)), list(arange(stats[0]+1)), rotation=30)
plt.title('Polymorphic De Novo Genes per Individual')
plt.savefig('Genes_per_person.png')
plt.hold(False)
plt.hold(True)


