import csv
import sys


filein = sys.argv[1]
fileout = sys.argv[2]



with open(filein, 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter='\t')
	row = spamreader.next()


print row
start = int(row[1])
old_coords = row[11]


if old_coords[-1] == ',':
	old_coords= old_coords[:-1]




new_coords = []
for loc in old_coords.split(','):
	new_coords.append(str(int(loc)-start))


new_row = row[:11] + [','.join(new_coords)]

print new_row

str_out = '%s\t'*len(new_row)%tuple(new_row)+'\n'


phial = open(fileout, 'w')
phial.write(str_out)
phial.close()

