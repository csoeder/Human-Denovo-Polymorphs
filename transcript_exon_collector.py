


import csv
import sys
from subprocess import call, check_output

filein = sys.argv[1]
fileout = sys.argv[2]




with open(filein, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	row = spamreader.next()

query = row[9]

coords = row[-2]
if coords[-1] == ',':
	coords= coords[:-1]
coords = coords.split(',')

c = check_output(['samtools', 'faidx', '../Trinity_files.Trinity.fasta' , query])
orf = ''.join(c.split('\n')[1:])

coords.append(len(orf))

count=1
phial = open( fileout, 'w')

pairs = zip(coords[:-1], coords[1:])
for pear in pairs:
	ex = orf[int(pear[0]):int(pear[1])]
	print ex
	print int(pear[0]), int(pear[1])
	phial.write('%s\texon %s\t%s\n'%tuple([query, count, ex]))
	count += 1
phial.close()

