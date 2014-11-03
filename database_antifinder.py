import psycopg2
import sys

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

curr.execute("SELECT id FROM location;")
all_genes = curr.fetchall()

for jean in all_genes:
	curr.execute('SELECT seq FROM find WHERE find.loc=%s;', tuple([jean[0]]))
	squeak = curr.fetchone()[0]
	curr.execute('SELECT pk FROM person WHERE person.pk NOT IN (SELECT source FROM find WHERE find.loc = %s);', tuple([jean[0]]))
	nonexpressives = curr.fetchall()
	for d00d in nonexpressives:
		curr.execute("INSERT INTO antifind (source, seq, loc) VALUES (%s, %s, %s);", tuple([d00d, squeak, jean[0]]))
		conn.commit()

print "gene\texpressers\tnonexpressers\ttotal\toverlap\n"
for jean in all_genes:
	findz, antiz = [], []
	curr.execute('SELECT source FROM find WHERE find.loc=%s;', tuple([jean[0]]))
	finders = curr.fetchall()
	for d00d in finders:
		findz.append(d00d[0])
	curr.execute('SELECT source FROM antifind WHERE antifind.loc=%s;', tuple([jean[0]]))	
	unfinders = curr.fetchall()
	for d00d in unfinders:
		antiz.append(d00d[0])
	print "%s\t%s\t%s\t%s\t%s\n"%tuple([jean[0], len(findz), len(antiz), len(findz)+len(antiz), len(set(findz).intersection(antiz))])



curr.close()
conn.close()



