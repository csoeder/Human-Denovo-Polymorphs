"""
makes a BED12 file UCSC browser-compatible re:   'BED chromStarts offsets
must be relative to chromStart, not absolute.'

python bed12_relativeBlockStartFixer.py fileIN fileOUT
"""

import csv
import sys

badbedIn = sys.argv[1]
goodbedOut = sys.argv[2]


phial = open(goodbedOut, 'w')

with open(badbedIn, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for row in spamreader:
		start = int(row[1])  	# select the start of the interval
		blocks = row[11]  		# and the BED blocks
		blocksOut = ''
		for i in blocks.split(','):
			if i != '':
				blocksOut = "%s%s," % tuple([blocksOut, int(i)-start])
		lineOut = []
		lineOut.extend(row[:11])
		lineOut.extend([blocksOut])
		lineOut = "%s\t"*12 % tuple(lineOut)
		phial.write("%s\n" % lineOut)
phial.close()
