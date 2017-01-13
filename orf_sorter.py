from is_it_an_ORF import orf_check
from Bio import SeqIO
import sys


fasta_in = sys.argv[1]
try:
	out_prefix = "%s." % tuple([sys.argv[2]])
except IndexError:
	out_prefix = ''


good_maps = open("%sgood_maps.list" % tuple([out_prefix]), 'w')
bad_maps = open("%sbad_maps.list" % tuple([out_prefix]), 'w')


for record in SeqIO.parse(fasta_in, "fasta"):
	if orf_check(record.seq.tostring().upper()):
		good_maps.write("%s\n" % (record.name))
	else:
		if orf_check(record.reverse_complement().seq.tostring().upper()):
			good_maps.write("%s\n" % (record.name))
		else:
			bad_maps.write("%s\n" % (record.name))

good_maps.close()
bad_maps.close()
