###
#For each gene, go back and check that no copies have been missed.
import psycopg2
import sys
import os
from numpy import mean
import csv
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import pysam

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

missing_dict = {}	#	Were any sequences missing when the transcriptomes were reexamined?
unexpected_dict = {}#	Did any sequences appear in new individuals when the transcriptomes were reexamined?
start_dict = {}	#		All finds from the DB

###	0	:	DBpull

curr.execute("SELECT id, chrom, start, stop FROM location;")
all_places = curr.fetchall()
curr.execute("SELECT id, source, loc, seq FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT id, pk FROM person;")
all_peeps = curr.fetchall()

###	1	:	Grep the sequence

phial = open('lookback.fasta', 'w')
for find in all_finds:
	if find[2] in start_dict.keys():
		start_dict[find[2]].append(find[1])
	else:
		start_dict[find[2]] = [find[1]]
		curr.execute("SELECT seq FROM sequence WHERE sequence.id=%s"%find[3])	
		seq = curr.fetchone()[0]
		phial.write('>%s\n'%str(find[2]))
		phial.write('%s/n'%seq)
phial.close()

###	2	:	align it to ALL the transcriptomes

for d00d in all_peeps:
	os.system('bsub -J DBlookback_%s -o DBlookback_%s.lsf.out "bwa mem %s/Trinity_files.Trinity.fasta lookback.fasta > %s/%s_lookback.sam"'%tuple([d00d[0]]*5))
	os.system('bsub -J retromap_%s -w "done(DBlookback_%s)" -o retromap_%s.lsf.out "samtools view -S -F4 %s/%s_lookback.sam > %s/%s_lookback_found.sam"'%tuple([d00d[0]]*7))
os.system('while [[ `bjobs -w | grep retromap_ | wc -l` -gt 0 ]]; do sleep 60; bar=$(); f="#"; percent=$((100*$(bjobs -w | grep retromap_ | wc -l)/%s)) ; for i in {1..$((50*$(bjobs -w | grep retromap_ | wc -l)/%s))}; do bar=$bar$f; echo -ne "$percent%% done $bar" ; done'%tuple([len(all_peeps), len(all_peeps)]) )



###	3	:	play hide and seq





















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