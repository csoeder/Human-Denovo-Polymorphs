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
	curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, varType, varSubtype, pi_hat, snpDBid) VALUES (%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s);', tuple(["chr%s"%rec.CHROM, rec.POS, rec.REF, alts, homRefs, homAlts, hets, hetZyggy(rec), rec.var_type, rec.var_subtype, rec.nucl_diversity, rec.ID ])) 
conn.commit()
curr.close()
conn.close()







