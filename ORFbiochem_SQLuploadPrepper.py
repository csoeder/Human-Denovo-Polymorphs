from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqUtils.ProtParam import ProteinAnalysis as Analyze
from Bio.SeqUtils.CodonUsage import CodonAdaptationIndex
from Bio.SeqUtils import GC
import sys
import csv

# 	Source: http://www.kazusa.or.jp/codon/
Codon_Index = {
	'TTT': 0.46,
	'TTC': 0.54,
	'TTA': 0.08,
	'TTG': 0.13,
	'CTT': 0.13,
	'CTC': 0.20,
	'CTA': 0.07,
	'CTG': 0.40,
	'ATT': 0.36,
	'ATC': 0.47,
	'ATA': 0.17,
	'ATG': 1.00,
	'GTT': 0.18,
	'GTC': 0.24,
	'GTA': 0.12,
	'GTG': 0.46,
	'TCT': 0.19,
	'TCC': 0.22,
	'TCA': 0.15,
	'TCG': 0.05,
	'CCT': 0.29,
	'CCC': 0.32,
	'CCA': 0.28,
	'CCG': 0.11,
	'ACT': 0.25,
	'ACC': 0.36,
	'ACA': 0.28,
	'ACG': 0.11,
	'GCT': 0.27,
	'GCC': 0.40,
	'GCA': 0.23,
	'GCG': 0.11,
	'TAT': 0.44,
	'TAC': 0.56,
	'TAA': 0.30,
	'TAG': 0.24,
	'CAT': 0.42,
	'CAC': 0.58,
	'CAA': 0.27,
	'CAG': 0.73,
	'AAT': 0.47,
	'AAC': 0.53,
	'AAA': 0.43,
	'AAG': 0.57,
	'GAT': 0.46,
	'GAC': 0.54,
	'GAA': 0.42,
	'GAG': 0.58,
	'TGT': 0.46,
	'TGC': 0.54,
	'TGA': 0.47,
	'TGG': 1.00,
	'CGT': 0.08,
	'CGC': 0.18,
	'CGA': 0.11,
	'CGG': 0.20,
	'AGT': 0.15,
	'AGC': 0.24,
	'AGA': 0.21,
	'AGG': 0.21,
	'GGT': 0.16,
	'GGC': 0.34,
	'GGA': 0.25,
	'GGG': 0.25}

CAI = CodonAdaptationIndex()
CAI.set_cai_index(Codon_Index)


orf_list_in = sys.argv[1]  # orfpk (tab) orf_sequence
biochem_dat_out = sys.argv[2]

file_out = open(biochem_dat_out, 'w')

with open(orf_list_in) as phial:  # open and parse
	# 		the roster of RNA-Sequenced individuals.
	reader = csv.reader(phial, delimiter="\t")
	orf_list = list(reader)

for orf in orf_list:
	orf_pk = orf[0]
	seq_nt = orf[1]
	if seq_nt[0:3].upper() == "ATG":
		seq_aa = Seq(seq_nt).translate().tostring()
		pI = Analyze(seq_aa).isoelectric_point()
		aroma = Analyze(seq_aa).aromaticity()
		hydrophobe = Analyze(seq_aa.replace("*", "")).gravy()
		instability = Analyze(seq_aa.replace("*", "")).instability_index()
		gc = GC(seq_nt)
		try:
			cai = CAI.cai_for_gene(seq_nt.upper())
		except TypeError:
			cai = "NULL"
		file_out.write('%s\t%s\t%s\t%s\t%s\t%s\t%s\n' % tuple([
			orf_pk, pI, aroma, hydrophobe, instability, gc, cai]))
