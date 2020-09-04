import Bio
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq
import argparse
import re
from numpy import array
from random import shuffle
from Bio.Alphabet.IUPAC import IUPACUnambiguousDNA  

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--fasta_in", help="sequences to be scrambled")
parser.add_argument("-o", "--output_path", help="file prefix to write ORFs to")
parser.add_argument("-r", "--replicate_number", help="number of scrambled sequences to generate", type=int, default=10)
parser.add_argument("-s", "--random_seed", help="number of scrambled sequences to generate", type=int, default=None)
parser.add_argument("-d", "--dont_demand_orf", help="simply shuffle the sequence, don't insist that it contain only complete, nonstop codons", action="store_true", default=False)
parser.add_argument("-c", "--clip_ends", help="input sequences contain start and stop codons - clip before shuffling; replace when writing.", action="store_true", default=False)

noPept_noNucl = parser.add_mutually_exclusive_group()
noPept_noNucl.add_argument("-p", "--peptide_fasta", help="input fasta is an amino acid sequence - don't do nucleotide steps. incompatible with -n; output files in AA as well. ", action="store_true", default=False)
noPept_noNucl.add_argument("-n", "--no_translation", help="nucleotide steps only - don't translate. incompatible with -p  ", action="store_true", default=False)




#parser.add_argument("-c", "--length_cutoff", help="ignore ORFs with fewer internal (ie, not start or stops) codons", type=int, default=75)
#parser.add_argument("-x", "--extend_across_gaps", help="extend the ORF even if it encounters a gap/N", action="store_true", default=False)
#parser.add_argument("-a", "--include_all_starts", help="report all ORFs when multiple start codons present (else choose longest)", action="store_true", default=False)

args = parser.parse_args()

fasta_in = args.fasta_in
is_pept = args.peptide_fasta
replicate_number = args.replicate_number
dont_demand_orf = args.dont_demand_orf
no_translation = args.no_translation
clip_ends = args.clip_ends
output_path = args.output_path

seqz = {}
phial_in = SeqIO.parse(fasta_in, "fasta")
for rec in phial_in:
	sequence = str(rec.seq)
	nom = str(rec.id)
	seqz[nom] = sequence
phial_in.close()

stopz = {}
if clip_ends: # if fasta comes with start & stop codons, strip them before randomizing
	if is_pept:
		for seq_name in seqz.keys():
			# ignore stopz
			seqz[seq_name] = seqz[seq_name][1:-1]
		#just clip first and last
	else:
		#clip first & last 3
		for seq_name in seqz.keys():
			stopz[seq_name] = seqz[seq_name][-3:]
			seqz[seq_name] = seqz[seq_name][3:-3]
else:
	pass





def simple_shuffle(seq):
	#	just shuffle the input by character.
	shuffle(seq)
	return(seq)

def hustle_bustle(seq):
	pept_seq = str(Seq("".join(seq), alphabet=IUPACUnambiguousDNA()).translate())
	try:
		first_stop = pept_seq.index("*")
		prefix = seq[:first_stop*3]
		nu_seq = seq[first_stop*3:][1:]
		nu_seq.append(seq[first_stop*3:][0])
		suffix = truffle_shuffle(nu_seq)
		prefix.extend(suffix)
	except ValueError:
		return(seq)
	return( prefix)

def truffle_shuffle(seq):
	# stop-avoidant shuffle:
	# accept a 3n sequence & shuffle
	# shuffle, split by first in-frame stop 
	# permute the stop-containing suffixL abcd...xyz -> bcd...xyza
	# recurse the other half. 
	shuffle(seq)
	return(hustle_bustle(seq))



shuffled_peptide_sequences = {}
shuffled_nucleotide_sequences = {}




if not is_pept:
	# if -d: just shuffle 
	if dont_demand_orf:
		for seq_name in seqz.keys():
			old_seq = list(seqz[seq_name])
			for r in range(0,replicate_number):
				new_name = "%s.nuclShuffle.rep_%s" % tuple([seq_name,r])
				shuffled_nucleotide_sequences[new_name] = "".join( simple_shuffle(old_seq))


	else: # stop-avoidant shuffle
		for seq_name in seqz.keys():
			old_seq = list(seqz[seq_name])
			for r in range(0,replicate_number):
				new_name = "%s.stopAvoidant.rep_%s" % tuple([seq_name,r])
				shuffled_nucleotide_sequences[new_name] = "".join(truffle_shuffle(old_seq))


	if not no_translation:
	# if we have nucleotides AND we want peptide information, break it into codons and shuffle them
		for seq_name in seqz.keys():
			old_seq = seqz[seq_name]
			seq_codons = [old_seq[x:x+3] for x in range(0, len(old_seq), 3)]
			for r in range(0,replicate_number):
				new_name = "%s.codonShuffle.rep_%s" % tuple([seq_name,r])
				simple_shuffle(seq_codons)
				shuffled_peptide_sequences[new_name] = "".join(seq_codons)
	else:
		pass
		#if we don't want peptide information, make like a tree



else: 
	#	If it's an AA fasta in, just shuffle the AAs
	for seq_name in seqz.keys():
		old_seq = list(seqz[seq_name])
		for r in range(0,replicate_number):
			new_name = "%s.aaShuffle.rep_%s" % tuple([seq_name,r])
			shuffled_peptide_sequences[new_name] = "".join( simple_shuffle(old_seq) )
 

if clip_ends: # if fasta comes with start & stop codons, strip them before randomizing
	if is_pept:
		for seq_name in shuffled_peptide_sequences.keys():
			shuffled_peptide_sequences[seq_name] = "M"+shuffled_peptide_sequences[seq_name]+"*"
			#slap the start and stop back on
	else:
		# #clip first & last 3
		for aa_name in shuffled_peptide_sequences.keys():
			shuffled_peptide_sequences[aa_name] = "ATG" + shuffled_peptide_sequences[aa_name] + stopz[aa_name.split(".")[:-2][0]]
		for nt_name in shuffled_nucleotide_sequences.keys():
		# 	stopz[seq_name] = seqz[seq_name][-3:]
			shuffled_nucleotide_sequences[nt_name] = "ATG" + shuffled_nucleotide_sequences[nt_name] + stopz[nt_name.split(".")[:-2][0]]

if not is_pept:

	phial_out = open("%s.shuffledNT.fa" %tuple([output_path]), "w")
	for seek in shuffled_nucleotide_sequences.keys():
		phial_out.write(">%s\n%s\n" % tuple([seek,shuffled_nucleotide_sequences[seek]]))
	phial_out.close()

if not no_translation:
	phial_out = open("%s.shuffledAA.fa" %tuple([output_path]), "w")
	for seek in shuffled_peptide_sequences.keys():
		phial_out.write(">%s\n%s\n" % tuple([seek,shuffled_peptide_sequences[seek]]))
	phial_out.close()



