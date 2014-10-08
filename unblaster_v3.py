from subprocess import call, check_output
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Blast.Applications import NcbiblastxCommandline
from Bio.Seq import Seq
import re
import os
import numpy as np




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
				pass
			else:
				os.remove(string)
				#call('rm', string)

###tie a bow on it all....

#isolate the query
queer = re.compile(r'# Query: (\S*)')

genome_rex = []
transcriptome_rex = []
roster = []


files = os.listdir('BLASTs')
for phial in files:
	f = open('BLASTs/%s'%phial, 'r')
	lines = f.readlines()
	f.close()
	for line in lines:
		hits = queer.findall(line)
		if len(hits)>0:
			query = hits[0]
			#genome_query = query.split(';')[0]
			#transcriptome_query = query.split(';')[1]

			if int(query.split(':')[1].split('-')[1])-int(query.split(':')[1].split('-')[0])>75 and query not in roster:
				c = check_output(['samtools', 'faidx', '../Trinity_files.Trinity.fasta', query])
				orf = ''.join(c.split('\n')[1:])
				rec = SeqRecord(Seq(orf))
                                rec.id = query
				rec.description = ''
                                transcriptome_rex.append(rec)
				roster.append(query)


#SeqIO.write(genome_rex, 'Genome_ORFs.fa', 'fasta')
SeqIO.write(transcriptome_rex, 'Transcriptome_ORFs.fa', 'fasta')

