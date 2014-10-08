
###open your toolbox
import Bio
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq
import numpy as np
import re
#import matplotlib.pyplot as plt
import random as rn
import sys

fasta_in= sys.argv[1]	
fasta_out = sys.argv[2]


#########################################
##This is a modified ORF extractor. For use on transcriptomes, not genomes. 


def extractor(record):
	#extract ORFs from record; outputs a list of record objects containing the ORFs
	desc = record.description
	seek = record.seq.tostring()
	#rev_seek = record.reverse_complement().seq.tostring()
	#irrelevent for transcriptomes - they read forward to back.

	#####Modular dictionary of start and stop codons
	start_dict = {0:[], 1:[], 2:[]}
	stop_dict = {0:[], 1:[], 2:[]}
	#rev_start_dict = {0:[], 1:[], 2:[]}
	#rev_stop_dict = {0:[], 1:[], 2:[]}

	###Define start and stop codons
	start = re.compile(r'ATG')#start codon, aka Methionine. Alternatives rare in eukaryotes. Source: Wikipedia
	stop = re.compile(r'T(?!GG)[AG][AG]')


	###Scan the given seqeunce for instances of codon, tags their locations in a dictionary dic
	def scanner(codon, seq, dic):
		finds = re.finditer(codon, seq)
		while 1:
			try:
				rec = finds.next()
				dic[rec.start()%3].append(rec.start())
			except StopIteration:
				break

	scanner(start, seek, start_dict)
	scanner(stop, seek, stop_dict)
	#scanner(start, rev_seek, rev_start_dict)
	#scanner(stop, rev_seek, rev_stop_dict)


	def find_ORFs(start_dict, stop_dict, mod):
		ORFs = []
		starts = np.array(start_dict[mod])
		stops = np.array(stop_dict[mod])

		last = 0
		while last < len(seek):
			try:
				begin = starts[starts>last][0]
				end = stops[stops>begin][0]
				seq = seek[begin:end+3]
				rec = SeqRecord(Seq(seq))
				

				#######################################################
				##This is different. ORFs haven't been aligned yet. 
				#chro = desc.split('\t')[0][1:]#grab the chromosome name
				#a, b = desc.split('\t')[1:3]#grab the coords
				#This will instead provide coordinates relative to the transcriptome assembly...
				sauce = desc.split(' ')[0]#what's the sauce?
				rec.id = '%s:%s-%s' % tuple([sauce, str(begin+1), str(end+3)])
				rec.description = ''



				ORFs.append(rec)
				last = end

			except IndexError:
				break

		return ORFs


	all_ORFs = []
	all_ORFs.extend(find_ORFs(start_dict, stop_dict, 0))
	all_ORFs.extend(find_ORFs(start_dict, stop_dict, 1))
	all_ORFs.extend(find_ORFs(start_dict, stop_dict, 2))	

	#	print all_ORFs

	return all_ORFs






handle = SeqIO.parse(fasta_in, "fasta")

all_ORFs=[]

while 1:
	try:
		record = handle.next()
		orfs = extractor(record)
		all_ORFs.extend(orfs)
	except StopIteration:
		break

SeqIO.write(all_ORFs, fasta_out, 'fasta')









