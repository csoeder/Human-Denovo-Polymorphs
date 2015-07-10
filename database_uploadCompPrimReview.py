import csv
import sys
import psycopg2

#	Reads in manual curation file - currently copy-pasted from a google doc. 

pswd = sys.argv[1]

conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pswd)
curr = conn.cursor()


with open('CHIMP.noncoding', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	chimp_clean = list(spamreader)

for location_pk in chimp_clean:
	print location_pk
	curr.execute("UPDATE location SET pan_noncoding = True WHERE location.location_pk = %s;"%tuple(location_pk))
	conn.commit()

with open('GORILLA.noncoding', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	gorilla_clean = list(spamreader)

for location_pk in gorilla_clean:
	print location_pk
	curr.execute("UPDATE location SET gor_noncoding = True WHERE location.location_pk = %s;"%tuple(location_pk))
	conn.commit()


curr.close()
conn.close()






