from subprocess import call, check_output
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Blast.Applications import NcbiblastxCommandline
from Bio.Seq import Seq
import re
import os
import numpy as np
import sys


ref_genome = sys.argv[1]
output = sys.argv[2]


# 0 hits found
num = re.compile(r'# (\d*) hits found')



files = os.listdir('BLASTs')
for phial in files:
	string = 'BLASTs/%s'%phial
	f = open(string, 'r')
	lines = f.readlines()
	f.close()
	for line in lines:
		hits = num.findall(line)
		if len(hits)>0:
			if int(hits[0]) == 0:
				os.remove(string)
			else:
				pass
				#os.remove(string)
				#call('rm', string)

###tie a bow on it all....

#isolate the query
queer = re.compile(r'# Query: (\S*)')



rex = []
files = os.listdir('BLASTs')
for phial in files:
	f = open('BLASTs/%s'%phial, 'r')
	lines = f.readlines()
	f.close()
	for line in lines:
		hits = queer.findall(line)
		if len(hits)>0:
			query = hits[0]
			c = check_output(['samtools', 'faidx', ref_genome, query])
			orf = ''.join(c.split('\n')[1:])
			rec = SeqRecord(Seq(orf))
			rec.id = ''
			rec.description = query
			rex.append(rec)

SeqIO.write(rex, "curiosities.fa", 'fasta')



lengths = []

####filter by size and uniqueness
biguns = {}
roster = []
for record in SeqIO.parse("curiosities.fa", "fasta"):
	lengths.append(len( record.seq))
	if len(record.seq) > 75:
		if record.id in roster:
			pass
		else:
			roster.append(record.id)
			biguns[record] = len(record)

array_out = np.array(biguns.keys())[ np.argsort(biguns.values())]
SeqIO.write(array_out, output, 'fasta')



