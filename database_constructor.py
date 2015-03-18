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


curr.execute("CREATE TYPE sex AS ENUM ('M', 'F');")	#	Define sex as a datatype
curr.execute("CREATE TABLE person ( person_pk serial PRIMARY KEY, person_name varchar(20), person_access varchar(20), sex sex, mother serial references person(person_pk), father serial references person(person_pk), pop varchar(20), superpop varchar(20),  rna_seq boolean, meta text);")	#	a human is described as a sample ID and an accession number.
#	pk, personal identifier ("HG00000"; "NA00000"), accession number (?), sex, mother, father, population, if they are in the RNA-Seq subset 
#parents are listed; a search will return the siblings. 

curr.execute("CREATE TABLE sequence ( sequence_pk serial PRIMARY KEY, seq text, ref varchar(20), meta text);")
#Define a sequence as basically a string of ATCGs ("text") which is derived from some reference genome "ref"

curr.execute("CREATE TABLE location ( location_pk serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, ref varchar(20), var text, poly boolean, canon_seq serial references sequence(sequence_pk), handchecked boolean, meta text ) ;")
#Define a chromosomal location as an entity which has a chromosome, a start site, and an end site
#	pk, chromosome, start, stop, reference genome, list of variant sites (?), is the locus polymorphic?, what is the canonical sequence?, has this site been inspected manually?

curr.execute("CREATE TABLE chimp_location ( panLoc_pk serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, ref varchar(20), sequence serial references sequence(sequence_pk), pan145_cov float(10), pan146_cov float(10), meta text ) ;")
# Define a genomic location for the homologous sequences in chimps
#	pk, chromosome, start, stop, reference genome, sequence, mapsplice coverage per pan145; per pan 146; 

curr.execute("CREATE TABLE gorilla_location ( gorLoc_pk serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, ref varchar(20), sequence serial references sequence(sequence_pk), gor142_cov float(10), gor143_cov float(10), meta text ) ;")
# Define a genomic location for the homologous sequences in chimps
#	pk, chromosome, start, stop, reference genome, sequence, mapsplice coverage per gor142; per gor143; 

curr.execute("CREATE TABLE find (find_pk serial PRIMARY KEY, source serial references person(person_pk), seq serial references sequence(sequence_pk), loc serial references location(location_pk), assembly text, meta text );")
#A find is an observation of a specific candidate in a specific individual's transcpriptome.
#	pk, person, sequence, location, assembly of observation, 

curr.execute("CREATE TABLE antifind (antifind_pk serial PRIMARY KEY, source serial references person(person_pk), seq serial references sequence(sequence_pk), loc serial references location(location_pk), meta text );")
#An  antifind is the observed *lack* of a specific candidate in a specific individual's transcpriptome.
# Primarily to store metadata, eg transcription levels

curr.execute("CREATE TABLE variant ( variant_pk serial PRIMARY KEY, chrom varchar(20), pos bigint, contained_by serial references location(location_pk), ref_allele text, alt_alleles text, hom_refs text, hom_alts text, hets text, heterozygosity float(10), pi_hat float(10), snpDBid text, varType text, varSubtype text, meta text );")
#Describe sites of variation. 
#		primkey	chromosome	position	referenceallele	alternateallele	homozygousreferenceindividuals	homozygousalternateindividuals	heterozygousinidividuals	heterozygosity	isitaSNP?	isitanIndel?	nucleotideDiversity, 	dbSNP id number, 


print "... base rebuilt."

 


conn.commit()

curr.close()
conn.close()
