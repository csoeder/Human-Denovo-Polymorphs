import psycopg2
from Bio import SeqIO
import string
import csv
import sys
import os
from subprocess import call, check_output

script_path='/netscr/csoeder/1kGen/query-process/'
working_path='/netscr/csoeder/1kGen/individuals/'
data_path='/netscr/csoeder/1kGen/data/'

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr = conn.cursor()

###		First, populate the database with demographic data
with open('%svariation/integrated_call_samples_v3.20130502.ALL.panel'%data_path, 'r') as phial:
	reader = csv.reader(phial, delimiter='\t')	
	reader.next()	#	burn off the one-line header
	demographics = list(reader)

for datum in demographics:
	curr.execute('INSERT INTO person (person_name, sex, pop, superpop) VALUES (%s, %s, %s, %s);', tuple([datum[0], string.capitalize(datum[3][0]), datum[1], datum[2]]))
conn.commit()

###		also include familial relations
with open('%svariation/integrated_call_samples.20130502.ALL.ped'%data_path, 'r') as phial:
	reader = csv.reader(phial, delimiter='\t')	
	reader.next()	#	burn off the one-line header
	familial = list(reader)

for datum in familial:
	if datum[2:4] != ['0', '0']:	#	If there is a parental relation registered:
		curr.execute('SELECT person_pk FROM person WHERE person_name = %s;', tuple([datum[1]]))
		try:
			child_pk = curr.fetchone()[0]

		if datum[2] != '0':
			curr.execute('SELECT person_pk FROM person WHERE person_name = %s;', tuple([datum[2]]))	
			try:
				paternal_pk = curr.fetchone()[0]
				curr.execute("UPDATE person SET father = %s WHERE person.person_pk = %s;"%tuple([paternal_pk, child_pk]))
			except TypeError:
				pass
		if datum[3] != '0':
			curr.execute('SELECT person_pk FROM person WHERE person_name = %s;', tuple([datum[3]]))	
			try:
				maternal_pk = curr.fetchone()[0]
				curr.execute("UPDATE person SET mother = %s WHERE person.person_pk = %s;"%tuple([maternal_pk, child_pk]))
			except TypeError:
				pass


		except TypeError:
			pass


conn.commit()




###		Now, upload the processed RNA-Seq individuals...

with open('%s1kGenRoster.dat'%script_path) as f:	#	open and parse the roster of RNA-Sequenced individuals.
	reader = csv.reader(f, delimiter="\t")
	dats= list(reader)

for rho in dats:

	print rho	
	hombre_nombre = rho[2]

	#add each person to the database

	try:	#	Try adding the finds from each person.

		curr.execute('SELECT person_pk FROM person WHERE person_name = %s;', tuple([hombre_nombre]))	#	locate this d00d in the DB
		person_pk = curr.fetchone()[0]

		deNovos = open('%s%s/mapt/no_compprim_homology.bed'%tuple([working_path, hombre_nombre]), 'r')	#	open the output of the aligned_fork script for parsing and upload
		spamreader = csv.reader(deNovos, delimiter='\t')

		for line in spamreader:
			try:
				#	print line
				chro, begin, end, script_tag = line[:4]
				seq_query = check_output(['samtools', 'faidx', '%s%s/Trinity_files.Trinity.fasta'%tuple([working_path, ide]), script_tag])
				transcript_seq = ''.join(seq_query.split('\n')[1:]).upper()#			the sequence which appears in the transcriptome
				seq_query = check_output(['samtools', 'faidx', '%shg19.fa'%data_path, '%s:%s-%s'%tuple([chro, begin, end])])
				reference_seq = ''.join(seq_query.split('\n')[1:]).upper()#				the sequence which appears in the reference genome

				try:#is the reference sequence one which has already been identified? 
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple(reference_seq))
					ref_seq_pk = curr.fetchone()[0]
				except TypeError:#if not, put it in the DB
					curr.execute("INSERT INTO sequence (seq, ref) VALUES (%s, %s);", tuple([reference_seq, 'hg19']))
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple([reference_seq]))
					ref_seq_pk = curr.fetchone()[0]

				try:#is the transcriptome sequence one which has already been identified? 
					curr.execute("SELECT sequence_pk FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple(transcript_seq))
					trans_seq_pk = curr.fetchone()[0]
				except TypeError:#if not, put it in the DB
					curr.execute("INSERT INTO sequence (seq, ref) VALUES (%s, %s);", tuple([transcript_seq, 'hg19']))
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple([transcript_seq]))
					trans_seq_pk = curr.fetchone()[0]



				try:#is the location already entered in the database, ie, this site has been detected as expressed?
					curr.execute("SELECT location_pk FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
					loc_pk = curr.fetchone()[0]
				except TypeError:#if not, put it into the appropriate table
					curr.execute('INSERT INTO location (chrom, start, stop, ref, poly, canon_seq) VALUES (%s, %s, %s, %s, %s, %s);', tuple([chro, begin, end, 'hg19', True, ref_seq_pk]))
					curr.execute("SELECT location_pk FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
					loc_pk = curr.fetchone()[0]


				try:#has this piece of data already been recorded? No idea why it would be, but I'm trying hard here
					curr.execute("SELECT id FROM find WHERE source=%s AND seq=%s AND loc=%s;", tuple([person_pk, trans_seq_pk, loc_pk]))
					datum = curr.fetchone()[0]
				except TypeError:#mostly its going to just add data to th DB
					curr.execute("INSERT INTO find (source, seq, loc, assembly ) VALUES (%s, %s, %s, %s);", tuple([person_pk, trans_seq_pk, loc_pk, script_tag]) )
			except StopIteration:
				break

		#de_novs = os.listdir('%s/mapt/chunked_genes/deNovos/'%ide)
		print "%s dumped to database" % tuple([ide])
	except IOError:	#	in case the person's hits haven't been found yet. 
		print "No file %s" % ide

conn.commit()

curr.close()
conn.close()


