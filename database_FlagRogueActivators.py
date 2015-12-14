import psycopg2
from Bio import SeqIO, Seq
import string
import csv
import sys
import os
from subprocess import call, check_output

script_path='/netscr/csoeder/1kGen/query-process/'
working_path='/netscr/csoeder/1kGen/individuals/'	#	Where the BAM/FA alignements are
crunched_path='/nas02/home/c/s/csoeder/Denovo_Candidates/'	#	Where the pipeline results are kept
data_path='/netscr/csoeder/1kGen/data/'

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()


with open('%s1kGenRoster.dat'%script_path) as f:	#	open and parse the roster of RNA-Sequenced individuals.
	reader = csv.reader(f, delimiter="\t")
	dats= list(reader)

for d00d in dats:

	print d00d	
	hombre_nombre = d00d[0]

	curr.execute('SELECT person_pk FROM person WHERE person.person_name=%s;', tuple([hombre_nombre ]))	#	locate this d00d in the DB
	person_pk = curr.fetchone()[0]

	#add each person to the database

	#print '%s%s/mapt/no_compprim_homology.bed'%tuple([crunched_path, hombre_nombre])
	try:	#	Try adding the finds from each person.


		indels = open('%s%s/mapt/indel.report'%tuple([crunched_path, hombre_nombre]), 'r')	#	open the output of the aligned_fork script for parsing and upload
		spamreader = csv.reader(indels, delimiter='\t')

		for row in spamreader:
			curr.execute('SELECT loc, find_pk FROM find WHERE find.assembly=%s and find.source=%s;', tuple([row[3], person_pk]))	#	locate this d00d in the DB
			location_pk, find_pk = curr.fetchone()

			if int(row[3]) > 50:	#	possible splicing
				pass
			else:	#	indel
				sequence_error_warning = True 	#	start off assuming it's bogus
				curr.execute("SELECT hom_refs, hets FROM variant WHERE variant.varType='indel' and variant.contained_by=%s;", tuple([location_pk]))
				fetches =curr.fetchone()
				if fetches == []:	#	 if there is no indel in this region... uhoh!
					pass 	#	Do nothing
					###	sequence_error_warning = TRUE
				else:
					for var in fetches:
						names = "%s%s"%tuple(var)
						if hombre_nombre in names.split(','):	#	If the annotated indel is in this particular individual:
							sequence_error_warning = True
		if sequence_error_warning:
			curr.execute("UPDATE find SET sequence_error_warning = TRUE WHERE find.find_pk = %s;", tuple([find_pk]))
			conn.commit()




		with open('%s%s/mapt/no_compprim_homology.minCov.dat'%tuple([crunched_path, hombre_nombre]), 'r') as f:	#	open and parse the coverage mins for these individuals.
			reader = csv.reader(f, delimiter="\t")
			cov_dats= list(reader)
		for row in cov_dats:
			if int(row[4]) < 2:
				curr.execute("UPDATE find SET low_cov_warning = TRUE WHERE find.source = %s AND find.assembly = '%s';", tuple([person_pk, row[3]]))
				conn.commit()


curr.close()
conn.close()




