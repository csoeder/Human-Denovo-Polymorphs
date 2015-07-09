"""
A script to load VCF data relevent to the DB locations into the DB, using the variant table.
"""

import psycopg2
import sys
import vcf

pwd = sys.argv[1]	#password
vcf_in = sys.argv[2]	#variants to be loaded

conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()



parser = vcf.Reader(open(vcf_in,'r'))
for rec in parser:
	alts = ''
	for var in rec.ALT:
		alts = '%s%s,'%tuple([alts, var])
	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts]))

conn.commit()
curr.close()
conn.close()







