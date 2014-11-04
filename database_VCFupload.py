"""
A script to load VCF data relevent to the DB locations into the DB, using the variant table.
"""

import psycopg2
import sys
import vcf

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr = conn.cursor()


try:#is the location already entered in the database, ie, this site has been detected as expressed?
	curr.execute("SELECT id, chrom, start, stop FROM location;")
	loc_sites = curr.fetchall()

	for site in loc_sites:
		parser = vcf.Reader(open('/netscr/csoeder/1kGen/data/variation/ALL.chr%s.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf.gz'%site[1][3:],'r'))
		fetch = parser.fetch(loc_sites[1], loc_sites[2], loc_sites[3])
		for rec in fetch:
			alts = ''
			for var in rec.ALT:
				alts = '%s%s,'%tuple([alts, var])
			curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts]))
			alts = ''


except TypeError:#if not, put it into the appropriate table
	curr.execute('INSERT INTO location (chrom, start, stop, ref) VALUES (%s, %s, %s, %s);', tuple([chro, begin, end, 'hg19']))
	curr.execute("SELECT id FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
	loc_pk = curr.fetchone()[0]





conn.commit()

curr.close()
conn.close()







