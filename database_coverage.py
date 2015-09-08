###
#for each genomic location and each individual, measure coverage and report to either find or antifind

import psycopg2
import sys
import os
from numpy import mean
import csv
from subprocess import check_output


working_path='/netscr/csoeder/1kGen/individuals/'


def length_weighted_average_coverage(bed_string, totLen):
	lines = bed_string.split('\n')
	while 1:
		try:
			lines.remove('')
		except ValueError:
			break
	weightedAvg = 0
	for line in lines:
		weight = (int(line.split('\t')[2]) - int(line.split('\t')[1]))/totLen
		coverage = int(line.split('\t')[3])
		weightedAvg += weight * coverage
	return weightedAvg




pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()



curr.execute("SELECT person_name, person_pk FROM person WHERE rna_seq IS TRUE;")
all_peeps = list(curr.fetchall())
curr.execute("SELECT chrom, start, stop, location_pk FROM location WHERE location.poly IS TRUE AND location.lookback_clean is TRUE AND location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.handchecked IS NOT FALSE;")
all_places = list(curr.fetchall())


for dood in all_peeps:

	print "finding site coverage for %s"%dood[0]
	million_mapped_reads = float(check_output('samtools idxstats %s%s/%s_mapsplice_alignment.sort.bam | grep -v chrUn | grep -v random | grep -v hap | cut -f 3 | paste -sd+ | bc'%tuple([working_path, dood[0], dood[0]]) , shell = True))/(10.**6)

	count=0
	for jean in all_places:
		phial = open("coverageBed.tmp", 'w')
		phial.write("%s\t%s\t%s"%tuple(jean[:3]))
		phial.close()

###	DO WE ACTUALLY WANT WEIGHTED-AVG DEPTH OF COVERAGE AS A MEASURE?########################################################################
		total_length = float(jean[2]-jean[1])
#		cov_string = check_output("bedtools intersect -a %s%s/%s_coverage.bg -b coverageBed.tmp"%tuple([working_path, dood[0], dood[0]]), shell=True)
#		wt_avg = length_weighted_average_coverage(cov_string, total_length)
################################################################################################################################################



		#	Calculate absolute coverage
		frags_overlapping = int(check_output("samtools view -b %s%s/%s_mapsplice_alignment.sort.bam %s:%s-%s | bedtools intersect -c -split -bed -wa -b - -a coverageBed.tmp | cut -f 4"%tuple([working_path, dood[0], dood[0], jean[0], jean[1], jean[2]]), shell=True))
		#	Calculate fragments per kb per million mapped reads
		FPKM = (frags_overlapping / (total_length/10**3) )/million_mapped_reads	#	( Fragments / kilobase ) / (million mapped reads)
		#	Upload the stats to the DB
		#		#	is dood tagged as an expresser of jean?
		curr.execute("SELECT find_pk FROM find WHERE find.source = %s AND find.loc = %s;"%tuple([dood[1], jean[3]]))
		find = curr.fetchone()
		if find != None:	#	It should just be 1...
		#		#	if so, add a FIND
			print "FOUND"
			#curr.execute("UPDATE find SET find.absolute_coverage = %s AND find.FPKM = %s WHERE find.find_pk = %s;"%tuple([frags_overlapping, FPKM, find[0]]))
			print find			
			print "UPDATE find SET find.absolute_coverage = %s WHERE find.find_pk = %s;"%tuple([frags_overlapping, find[0]])
			curr.execute("UPDATE find SET absolute_coverage = %s WHERE find.find_pk = %s;"%tuple([frags_overlapping, find[0]]))
			curr.execute("UPDATE find SET FPKM = %s WHERE find.find_pk = %s;"%tuple([FPKM, find[0]]))
		else:
		#		#	Otherwise, add an ANTIFIND
			curr.execute('INSERT INTO antifind (source, loc, absolute_coverage, FPKM) VALUES (%s, %s, %s, %s);', tuple([dood[1], jean[3], frags_overlapping, FPKM]))


		conn.commit()
		print "		gene %s of %s analyzed"%tuple([count, len(all_places)])
		os.remove("coverageBed.tmp")
		count += 1
	print "... %s coverage dumped to DB"%tuple([dood[0]])



		#		THIS COULD LIKELY BE DONE IN ONE SHOT WITH genome_locations.lookbackClean.compPrim_scrubbed.polymorphicDeNovos.bed as the -b
		#check_output( "bedtools intersect -wa -split -a %s%s/%s_mapsplice_alignment.bed -b coverageBed.tmp ", shell=True)
#						#bedtools intersect -c -split -a test.bed  -b HG00099_mapsplice_alignment.bed 
		#	Calculate fragments per kb per million mapped reads


curr.close()
conn.close()




###	My code is a dog's code....

# curr.execute("SELECT id, chrom, start, stop FROM location;")
# all_genes = curr.fetchall()

# phial = open('db_gene_sites.bed','w')
# for jean in all_genes:
# 	phial.write('%s\t%s\t%s\t%s\n'%tuple([jean[1], jean[2], jean[3], jean[0]]))
# phial.close()


# curr.execute("SELECT id FROM person;")
# all_peeps = curr.fetchall()
# print "done fetching.\n"



# ##################################################################################################
# ############################	ABSOLUTE COVERAGE CALCULATIONS ##########################################
# ##################################################################################################
# print "calculating absolute coverage...\n"
# phial = open('absolute_coverage.matrix','w')#			This will contain a labeled m*n matrix, with columns representing gene sites and rows representing individuals
# columnz = ' \t'
# for jean in all_genes:
# 	columnz = '%s%s\t'%tuple([columnz, jean[0]])
# phial.write('%s\n'%columnz)

# inc = 0
# for d00d in all_peeps:
# 	rho = '%s\t'%d00d[0]
# 	if not os.path.isfile('%s/%s_site_coverage.bedgraph'%tuple([d00d[0]]*2)):
# 		os.system('bedtools coverage -d -abam %s/%s_mapsplice_alignment.sort.bam -b db_gene_sites.bed > %s/%s_site_coverage.bedgraph'%tuple([d00d[0]]*4))
# 	for jean in all_genes:
# 		cov = []
# 		eff= open('%s/%s_site_coverage.bedgraph'%tuple([d00d[0]]*2), 'r')
# 		for row in csv.reader(eff, delimiter='\t'):
# 			if row[3] == str(jean[0]):
# 				cov.append(int(row[5]))
# 			rho = '%s\t%s,%s,%s'%tuple([min(cov), mean(cov), max(cov)])
# 		phial.write('%s\n'%rho)
# 	inc +=1
# 	per = inc*100./len(all_peeps)
# 	os.system( 'echo -ne "%s%% done\t%s\t#\r"'%tuple([per, '%s%s'%tuple(['*'*int(per/2), ' '*(1-int(per/2))])]))
# phial.close()
# print "... done.\n"

# ##################################################################################################
# ############################	RELATIVE COVERAGE CALCULATIONS ##########################################
# ##################################################################################################
# print "calculating relative coverage...\n"
# phial = open('relative_coverage.matrix','w')#			This will contain a labeled m*n matrix, with columns representing gene sites and rows representing individuals
# columnz = ' \t'
# for jean in all_genes:
# 	columnz = '%s%s\t'%tuple([columnz, jean[0]])
# phial.write('%s\n'%columnz)

# inc=0
# parser = csv.reader(open('absolute_coverage.matrix','r') , delimiter='\t')
# parser.next()
# for d00d in all_peeps:
# 	million_mapped_reads = float(check_output('samtools idxstats HG00096/HG00096_mapsplice_alignment.sort.bam | grep -v chrUn | grep -v random | grep -v hap | cut -f 3 | paste -sd+ | bc' , shell = True))/(10.**6)
# 	rho = '%s\t'%d00d[0]
# 	dats = parser.next()[1:]
# 	dats.reverse()
# 	for jean in all_genes:
# 		absolute = float(dats.pop()[0])#Get the next absolute coverage datum - USING THE MEAN
# 		kb = 0.001*(jean[3]-jean[2])#	site length in kilobases
# 		relative = absolute /(kb * million_mapped_reads)
# 		rho = '%s\t%s'%tuple([rho, relative])
# 	phial.write('%s\n'%rho)
# 	inc += 1
# 	per = inc*100./len(all_peeps)
# 	os.system( 'echo -ne "%s%% done\t%s\t#\r"'%tuple([per, '%s%s'%tuple(['*'*int(per/2), ' '*(1-int(per/2))]) ])) 

# phial.close()


# ##################################################################################################
# ############################	STORE THIS WISDOM IN THE DB ##########################################
# ##################################################################################################


# matt = csv.reader(open('absolute_coverage.matrix','r'), delimiter='\t')
# genes = matt.next()[1:]
# for row in matt:
# 	d00d = row[0]
# 	for dats in row[1:]:
# 		jean = genes[row[1:].index(dats)]
# 		curr.execute('SELECT id FROM find WHERE find.source=%s AND find.loc=%s;'%tuple([d00d, jean]))
# 		finds = curr.fetchall()
# 		if finds == []:
# 			curr.execute('SELECT id FROM antifind WHERE antifind.source=%s AND antifind.loc=%s;'%tuple([d00d, jean]))
# 			antifind = curr.fetchone()[0]
# 			curr.execute("UPDATE antifind SET abs_cov = %s WHERE antifind.id=%s;"%tuple([dats[1], antifind]))#only include mean coverage for now
# 			conn.commit()
# 		else:
# 			curr.execute("UPDATE find SET abs_cov = %s WHERE find.id=%s;"%tuple([dats[1], finds[0][0]]))#only include mean coverage for now
# 			conn.commit()

# matt = csv.reader(open('relative_coverage.matrix','r'), delimiter='\t')
# genes = matt.next()[1:]
# for row in matt:
# 	d00d = row[0]
# 	for dats in row[1:]:
# 		jean = genes[row[1:].index(dats)]
# 		curr.execute('SELECT id FROM find WHERE find.source=%s AND find.loc=%s;'%tuple([d00d, jean]))
# 		finds = curr.fetchall()
# 		if finds == []:
# 			curr.execute('SELECT id FROM antifind WHERE antifind.source=%s AND antifind.loc=%s;'%tuple([d00d, jean]))
# 			antifind = curr.fetchone()[0]
# 			curr.execute("UPDATE antifind SET rel_cov = %s WHERE antifind.id=%s;"%tuple([dats[1], antifind]))#only include mean coverage for now
# 			conn.commit()
# 		else:
# 			curr.execute("UPDATE find SET rel_cov = %s WHERE find.id=%s;"%tuple([dats[1], finds[0][0]]))#only include mean coverage for now
# 			conn.commit()







