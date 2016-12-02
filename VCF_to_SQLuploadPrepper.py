"""
A script to load VCF data relevent to the
DB locations into the DB, using the variant table.
"""

import sys
import vcf
import numpy as np


vcf_in = sys.argv[1]  # variants to be loaded
sql_out = sys.argv[2]  # sql file name

# pyVCF's heterozygosity method is flaky;
# here's one that doesn't fail all over the place


def hetZyggy(wreck):
	gt_dict = {}
	for samp in wreck.samples:
		try:
			for gt in samp.gt_bases.split("|"):
				if gt in gt_dict.keys():
					gt_dict[gt] += 1
				else:
					gt_dict[gt] = 1
		except AttributeError:
			pass
	counts = np.array(gt_dict.values()) / (1.0 * sum(gt_dict.values()))
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
	gt_dict = {}
	for samp in wreck.samples:
		try:
			for gt in samp.gt_bases.split("|"):
				if gt in gt_dict.keys():
					gt_dict[gt] += 1
				else:
					gt_dict[gt] = 1
		except AttributeError:
			pass
	counts = np.array(gt_dict.values())/(1.0*sum(gt_dict.values()))
	p = counts[0]
	q = 1.0 - p
	num_chroms = float(2.0 * wreck.num_called)
	return float(num_chroms / (num_chroms - 1.0)) * (2.0 * p * q)

variant_sql = open('%s_variant.dat' % tuple([sql_out]), 'w')
lookup_sql = open('%s_variantLookup.dat' % tuple([sql_out]), 'w')
variant_pk = 0

parser = vcf.Reader(open(vcf_in, 'r'))
for rec in parser:
	alts = ''
	for var in rec.ALT:
		alts = '%s%s,' % tuple([alts, var])
	homRefs = ''
	for hom in rec.get_hom_refs():
		try:
			gt = '%s|%s' % tuple(hom.gt_alleles)
		except TypeError:
			gt = hom.gt_alleles[0]
		lookup_sql.write('%s\t%s\t%s\t\n' % tuple([variant_pk, hom.sample, gt]))
	homAlts = ''
	for hom in rec.get_hom_alts():
		homAlts = "%s%s," % tuple([homAlts, hom.sample])
		try:
			gt = '%s|%s' % tuple(hom.gt_alleles)
		except TypeError:
			gt = hom.gt_alleles[0]
		lookup_sql.write('%s\t%s\t%s\t\n' % tuple([variant_pk, hom.sample, gt]))
	hets = ''
	for het in rec.get_hets():
		lookup_sql.write(
			'%s\t%s\t%s\t\n' % tuple([
				variant_pk, het.sample, '%s|%s' % tuple(het.gt_alleles)]))

	variant_sql.write(
		"%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n" % tuple([
			variant_pk, "chr%s" % rec.CHROM, rec.POS, rec.REF,
			alts, hetZyggy(rec), rec.var_type, rec.var_subtype,
			piHat(rec), rec.ID]))

	variant_pk += 1
