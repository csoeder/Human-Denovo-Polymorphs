import sys
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord

filein= sys.argv[1]
fileout = sys.argv[2]

parser = SeqIO.parse(filein, 'fasta')

rex = []

for rec in parser:
#	eyedee = rec.id
#	desc = rec.description
	seek = rec.seq
	if len(seek) > 75:

		rex.append(rec)

SeqIO.write(rex, fileout, 'fasta')



