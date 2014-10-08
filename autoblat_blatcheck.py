
from subprocess import call, check_output

import os
import re
import time
import csv
import re
import sys
from Bio import SeqIO
#import psycopg2


#conn = psycopg2.connect("dbname=testdb user=postgres password=password")
#conn = psycopg2.connect("dbname=denovogenes user=gene password=den0V0jeandata host=bioapps.its.unc.edu")
#curr = conn.cursor()



filein = sys.argv[1]
os.mkdir('BLATs')

parser = SeqIO.parse(filein, 'fasta')

n=0
for rec in parser:
	SeqIO.write([rec], open('BLATs/temp%s.fa'%n, 'w'), "fasta")
	call (['blat', '/netscr/csoeder/1kGen/data/hg19.fa', 'BLATs/temp%s.fa'%n, 'BLATs/blat%s.psl'%n])
	n+=1






#index = re.compile('blat(\d*).psl')
index = re.compile('blat(\d*).psl')


listing = os.listdir('BLATs')

for item in listing:

	print item


	if item.endswith('psl'):

		number = index.match(item).groups()[0]

		call(['touch', 'BLATs/%s.snipt'%item])
#	call(['du', 'blats/%s.snipt'%item])

		os.system('sed 1,5d BLATs/%s > BLATs/%s.snipt'%tuple([item, item]))
#	call(['sed', '1,5d', 'blats/%s'%item, '>>', 'blats/%s.snipt'%tuple([item])])
#	print check_output(['du', 'blats/%s.snipt'%item])
#	print check_output(['sed', '1,5d', item, '>', 'blats/%s.snipt'%item])
		os.system('sort -k1,1 -r BLATs/%s.snipt > BLATs/%s.snipt.sortd'%tuple([item, item]))
		os.system('head -n3 BLATs/%s.snipt.sortd > BLATs/%s.snipt.sortd.clipt'%tuple([item, item]))


		r1, r2 = 0, 0

		try:

			scores = []
			with open('BLATs/%s.snipt.sortd.clipt'%item, 'rb') as csvfile:
				spamreader = csv.reader(csvfile, delimiter='\t')
				for row in spamreader:
					scores.append(float(row[0]))
		
			r1, r2 = scores[1]/scores[0], scores[2]/scores[1]
	
		except IndexError:
			pass

		if r1 < 0.75 or r2 < 0.75:#if there is a "step-down" in score values
			print "High quality!"
		#curr.execute('UPDATE sequence SET blat_warning = 0 WHERE sequence.id = %s;'%number)
			print
		else:
			#curr.execute('UPDATE sequence SET blat_warning = 1 WHERE sequence.id = %s;'%number)
			os.remove("BLATs/%s*"%item)
			print "BLAT DISASTER"
			print


#conn.commit()
#curr.close()
#conn.close()




