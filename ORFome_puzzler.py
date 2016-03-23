'''
ORFome_puzzler - given an alignment of an ORF to a genome
under comparison, this scans the neighborhood of the alignment
for ORFs, and if there is one overlapping most of the alignment,
the ORF is classified as having a homologous ORF in the genome
being compared.
Usage:
	python ORFome_puzzler.py alignment.psl compared_genome.fa genome_name
'''
########################################################
from subprocess import call, check_output
from Bio import SeqIO
from Bio import Seq
from Bio import SeqUtils
import Bio
import os
import re
import sys
import csv
########################################################
FILE_IN = sys.argv[1]  # PSL file, unheadered, sorted,
# 	containing best hit to comparative primate genome.
COMP_GENOME = sys.argv[2]  # Genome file to be compared to
PRIMATE = sys.argv[3]  # Primate name
##########################################

start_codon_for = re.compile("ATG")
start_codon_rev = re.compile("CAT")
stop_codon_for = re.compile("T(AA|AG|GA)")
stop_codon_rev = re.compile("(TT|TC|CT)A")


def find_starts_forward(strung):
	starts = []
	for i in start_codon_for.finditer(strung):
		starts.append(i.start())
	return starts


def find_stops_forward(strung):
	stops = []
	for i in stop_codon_for.finditer(strung):
		stops.append(i.start())
	return stops


def find_ORFs_forward(begins, ends):
	orfs = []
	for begin in begins:
		for end in ends:
			if end > begin and end % 3 == begin % 3:
				orfs.append([begin, end])
				break
	return orfs


def find_starts_reverse(strung):
	starts = []
	for i in start_codon_rev.finditer(strung):
		starts.append(i.start())
	return starts


def find_stops_reverse(strung):
	stops = []
	for i in stop_codon_rev.finditer(strung):
		stops.append(i.start())
	stops.reverse()
	return stops


def find_ORFs_reverse(begins, ends):
	orfs = []
	for begin in begins:
		for end in ends:
			if end < begin and end % 3 == begin % 3:
				orfs.append([begin, end])
				break
	return orfs

slop = 2000  # how many nt around the alignment do we look???
frac_pept = 0.75  # how much of the sequence must be in an ORF???


def forward_ORFome():
	seq_query = check_output(
		['samtools', 'faidx', COMP_GENOME, '%s:%s-%s' % tuple(
			[chrom, start-slop, stop+slop])])
	seek = Seq.Seq(
		''.join(seq_query.split('\n')[1:]).upper(),
		Bio.Alphabet.generic_dna).tostring()
	forward_orfs = find_ORFs_forward(
		find_starts_forward(seek), find_stops_forward(seek))
	phial = open('ORFome.tmp', 'w')
	for orf in forward_orfs:
		phial.write("%s\t%s\t%s\n" % tuple(
			[chrom, start-slop+orf[0]-1, start-slop+orf[1]+2]))
	phial.close()


def reverse_ORFome():
	seq_query = check_output([
		'samtools', 'faidx', COMP_GENOME, '%s:%s-%s' % tuple([
			chrom, start-slop, stop+slop])])
	seek = Seq.Seq(
		''.join(seq_query.split('\n')[1:]).upper(),
		Bio.Alphabet.generic_dna).tostring()
	reverse_orfs = find_ORFs_reverse(
		find_starts_reverse(seek), find_stops_reverse(seek))
	phial = open('ORFome.tmp', 'w')
	for orf in reverse_orfs:
		phial.write("%s\t%s\t%s\n" % tuple(
			[chrom, start-slop+orf[1]-1,  start-slop+orf[0]+2, ]))
	phial.close()

# non_vial = open("%s.noncoding"%PRIMATE, 'w')
# cod_vial = open("%s.coding"%PRIMATE, 'w')
non_vial = open("%s.noncoding" % PRIMATE, 'a')
cod_vial = open("%s.coding" % PRIMATE, 'a')

with open(FILE_IN, 'rb') as csvfile:
	while True:
		try:
			row = csv.reader(csvfile, delimiter='\t').next()

			chrom = row[13]  # Genome coords
			start = int(row[15])+1  # Weird off-by one
			stop = int(row[16])
			name = row[9]  # query name
			# print "%s 	%s:%s-%s"%tuple([name, chrom, start, stop])
			strand = row[8]  # the strand

			print name, '%s:%s-%s' % tuple([chrom, start, stop])

			phial = open("putative.tmp", 'w')
			phial.write("%s\t%s\t%s\n" % tuple([chrom, start, stop]))
			phial.close()

			if strand == '-':
				reverse_ORFome()
			elif strand == "+":
				forward_ORFome()

			if check_output([
					'bedtools', 'intersect',
					'-f', '0.75', '-b', 'ORFome.tmp',
					'-a', 'putative.tmp']) == '':
				print 'no overlup ... homolog clean'
				non_vial.write("%s\n" % tuple([name]))
			else:
				print "homologous coding region in %s" % PRIMATE
				cod_vial.write("%s\n" % tuple([name]))
			os.remove('putative.tmp')
			os.remove('ORFome.tmp')

		except StopIteration:
			print "DONE"
			break

non_vial.close()
cod_vial.close()
