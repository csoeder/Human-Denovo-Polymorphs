import sys
import csv
import numpy as np


feature_count_data = sys.argv[1]	#	orfpk (tab) orf_sequence
feature_count_summary = sys.argv[2]
upload_out = sys.argv[3]

absolute_out=open('%s.absoluteExpression.dat'%upload_out,'w')
relative_out=open('%s.relativeExpression.dat'%upload_out,'w')

#	open and parse the roster of RNA-Sequenced individuals.
#header:	#Status	individuals/HG00096/HG00096_mapsplice_alignment.sort.bam	individuals/HG00097/HG00097_mapsplice_alignment.sort.bam	individuals/HG00099/HG00099_mapsplice_alignment.sort.bam
with open(feature_count_summary) as phial:
	reader = csv.reader(phial, delimiter="\t")
	rawheader = reader.next()
	rows=list(reader)

header = [i.split("/")[1] for i in rawheader[1:]] #	makes an ordered list of the individuals

summary_dict = {}
for row in rows:
	summary_dict[row[0]] = [float(i) for i in row[1:]]	#	packages the full-scale alignment stats

unassigned_mapped_reads = np.array([float(i) for i in summary_dict['Unassigned_NoFeatures']])
assigned_mapped_reads = np.array([float(i) for i in summary_dict['Assigned']])
total_mapped_reads =list(unassigned_mapped_reads + assigned_mapped_reads) # total read count for FPKM calc


with open(feature_count_data) as phial:	#	open and parse the roster of RNA-Sequenced individuals.
	reader = csv.reader(phial, delimiter="\t")
	reader.next()
	reader.next()
	reader.next() # burn off the three-line header
	#Status	individuals/HG00096/HG00096_mapspli e_alignment.sort.bam	individuals/HG00097/HG00097_mapsplice_alignment.sort.bam	individuals/HG00099/HG00099_mapsplice_alignment.sort.bam
	rows=list(reader)

length_dict={}
abs_dict={}
rel_dict={}
for row in rows:
	length_dict[int(row[0])] = float(row[5]) # dict key is the candidate pk
	abs_dict[int(row[0])] = [ float(i) for i in row[6:] ] # absolute # frags covering
	rel_dict[int(row[0])] = [ a/(m/1000000)/(float(row[5])/1000) for a,m in zip(abs_dict[int(row[0])], total_mapped_reads) ] # calculate fpkm


for d00d in header:
	index = header.index(d00d)
	for cand_pk in length_dict.keys():
		absolute_out.write('%s\t%s\t%s\n'%tuple([d00d, cand_pk, abs_dict[cand_pk][index] ]))
		relative_out.write('%s\t%s\t%s\n'%tuple([d00d, cand_pk, rel_dict[cand_pk][index] ]))






