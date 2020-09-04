from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqUtils.ProtParam import ProteinAnalysis as Analyze
from Bio.SeqUtils.CodonUsage import CodonAdaptationIndex
from Bio.SeqUtils import MeltingTemp as mt
from Bio.SeqUtils import GC
import sys
import argparse
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

def is_it_an_orf(s):
	is_it = True
	is_it = is_it and len(s)%3==0
	is_it = is_it and s.upper().startswith("ATG")
	is_it = is_it and (s.upper().endswith("TGA") or s.upper().endswith("TAG") or s.upper().endswith("TAA"))
	return(is_it)


parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input_file", help="fasta containing ORFs to analyze")
parser.add_argument("-o", "--output_file", help="output data")
parser.add_argument("-t", "--trim_methionine", help="trim the initial M from the start codon", action="store_true", default=False)
parser.add_argument("-p", "--write_peptides", help="save the peptide sequences while we've got the translations handy", action="store_true", default=False)

# parser.add_argument("-c", "--length_cutoff", help="ignore ORFs with fewer internal (ie, not start or stops) codons", type=str, default=75)
# parser.add_argument("-x", "--extend_across_gaps", help="extend the ORF even if it encounters a gap/N", action="store_true", default=False)
# parser.add_argument("-a", "--include_all_starts", help="report all ORFs when multiple start codons present (else choose longest)", action="store_true", default=False)

args = parser.parse_args()


input_file = args.input_file
output_file = args.output_file
trim = args.trim_methionine


header=["length","molecular_weight", "melting_point","pI","aromaticity","gravy","instability","gc","cai","cpg_depletion"]

datz = []
pepz = []
for record in SeqIO.parse(input_file, "fasta"):
	subdat = [record.id]
	if is_it_an_orf(str(record.seq)):
		orf_nt = str(record.seq)
		orf_aa = str(record.seq.translate()).replace("*", "")
		if trim:
			orf_aa = orf_aa[1:]
			orf_nt = orf_nt[3:]

		length = len(orf_nt.upper())
		mw = Analyze(orf_aa).molecular_weight()
		pI = Analyze(orf_aa).isoelectric_point()
		aroma = Analyze(orf_aa).aromaticity()
		hydrophobe = Analyze(orf_aa).gravy()
		instability = Analyze(orf_aa).instability_index()
		gc = GC(orf_nt)
		cai = CAI.cai_for_gene(orf_nt.upper())
		mp = mt.Tm_GC(orf_nt)
		#D = F_gc/(F_g*F_c) #Schmitz et al 2020). Evolution of novel genes in three-spined stickleback populations. https://doi.org/10.1038/s41437-020-0319-7
		depletion = (orf_nt.upper().count("CG")/float(length))/((orf_nt.upper().count("C")/float(length))*(orf_nt.upper().count("G")/float(length)))


		subdat.extend([length, mw, mp, pI, aroma, hydrophobe, instability, gc, cai, depletion])
		nuWreck = record.translate()
		nuWreck.id=record.id
		pepz.append(nuWreck)

	else:
		print("WARNING! %s is not a true ORF!!! skipping......" % tuple([record.id]) )
		subdat.extend(["NA"]*7)
	datz.append(subdat)


phial_out = open(output_file, "w")
for dat in datz:
	nudat = [str(x) for x in dat]
	nudat = "\t".join(nudat)
	nudat += "\n"
	phial_out.write(nudat)
phial_out.close()



pept_out = output_file.split(".")[:-1]
pept_out.extend(["peptides","fa"])
pept_out=".".join(pept_out)

with open(pept_out, "w") as output_handle:
	SeqIO.write(pept_out, output_handle, "fasta")



