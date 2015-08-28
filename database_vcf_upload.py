"""
A script to load VCF data relevent to the DB locations into the DB, using the variant table.
"""

import psycopg2
import sys
import vcf
import numpy as np


pwd = sys.argv[1]	#password
vcf_in = sys.argv[2]	#variants to be loaded

conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

def hetZyggy(wreck):	#	pyVCF's heterozygosity method is flaky; here's one that doesn't fail all over the place
	gt_dict={}
	for samp in wreck.samples:
		for gt in samp.gt_bases.split("|"):
			if gt in gt_dict.keys():
				gt_dict[gt] += 1
			else:
				gt_dict[gt] = 1
	counts=np.array(gt_dict.values())/(1.0*sum(gt_dict.values()))
	return 1-sum(counts**2)


def piHat(wreck):
	"""
	pi_hat (estimation of nucleotide diversity) for the site.
	This metric can be summed across multiple sites to compute regional
	nucleotide diversity estimates.  For example, pi_hat for all variants
	in a given gene.
	Derived from:
	\"Population Genetics: A Concise Guide, 2nd ed., p.45\"
	  John Gillespie.
	"""
	# skip if more than one alternate allele. assumes bi-allelic
	if len(wreck.ALT) > 1:
		return None
	gt_dict={}
	for samp in wreck.samples:
		for gt in samp.gt_bases.split("|"):
			if gt in gt_dict.keys():
				gt_dict[gt] += 1
			else:
				gt_dict[gt] = 1
	counts=np.array(gt_dict.values())/(1.0*sum(gt_dict.values()))
	p = counts[0]
	q = 1.0 - p
	num_chroms = float(2.0 * wreck.num_called)
	return float(num_chroms / (num_chroms - 1.0)) * (2.0 * p * q)


parser = vcf.Reader(open(vcf_in,'r'))
for rec in parser:
	alts = ''
	for var in rec.ALT:
		alts = '%s%s,'%tuple([alts, var])
	homRefs = ''
	for hom in rec.get_hom_refs():
		homRefs = "%s%s,"%tuple([homRefs, hom.sample])
	homAlts = ''
	for hom in rec.get_hom_alts():
		homAlts = "%s%s,"%tuple([homAlts, hom.sample])
	hets = ''
	for het in rec.get_hets():
		hets = "%s%s,"%tuple([hets, het.sample])

#	print [rec.CHROM, rec.POS, rec.REF, alts, homRefs, homAlts, hets, rec.heterozygosity, rec.var_type, rec.var_subtype, rec.nucl_diversity, rec.ID ]

#	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts]))
#	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts, homRefs, homAlts, hets, rec.heterozygosity, rec.is_snp, rec.is_indel, rec.nucl_diversity ])) 
	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, varType, varSubtype, pi_hat, snpDBid) VALUES (%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s);', tuple(["chr%s"%rec.CHROM, rec.POS, rec.REF, alts, homRefs, homAlts, hets, hetZyggy(rec), rec.var_type, rec.var_subtype, piHat(rec), rec.ID])) 
#	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs) VALUES (%s, %s, %s, %s);', tuple(["chr%s"%rec.CHROM, rec.POS, rec.REF, alts]))
	conn.commit()




curr.execute("SELECT variant_pk, chrom, pos FROM variant;")
variants = list(curr.fetchall())

for var in variants:
	curr.execute("SELECT location_pk FROM location WHERE location.chrom = %s AND location.start <= %s AND location.stop >= %s; ", tuple([var[1], var[2], var[2]]))
	peeKays = list(curr.fetchall())
	for loc_pk in peeKays:
		curr.execute("UPDATE location SET poly = True WHERE location.location_pk=%s;", tuple(loc_pk))
	conn.commit()





curr.close()
conn.close()







