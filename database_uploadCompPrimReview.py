import csv
import sys
import psycopg2

#	Reads in manual curation file - currently copy-pasted from a google doc. 

pswd = sys.argv[1]

conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pswd)
curr = conn.cursor()


with open('CHIMP.nevercoding', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	chimp_clean = list(spamreader)

for location_pk in chimp_clean:
	print location_pk
	curr.execute("UPDATE location SET pan_noncoding = True WHERE location.location_pk = %s;"%tuple(location_pk))
	conn.commit()

with open('GORILLA.nevercoding', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	gorilla_clean = list(spamreader)

for location_pk in gorilla_clean:
	print location_pk
	curr.execute("UPDATE location SET gor_noncoding = True WHERE location.location_pk = %s;"%tuple(location_pk))
	conn.commit()


with open('unseen.bed', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for loc in spamreader:
		curr.execute("SELECT location_pk FROM location WHERE chrom = %s AND start = %s AND stop = %s;", tuple([loc[0], loc[1], loc[2]]))
		loc_pk = curr.fetchone()[0]
		curr.execute("UPDATE location SET pan_noncoding = True WHERE location.location_pk = %s;", tuple([loc_pk]))
		curr.execute("UPDATE location SET gor_noncoding = True WHERE location.location_pk = %s;", tuple([loc_pk]))
		conn.commit()
curr.close()
conn.close()






