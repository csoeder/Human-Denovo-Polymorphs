import csv
import sys
import psycopg2

#	Reads in manual curation file - currently copy-pasted from a google doc. 

pswd = sys.argv[1]

conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pswd)
curr = conn.cursor()


with open('manual_curation.dat', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='\t')
    spamreader.next()	#	burn off header
    hand_checked = list(spamreader)

for site in hand_checked:
	print site
	curr.execute("SELECT location_pk FROM location WHERE location.start = %s AND location.stop = %s and location.chrom = '%s';"%tuple([ site[2], site[3], site[1] ]))
	location_pk = curr.fetchone()[0]
	if site[10] == 'y':	#	if the site has been handchecked and passed.
		curr.execute("UPDATE location SET handchecked = True WHERE location.location_pk = %s;"%tuple([location_pk]))
conn.commit()



curr.close()
conn.close()




