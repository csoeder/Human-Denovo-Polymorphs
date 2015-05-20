"""
A script to load VCF data relevent to the DB locations into the DB, using the variant table.
"""

import psycopg2
import sys
import vcf
import csv

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)


data_path='/netscr/csoeder/1kGen/data/'




def Parsley(vcf_file):
	parser = vcf.Reader(open(vcf_file,'r'))
	print site, site[1][3:]
	fetch = parser.fetch(site[1][3:], site[2], site[3])
	count =0
	for rec in fetch:
		count +=1
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
		try:
			curr.execute('INSERT INTO variant (chrom, pos, contained_by, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, varType, varSubtype, pi_hat, snpDBid) VALUES (%s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple(['chr%s'%rec.CHROM, rec.POS, site[0], rec.REF, alts, hom_refs, hom_alts, hetz, rec.heterozygosity, rec.var_type, rec.var_subtype, rec.nucl_diversity, rec.ID]))
		except IndexError:#PyVCF not playing nice with some of the 1kGen VCFs.... heterozygosity, pi_hat are giving errors
			curr.execute('INSERT INTO variant (chrom, pos, contained_by, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, varType, varSubtype, pi_hat, snpDBid) VALUES (%s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple(['chr%s'%rec.CHROM, rec.POS, site[0], rec.REF, alts, hom_refs, hom_alts, hetz, 0, rec.var_type, rec.var_subtype, 0, rec.ID]))
#		conn.commit()
#		curr.execute('SELECT variant_pk FROM variant WHERE snpDBid=%s;', tuple([rec.ID]))
#		var_pk = curr.fetchone()[0]
		###	Add references between individuals/locations and the variants they contain???

	if count == 0 :#if there are no variants!
		return False
	else:
		return True



curr = conn.cursor()
curr.execute("SELECT location_pk, chrom, start, stop FROM location;")
loc_sites = curr.fetchall()



for site in loc_sites:
	if site[1]=='chrY':
		if not Parsley('%sALL.chrY.phase3_integrated_v1a.20130502.genotypes.vcf.gz'%tuple(data_path)):
			curr.execute("UPDATE location SET poly = %s WHERE location.id = %s;"%tuple([False, site[0]]))

	else:
		if not Parsley('%sALL.%s.phase1_release_v3.20101123.snps_indels_svs.genotypes.vcf.gz'%tuple([data_path, site[1]])):
			curr.execute("UPDATE location SET poly = %s WHERE location.id = %s;"%tuple([False, site[0]]))


conn.commit()
curr.close()
conn.close()







