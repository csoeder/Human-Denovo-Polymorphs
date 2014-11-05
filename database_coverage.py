###
#for each genomic location and each individual, measure coverage and report to either find or antifind

###
#For each gene, go back and check that no copies have been missed.
import psycopg2
import sys
import os
from numpy import mean
import csv


pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

curr.execute("SELECT id, chrom, start, stop FROM location;")
all_genes = curr.fetchall()

phial = open('db_gene_sites.bed','w')
for jean in all_genes:
	phial.write('%s\t%s\t%s\t%s\n'%tuple(jean[1], jean[2], jean[3], jean[0]))
phial.close()

phial = open('absolute_coverage.matrix','w')
columnz = ' \t'
for jean in all_genes:
	columnz = '%s%s\t'%tuple([columnz, jean[0]])
phial.write('%s\n'%columnz)

curr.execute("SELECT id FROM person;")
all_peeps = curr.fetchall()

for d00d in all_peeps:
	rho = '%s\t'%d00d[0]
	os.system('bedtools coverage -d -abam %s/%s_mapsplice_alignment.sort.bam -b db_gene_sites > %s/site_coverage.bedgraph'%tuple([d00d[0]]*3))
	for jean in all_genes:
		cov = []
		eff= open('%s/site_coverage.bedgraph'%d00d[0], 'w')
		for row in csv.reader(eff, delimiter='\t'):
			if row[3] == jean[0]:
				cov.append(int(row[5]))
			rho = '%s\t%s,%s,%s'%tuple([min(cov), mean(cov), max(cov)])
		phial.write('%s\n'%rho)


##################################################################################################
############################	RELATIVE COVERAGE CALCULATIONS ##########################################
##################################################################################################

matt = csv.reader(open('absolute_coverage.matrix','r'), delimiter='\t')
genes = matt.next()[1:]
for row in matt:
	d00d = row[0]
	for dats in row[1:]:
		jean = genes[row[1:].index(dats)]
		curr.execute('SELECT id FROM find WHERE find.source=%s AND find.loc=%s;'%tuple([d00d, jean]))
		finds = curr.fetchall()
		if finds == []:
			curr.execute('SELECT id FROM antifind WHERE antifind.source=%s AND antifind.loc=%s;'%tuple([d00d, jean]))
			antifind = curr.fetchone()[0]
			curr.execute("UPDATE antifind SET abs_cov = %s WHERE antifind.id=%s;"%tuple([dats[1], antifind]))#only include mean coverage for now
			conn.commit()
		else:
			curr.execute("UPDATE find SET abs_cov = %s WHERE find.id=%s;"%tuple([dats[1], finds[0][0]]))#only include mean coverage for now
			conn.commit()



curr.close()
conn.close()