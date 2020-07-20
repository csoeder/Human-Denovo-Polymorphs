import Bio
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq
import argparse
import re
from numpy import array

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--fasta_in", help="sequences to be scanned")
parser.add_argument("-o", "--output_file", help="file to write ORFs to")
parser.add_argument("-r", "--reverse_complement", help="scan both strands of sequence", action="store_true", default=False)
parser.add_argument("-c", "--length_cutoff", help="ignore ORFs with fewer internal (ie, not start or stops) codons", type=int, default=75)
parser.add_argument("-x", "--extend_across_gaps", help="extend the ORF even if it encounters a gap/N", action="store_true", default=False)
parser.add_argument("-a", "--include_all_starts", help="report all ORFs when multiple start codons present (else choose longest)", action="store_true", default=False)

args = parser.parse_args()


include_all_starts = args.include_all_starts
length_cutoff = args.length_cutoff
extend_across_gaps = args.extend_across_gaps
reverse_complement = args.reverse_complement

def noGap(seq):
	if "X" in str(seq.translate()).upper():
		return False
	else:
		return True

def orfFinder(seq_in):

	orfs_list = []

	for frame in [0,1,2]:

		storts = str(seq_in[frame:].translate()).upper()
		starts_list = array([m.start()*3 + frame for m in re.finditer('M', storts)])
		stops_list = array([m.start()*3 + 3 + frame for m in re.finditer('\*', storts)])

		for term in stops_list:
			orf_starts = starts_list[starts_list<term]
			if include_all_starts:
				for init in orf_starts:
					orfs_list.append([init, term])
			else:
				try:
					orfs_list.append([orf_starts[0], term])
				except IndexError:
					pass

			starts_list = starts_list[starts_list>term]

	orfs_list = array(orfs_list)
	orfs_list = orfs_list[[L[1]-L[0] >= length_cutoff for L in orfs_list]]

	if not extend_across_gaps:
		orfs_list = orfs_list[[noGap(seq_in[L[0]:L[1]]) for L in orfs_list]]

	return(orfs_list)


phial_in = SeqIO.parse(args.fasta_in, "fasta")
orf_dict = {}
seq_len = {}
for rec in phial_in:
	sequence = rec.seq
	nom = rec.name
	seq_len[nom] = len(sequence)
	orf_dict[nom] = {}
	fwd_orfs = orfFinder(sequence)
	orf_dict[nom]["fwd"] = fwd_orfs
	if reverse_complement:
		rev_orfs = orfFinder(sequence.reverse_complement())
		orf_dict[nom]["rev"] = rev_orfs

phial_out = open(args.output_file, "w")
for seek in orf_dict.keys():
	for orf in orf_dict[seek]["fwd"]:
		phial_out.write("%s:%s-%s(+)\n" % tuple([seek,orf[0]+1,orf[1]]))
	if reverse_complement:
		for orf in orf_dict[seek]["rev"]:
			phial_out.write("%s:%s-%s(-)\n" % tuple([seek, seq_len[seek] - orf[1] +1 , seq_len[seek] - orf[0]]))
phial_out.close()



