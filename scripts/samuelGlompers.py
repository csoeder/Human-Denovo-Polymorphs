import Bio
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq
import argparse
import re
from numpy import array

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input_file", help="file containing lists of pairwise associations")
parser.add_argument("-o", "--output_file", help="file containing lists of pairwise associations")
parser.add_argument("-l", "--label", help="label to prefix the glimp names", type=str, default="glomp")
# parser.add_argument("-c", "--length_cutoff", help="ignore ORFs with fewer internal (ie, not start or stops) codons", type=str, default=75)
# parser.add_argument("-x", "--extend_across_gaps", help="extend the ORF even if it encounters a gap/N", action="store_true", default=False)
# parser.add_argument("-a", "--include_all_starts", help="report all ORFs when multiple start codons present (else choose longest)", action="store_true", default=False)

args = parser.parse_args()


input_file = args.input_file
output_file = args.output_file
label = args.label



# length_cutoff = args.length_cutoff
# extend_across_gaps = args.extend_across_gaps
# reverse_complement = args.reverse_complement

collocation_file = open(input_file, "r")

collocated =[]
for line in collocation_file:
	collocated.append(line.split("\n")[0].split("\t"))
collocation_file.close()
oldLen =0

while len(collocated) != oldLen:

	print(len(collocated), oldLen)
	oldLen = len(collocated)

	glomped = []
	while len(collocated) > 0:
		seed = collocated.pop(0)
		for other in collocated:
			if len(list(set(seed) & set(other)))>0:
				seed.extend(other)
				seed = list(set(seed))
				collocated.remove(other)
		glomped.append(seed)
	collocated = glomped

squashed = []
for loc in collocated:
	squashed.append(list(set(loc)))
collocated = squashed

phial_out = open(output_file, "w")

count=0
for loc in collocated:
	s = "%s "*len(loc) % tuple(loc) 
	phial_out.write("%s_%s\t%s\n" % tuple([label,count,s]))
	count+=1

phial_out.close()











