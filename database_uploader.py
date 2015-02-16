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

curr= conn.cursor()

####Read the 1000Genomes roster, use it to populate the database with people



with open('%s1kGenRoster.dat'%script_path) as f:
	reader = csv.reader(f, delimiter="\t")
	dats= list(reader)

for rho in dats:

	print rho
	ide = rho[2]

	#add each person to the database

	try:	#	Try adding the finds from each person.
		deNovos = open('%s%s/mapt/no_compprim_homology.bed'%tuple([working_path, ide]), 'r')

		curr.execute('INSERT INTO person (id, access, sex, pop) VALUES (%s, %s, %s, %s);', tuple([rho[2], rho[1], string.capitalize(rho[4][0]), rho[0]]))
		curr.execute('SELECT pk FROM person WHERE id = %s;', tuple([ide]))
		person_pk = curr.fetchone()[0]

		spamreader = csv.reader(deNovos, delimiter='\t')

		for line in spamreader:
			try:
				#	print line
				chro, begin, end, script_tag = line[:4]
				seq_query = check_output(['samtools', 'faidx', '%s/Trinity_files.Trinity.fasta'%tuple([working_path, ide]), script_tag])
				transcript_seq = ''.join(seq_query.split('\n')[1:]).upper()#			the sequence which appears in the transcriptome
				seq_query = check_output(['samtools', 'faidx', '%shg19.fa'%data_path, '%s:%s-%s'%tuple([chro, begin, end])])
				reference_seq = ''.join(seq_query.split('\n')[1:]).upper()#				the sequence which appears in the reference genome

				try:#is the location already entered in the database, ie, this site has been detected as expressed?
					curr.execute("SELECT id FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
					loc_pk = curr.fetchone()[0]
				except TypeError:#if not, put it into the appropriate table
					curr.execute('INSERT INTO location (chrom, start, stop, ref, poly) VALUES (%s, %s, %s, %s, %s);', tuple([chro, begin, end, 'hg19', True]))
					curr.execute("SELECT id FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
					loc_pk = curr.fetchone()[0]

				try:#is the transcriptome sequence one which has already been identified? 
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple(transcript_seq))
					trans_seq_pk = curr.fetchone()[0]
				except TypeError:#if not, put it in the DB
					curr.execute("INSERT INTO sequence (seq, ref) VALUES (%s, %s);", tuple([transcript_seq, 'hg19']))
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple([transcript_seq]))
					trans_seq_pk = curr.fetchone()[0]


				try:#is the reference sequence one which has already been identified? 
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple(reference_seq))
					ref_seq_pk = curr.fetchone()[0]
				except TypeError:#if not, put it in the DB
					curr.execute("INSERT INTO sequence (seq, ref) VALUES (%s, %s);", tuple([reference_seq, 'hg19']))
					curr.execute("SELECT id FROM sequence WHERE seq = %s AND ref = 'hg19';", tuple([reference_seq]))
					ref_seq_pk = curr.fetchone()[0]

				try:#has this piece of data already been recorded? No idea why it would be, but I'm trying hard here
					curr.execute("SELECT id FROM find WHERE source=%s AND seq=%s AND loc=%s;", tuple([person_pk, trans_seq_pk, loc_pk]))
					datum = curr.fetchone()[0]
				except TypeError:#mostly its going to just add data to th DB
					curr.execute("INSERT INTO find (source, seq, loc) VALUES (%s, %s, %s);", tuple([person_pk, trans_seq_pk, loc_pk]) )
			except StopIteration:
				break

		#de_novs = os.listdir('%s/mapt/chunked_genes/deNovos/'%ide)
		print "%s dumped to database" % tuple([ide])
	except IOError:	#	in case the person's hits haven't been found yet. 
		print "No file %s" % ide

conn.commit()

curr.close()
conn.close()


