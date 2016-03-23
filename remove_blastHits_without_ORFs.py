import sys
import re
from Bio.Seq import Seq
from Bio.Alphabet import generic_dna
import Bio
import csv
from subprocess import call, check_output


PREDAT_IN = sys.argv[1]
#COMP_GENOME = sys.argv[2]  # Genome file to be compared to
PREDAT_OUT = sys.argv[2]  # Outfile name

stops = ['TAG', 'TAA', 'TGA']

def orf_check(seq, check_reverse_complement=False):
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
		if check_reverse_complement:
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


phial_out = open(PREDAT_OUT, 'w')
with open(PREDAT_IN, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for row in spamreader:
		chrom=row[2]
		start=int(row[10])
		stop=int(row[11])
		COMP_GENOME="individuals/%s/Trinity_files.Trinity.fasta" % tuple([row[0]])
		seq_query = check_output(
			['samtools', 'faidx', COMP_GENOME, '%s:%s-%s' % tuple(
				[chrom, start, stop])])
		seek = Seq(
			''.join(seq_query.split('\n')[1:]).upper(),
			Bio.Alphabet.generic_dna).tostring()
		print orf_check(seek)
		if orf_check(seek):
			lineout='%s\n' % tuple(['%s\t'*len(row) % tuple(row)])
			phial_out.write(lineout)
phial_out.close()