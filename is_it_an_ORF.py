import sys
import re

#seq = sys.argv[1]
from Bio.Seq import Seq
from Bio.Alphabet import generic_dna



stops = ['TAG', 'TAA', 'TGA']

def orf_check(seq):
	yes = 1
	if seq[0:3]!="ATG":#starts with a start codon
		yes *= 0

	if seq[-3:] not in stops:#ends with a stop codon
		yes *= 0

	if len(seq) % 3 != 0:#if it's not a whole number of codons
		yes *= 0
		
	codons = re.findall(".{3}", seq[:-3])
	for cod in codons: #if it terminates early
		if cod in stops:
			yes *= 0
	if False:
#	if not yes:
		rev = Seq(seq).reverse_complement().tostring()
		if rev[0:3]=="ATG":
			yes = 1
		if rev[-3:] in stops:
			yes = 1
		if len(rev)%3 == 0:
			yes = 1
		codons = re.findall(".{3}", rev[:-3])
		for cod in codons:
			if cod in stops:
				yes *=0
				
				
		


	return yes




