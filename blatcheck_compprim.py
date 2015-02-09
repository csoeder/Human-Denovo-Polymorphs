'''

A homology detector: given the chimp & gorilla hits from autoblat_compprim.py, 
	can a homologous coding sequence be detected?

	$1	:	BLAT output file (*.psl)
	$2	:	genome to be compared
'''


########################################################
###	Gather toolbox
from subprocess import call, check_output
import os
import re
import sys
import csv
from Bio import SeqIO
from Bio import Seq
from is_it_an_ORF import orf_check
########################################################
codSeq = True							#	flag to track the status of this potential coding sequence
totalPoints = 0 						#	The score for this potential coding sequnce
FILE_IN  = sys.argv[1]	#	PSL file, unheadered, sorted, containing best hit to comparative primate genome. 
COMP_GENOME  = sys.argv[2] 	#	Genome file to be compared to
PRIMATE = sys.argv[3]	#	Primate name
##########################################	Slice and dice...

def sequence_sniffer(seq, begin):
	if seq[:3] != 'ATG':
		back = 0 	#	Pull out the codon before and check that one.
		prevCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*back, begin-3*back+2])]).split('\n')[1:]).upper()
		while prevCodon != 'ATG' and prevCodon not in ['TAG', 'TAA', 'TGA']:	#	While the codon is neither start nor stop
			back +=1
			prevCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*back, begin-3*back+2])]).split('\n')[1:]).upper()
			if prevCodon == 'ATG':	#	If there is a start codon upstream of the missing start 
				codSeq = True		#	Then the coding sequence is 'rescued'
				#print "START CODON WIPEOUT WITH REPLACEMENT"
			elif prevCodon in ['TAG', 'TAA', 'TGA']:
				codSeq = False		#	If there's a stop codon first, it's not!
				#print "START CODON WIPEOUT W/O REPLACEMENT"
	#	better check for restart!	(ie, a new start codon upstream which brings 1/2 or more of the ORF back)
		forward = 0
		nextCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*forward, begin+3*forward+2])]).split('\n')[1:]).upper()
		while forward*3 < 0.5 * qsize:	#	While there is still half a peptide left....
			forward += 1
			nextCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*forward, begin+3*forward+2])]).split('\n')[1:]).upper()
			if nextCodon == 'ATG':
				codSeq = False
				#print "START CODON WIPEOUT WITH RESTART"
	else:	#If the start codon is intact...
		forward = 0 #	begin at the beginning...
		nextCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*forward, begin+3*forward+2])]).split('\n')[1:]).upper()
		while forward*3 < 0.5 * qsize:#	and see if there's an early termination
			forward += 1
			nextCodon = ''.join(check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, begin-3*forward, begin+3*forward+2])]).split('\n')[1:]).upper()
			if nextCodon in ['TAG', 'TAA', 'TGA']:
				codSeq = False
				#print "EARLY TERMINATION!"




with open(FILE_IN, 'rb') as csvfile:

	try:
		row = csv.reader(csvfile, delimiter='\t').next()

		chrom = row[13]			#	Genome coords
		start = int(row[15])	#
		stop = int(row[16])		#	
		matches = int(row[0])	#	number of matching bases
		name = row[9]			#	query name
		qsize = int(row[10])	#	query size
		qinsert = int(row[5])	#	number of bases inserted in query
		tinsert = int(row[7])	#	number of bases inserted in target
		strand = row[8]			#	the strand

		seq_query = check_output(['samtools', 'faidx', COMP_GENOME, '%s:%s-%s'%tuple([chrom, start, stop])])
		seq = ''.join(seq_query.split('\n')[1:]).upper()
		if strand == '-':	#	if the hit is to the opposite strand...
			seq = Seq.Seq(seq).reverse_complement().tostring()
		print seq
		#		Does the sequence map to an ORF as it stands?
		if not orf_check(seq):	#	if this sequence doesn't cleanly map to an ORF
				#	BLAT results can be greedy and include extra nucleotides at the edges. Try clipping these!
#			print "raw sequence isn't an ORF..."
			codSeq=False
			sequence_sniffer(seq, start)

			if not codSeq:
#				print "raw sequence appears non-coding"
#				print "attempting to underp the sequence, 1/3"
				if orf_check(seq[:-1]):
					codSeq = True
				else:
					sequence_sniffer(seq[:-1], start)

			if not codSeq:
#				print "attempting to underp the sequence, 2/3"
				if orf_check(seq[1:-1]):
					codSeq = True
				else:
					sequence_sniffer(seq[1:-1], start+1)

			if not codSeq:
#				print "attempting to underp the sequence, 3/3"
				if orf_check(seq[1:]):
					codSeq = True
				else:
					sequence_sniffer(seq[1:], start+1)

				#	is it missing a start codon?
				#	better check for replacement!	(ie, a new start codon upstream which takes the place of the missing one)


		#print "Percent match:	%s" 	%	tuple([float(matches)/float(qsize)*100])
		#print "Indel fraction:	%s" 	%	tuple([float(qinsert + tinsert)/float(qsize)])

	except StopIteration:
		name = '[blank]'
#		DNE:	If there is no alignment, there is no coding sequence
		codSeq = False
		#print "NO HOMOLOG"

print 
print "%s 	Coding sequence status:	%s"	%	tuple([name, codSeq])

if codSeq:
	FILE_OUT=open('coding_in_%s.list'%tuple([PRIMATE]),'a')	
	FILE_OUT.write('%s\n'%tuple([name]))
	FILE_OUT.close()
else:
	FILE_OUT=open('broken_in_%s.list'%tuple([PRIMATE]),'a')	
	FILE_OUT.write('%s\n'%tuple([name]))
	FILE_OUT.close()





###	NO CODING SEQ
#		* doesn't exist
#		* start codon wipeout w/o replacement
#		* early termination
#		* major indels
