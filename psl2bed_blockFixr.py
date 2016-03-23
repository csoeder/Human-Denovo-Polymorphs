import csv 
import sys

badbedIn = sys.argv[1]
goodbedOut = sys.argv[2]


phial = open(goodbedOut, 'w')

with open(badbedIn, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for row in spamreader:
		start = int(row[1])
		blocks = row[20]
		blocksOut=''
		for i in blocks.split(','):
			if i != '':
				blocksOut = "%s%s,"%tuple([blocksOut, int(i)-start])
		lineOut = []
		lineOut.extend(row[:7])
		lineOut.extend([ 0, '0,0,0'])
		lineOut.extend([row[17],row[18],blocksOut])
		lineOut = "%s\t"*12%tuple(lineOut)

		phial.write("%s\n"%lineOut)


