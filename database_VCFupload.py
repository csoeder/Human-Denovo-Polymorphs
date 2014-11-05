"""
A script to load VCF data relevent to the DB locations into the DB, using the variant table.
"""

import psycopg2
import sys
import vcf

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr = conn.cursor()

curr.execute("SELECT id, chrom, start, stop FROM location;")
loc_sites = curr.fetchall()

for site in loc_sites:
	parser = vcf.Reader(open('/netscr/csoeder/1kGen/data/variation/ALL.chr%s.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf.gz'%site[1][3:],'r'))
	print site, site[1][3:]
	fetch = parser.fetch(site[1][3:], site[2], site[3])
	for rec in fetch:
		alts = ''
		hom_alts = ''
		hom_refs = ''
		hetz = ''			
		for var in rec.ALT:
			alts = '%s%s,'%tuple([alts, var])
		for var in rec.get_hom_alts():
			hom_alts = '%s%s,'%tuple([hom_alts, var.sample])
		for var in rec.get_hom_refs():
			hom_refs = '%s%s,'%tuple([hom_refs, var.sample])
		for var in rec.get_hets():
			hetz = '%s%s,'%tuple([hetz, var.sample])
		curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts, hom_refs, hom_alts, hetz, rec.heterozygosity, rec.is_snp, rec.is_indel, rec.nucl_diversity]))








conn.commit()

curr.close()
conn.close()







