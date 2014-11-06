###
#for each genomic location and each individual, measure coverage and report to either find or antifind

import psycopg2
import sys
import os
from numpy import mean
import csv
from subprocess import check_output

print "fetching from database...\n"
pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

curr.execute("SELECT id, chrom, start, stop FROM location;")
all_genes = curr.fetchall()

phial = open('db_gene_sites.bed','w')
for jean in all_genes:
	phial.write('%s\t%s\t%s\t%s\n'%tuple([jean[1], jean[2], jean[3], jean[0]]))
phial.close()


curr.execute("SELECT id FROM person;")
all_peeps = curr.fetchall()
print "done fetching.\n"



##################################################################################################
############################	ABSOLUTE COVERAGE CALCULATIONS ##########################################
##################################################################################################
print "calculating absolute coverage...\n"
phial = open('absolute_coverage.matrix','w')#			This will contain a labeled m*n matrix, with columns representing gene sites and rows representing individuals
columnz = ' \t'
for jean in all_genes:
	columnz = '%s%s\t'%tuple([columnz, jean[0]])
phial.write('%s\n'%columnz)

inc = 0
for d00d in all_peeps:
	rho = '%s\t'%d00d[0]
	os.system('bedtools coverage -d -abam %s/%s_mapsplice_alignment.sort.bam -b db_gene_sites.bed > %s/%s_site_coverage.bedgraph'%tuple([d00d[0]]*4))
	for jean in all_genes:
		cov = []
		eff= open('%s/%s_site_coverage.bedgraph'%tuple([d00d[0]]*2), 'w')
		for row in csv.reader(eff, delimiter='\t'):
			if row[3] == jean[0]:
				cov.append(int(row[5]))
			rho = '%s\t%s,%s,%s'%tuple([min(cov), mean(cov), max(cov)])
		phial.write('%s\n'%rho)
	inc +=1
	per = inc*100./len(all_peeps)
	os.system( 'echo -ne "%s%% done\t%s\t#\r"'%tuple([per, '%s%s'%tuple(['*'*round(per/2), ' '*(1-round(per/2))])]))
phial.close()
print "... done.\n"

##################################################################################################
############################	RELATIVE COVERAGE CALCULATIONS ##########################################
##################################################################################################
print "calculating relative coverage...\n"
phial = open('relative_coverage.matrix','w')#			This will contain a labeled m*n matrix, with columns representing gene sites and rows representing individuals
columnz = ' \t'
for jean in all_genes:
	columnz = '%s%s\t'%tuple([columnz, jean[0]])
phial.write('%s\n'%columnz)

inc=0
parser = csv.reader(open('absolute_coverage.matrix','r') , delimiter='\t')
parser.next()
for d00d in all_peeps:
	million_mapped_reads = float(check_output('samtools idxstats HG00096/HG00096_mapsplice_alignment.sort.bam | grep -v chrUn | grep -v random | grep -v hap | cut -f 3 | paste -sd+ | bc' , shell = True))/(10.**6)
	rho = '%s\t'%d00d[0]
	dats = parser.next()[1:]
	dats.reverse()
	for jean in all_genes:
		absolute = float(dats.pop()[0])#Get the next absolute coverage datum - USING THE MEAN
		kb = 0.001*(jean[3]-jean[2])#	site length in kilobases
		relative = absolute /(kb * million_mapped_reads)
		rho = '%s\t%s'%tuple([rho, relative])
	phial.write('%s\n'%rho)
	inc += 1
	per = inc*100./len(all_peeps)
	os.system( 'echo -ne "%s%% done\t%s\t#\r"'%tuple([per, '%s%s'%tuple(['*'*round(per/2), ' '*(1-round(per/2))]) ) 

phial.close()


##################################################################################################
############################	STORE THIS WISDOM IN THE DB ##########################################
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

matt = csv.reader(open('relative_coverage.matrix','r'), delimiter='\t')
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
			curr.execute("UPDATE antifind SET rel_cov = %s WHERE antifind.id=%s;"%tuple([dats[1], antifind]))#only include mean coverage for now
			conn.commit()
		else:
			curr.execute("UPDATE find SET rel_cov = %s WHERE find.id=%s;"%tuple([dats[1], finds[0][0]]))#only include mean coverage for now
			conn.commit()


curr.close()
conn.close()
