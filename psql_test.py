import psycopg2
import sys

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

###	tables, calling little johnny tables....
print "Jettison old data..."
curr.execute("DROP TABLE find CASCADE;")
curr.execute("DROP TABLE antifind CASCADE;")
curr.execute("DROP TABLE person CASCADE;")
curr.execute("DROP TABLE location CASCADE;")
curr.execute("DROP TABLE sequence CASCADE;")
curr.execute("DROP TABLE variant CASCADE;")
curr.execute("DROP TABLE chimp_location CASCADE;")
curr.execute("DROP TABLE gorilla_location CASCADE;")
curr.execute("DROP TYPE sex CASCADE;")
conn.commit()


curr.execute("CREATE TABLE person ( person_pk INTEGER PRIMARY KEY, person_name varchar(20));")	#	a human is described as a sample ID and an accession number.
curr.execute("CREATE TABLE transcript (trans_pk INTEGER PRIMARY KEY, comp_name varchar(50), source int, FOREIGN KEY(source) REFERENCES person(person_pk));")
curr.execute("CREATE TABLE alignment (aln_pk INTEGER PRIMARY KEY, trans int, chrom varchar(20), start bigint, stop bigint, qstart bigint, qstop bigint, strand varchar(2), no_direct_overlap boolean, no_accumulated_overlap boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));")
curr.execute("CREATE TABLE orf ( orf_pk INTEGER PRIMARY KEY, trans int, start int, stop int, absent_from_pdb boolean, no_duplicates boolean, no_pan_homologous_ORF boolean, no_gor_homologous_ORF boolean, unseen_in_pan_refgenome boolean, unseen_in_gor_refgenome boolean, FOREIGN KEY(trans) REFERENCES transcript(trans_pk));")
conn.commit()





curr.close()
conn.close()
