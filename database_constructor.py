import psycopg2
import sys

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

curr.execute("CREATE TYPE sex AS ENUM ('M', 'F')")#Define the concept of sex
curr.execute("CREATE TABLE person ( pk serial PRIMARY KEY, id varchar(20), access varchar(20), sex sex, mother serial references person(pk), father serial references person(pk), pop varchar(20), meta text);")#a human is described as a sample ID and an accession number.
#parents are listed; a search will return the siblings. 

curr.execute("CREATE TABLE sequence ( id serial PRIMARY KEY, seq text, ref varchar(20), meta text);")
#Define a sequence as basically a string of ATCGs ("text") which is derived from some reference genome "ref"
 
curr.execute("CREATE TABLE location ( id serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, ref varchar(20), var text, meta text ) ;")
#Define a chromosomal location as an entity which has a chromosome, a start site, and an end site

curr.execute("CREATE TABLE find (id serial PRIMARY KEY, source serial references person(pk), seq serial references sequence(id), loc serial references location(id), meta text )")
#A find is an observation of a specific candidate in a specific individual's transcpriptome.

curr.execute("CREATE TABLE antifind (id serial PRIMARY KEY, source serial references person(pk), seq serial references sequence(id), loc serial references location(id), meta text )")
#An  antifind is the observed *lack* of a specific candidate in a specific individual's transcpriptome.
# Primarily to store metadata, eg transcription levels

curr.execute("CREATE TABLE variant (id serial PRIMARY KEY, chrom varchar(20), pos bigint, ref_allele text, alt_alleles text, hom_refs text, hom_alts text, hets text, heterozygosity float(10), is_snp boolean, is_indel boolean, pi_hat float(10), meta text )")
#Describe sites of variation. 
#		primkey	chromosome	position	referenceallele	alternateallele	homozygousreferenceindividuals	homozygousalternateindividuals	heterozygousinidividuals	heterozygosity	isitaSNP?	isitanIndel?	nucleotideDiversity




 


conn.commit()

curr.close()
conn.close()