import psycopg2
import sys

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

curr.execute("SELECT id FROM location;")
all_genes = curr.fetchall()

for jean in all_genes:
	curr.execute('SELECT pk FROM person WHERE person.pk IN (SELECT source FROM find WHERE find.loc != %s);'%jean[0])
	nonexpressives = curr.fetchall()
	for d00d in nonexpressives:
		curr.execute("INSERT INTO antifind (source, seq, loc) VALUES (%s, '', %s);", tuple([d00d, jean[0]]))
		conn.commit()

curr.close()
conn.close()



