
import csv
import sys


filein = sys.argv[1]
fileout = sys.argv[2]



with open(filein, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	row = spamreader.next()
	chrom=row[0]
	start=int(row[1])
	stop=int(row[2])
	name=row[3]
	score=row[4]
	strand=row[5]
	numBlock=int(row[9])
	blockSize=row[10]
	blockStart=row[11]


if blockSize[-1] ==',':
	blockSize=blockSize[:-1]
if blockStart[-1] ==',':
        blockStart=blockStart[:-1]

sizes = blockSize.split(',')
starts = blockStart.split(',')



print sizes
print starts
print len(sizes) == numBlock

def bedcheck():
	flag=True
	if len(sizes) != len(starts):
		flag = False
		print "there are %s block sizes and %s block starts"%tuple([len(sizes), len(starts)])
	if len(sizes) != numBlock:
		flag = False
		print "there are %s blocks tallied but %s in the sizes field"%tuple([numBlock, len(sizes)])
	if start + int(starts[-1]) + int(sizes[-1]) != stop:
		flag = False
		print "The last block should end at %s but it ends at %s"%tuple([stop, start + int(starts[-1]) + int(sizes[-1])])
	return flag


print bedcheck()

phial=open(fileout, 'w')

for i in range(numBlock):
	nuStart = start + int(starts[i])
	nuStop = start + int(starts[i]) + int(sizes[i])
	phial.write('%s\t%s\t%s\t%s\t%s\t%s\n'%tuple([chrom, nuStart, nuStop, name, score, strand]))

phial.close()




