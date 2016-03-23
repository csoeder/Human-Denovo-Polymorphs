import matplotlib.pyplot as plt
import csv
import sys
from subprocess import check_output

FILE_IN = sys.argv[1]
FILE_OUT = sys.argv[2]

with open('header', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	header=spamreader.next()

vial = open(FILE_OUT, 'w')
with open('FILE_IN', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	for row in spamreader:
		phial = open("window.tmp", 'w')
		phial.write("%s\t%s\t%s"%tuple(row))
		phial.close()
		dat_string=check_output("bedtools intersect -f 0.6 -wa -a coverageMatrix.noCompRpts.stats -b window.tmp",shell=True)
		dats = map(float, dat_string.split('\t')[3:])
		plt.hist(dats)
		plt.show()
		maxxer = header[dats.index(max(dats))]
		vial.write("%s\t%s\t%s\t%s"%tuple(row.append(maxxer)))
vial.close()
