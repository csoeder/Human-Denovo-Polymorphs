###
#For each gene, go back and check that no copies have been missed.
import psycopg2
import sys
import os
from numpy import mean
import csv
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
import pysam
import numpy as np
from subprocess import call, check_output

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()


missing_dict = {}	#	Were any sequences missing when the transcriptomes were reexamined?
unexpected_dict = {}#	Did any sequences appear in new individuals when the transcriptomes were reexamined?
start_dict = {}	#		All finds from the DB

###	0	:	DBpull

curr.execute("SELECT id, chrom, start, stop FROM location;")
all_places = curr.fetchall()
curr.execute("SELECT id, source, loc, seq FROM find;")
all_finds = curr.fetchall()
curr.execute("SELECT id, pk FROM person;")
all_peeps = curr.fetchall()





###	1	:	Grep the sequence

phial = open('lookback.fasta', 'w')
for find in all_finds:
	if find[2] in start_dict.keys():
		start_dict[find[2]].append(find[1])
	else:
		start_dict[find[2]] = [find[1]]
		curr.execute("SELECT seq FROM sequence WHERE sequence.id=%s"%find[3])	
		seq = curr.fetchone()[0]
		phial.write('>%s\n'%str(find[2]))
		phial.write('%s\n'%seq)
phial.close()

###	2	:	align it to ALL the transcriptomes

for d00d in all_peeps:
#	os.system('bsub -J DBlookback_%s -o DBlookback_%s.lsf.out "bwa mem %s/Trinity_files.Trinity.fasta lookback.fasta | samtools view -Sbh | samtools sort - -f %s/%s_lookback.bam" &'%tuple([d00d[0]]*5))
	os.system('bsub -J DBlookback_%s -o DBlookback_%s.lsf.out "bwa mem %s/Trinity_files.Trinity.fasta lookback.fasta | samtools view -Sbh - | samtools sort - -f %s/%s_lookback.bam" &'%tuple([d00d[0]]*5))
for d00d in all_peeps:
	os.system('bsub -J retromap_%s -w "done(DBlookback_%s)" -o retromap_%s.lsf.out "samtools view -b -F4 %s/%s_lookback.bam | bedtools bamtobed -i - > %s/%s_lookback.bed " &'%tuple([d00d[0]]*7))
os.system('while [[ `bjobs -w | grep retromap_ | wc -l` -gt 0 ]]; do sleep 60; bar=$(); f="#"; percent=$((100*$(bjobs -w | grep retromap_ | wc -l)/%s)) ; for (( c=1; c<=$((100-$percent)); c++)); do bar=$bar$f; done; echo -ne "$percent%% remaining $bar\r" ; done; echo "\n" '%tuple([len(all_peeps)]) )


###	3	:	play hide and seq

retro_dict={}
for d00d in all_peeps:
	ret_list =np.array(check_output('cut -f 4 %s/%s_lookback.bed | sort | uniq'%tuple([d00d[0]]*2), shell=True).split('\n'))
	retro_dict[d00d[1]] = list(ret_list[ret_list!=''])

print retro_dict
old_dict = {}
for i in retro_dict.keys():
	old_dict[i] = len(retro_dict[i])

for fund in all_finds:
	retro_dict[fund[1]].pop(retro_dict[fund[1]].index(str(fund[2])))

new_dict = {}
for i in retro_dict.keys():
        new_dict[i] = len(retro_dict[i])


for key in retro_dict.keys():
	#print "%s had was retroactively detected in %s individuals.\n"%tuple([key, len(retro_dict[key])])
	print i, old_dict[key], new_dict[key]




###	4	:	add a flag field to the DB?





curr.close()
conn.close()

os.remove('lookback.fasta')
