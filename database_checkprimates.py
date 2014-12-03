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
from subprocess import call, check_output

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr = conn.cursor()

primate_omes = '/netscr/csoeder/1kGen/data/primateomes/'


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

tot_count=0
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


for sample in check_output('ls %s | grep -v the | grep -v out'%primate_omes, shell=True).split('\n'):
	echo $sample
	os.system('bsub -J primalign_%s -o primalign_%s.lsf.out "bwa mem %s/Trinity_files.Trinity.fasta lookback.fasta | samtools view -Sbh - | samtools sort - -f %s/%s_lookback.bam" &'%tuple([sample,sample, '%s/%s'%tuple([primate_omes,sample]), '%s/%s'%tuple([primate_omes,sample]), sample]))
for sample in check_output('ls %s | grep -v the | grep -v out'%primate_omes, shell=True).split('\n'):
	echo $sample
	os.system('bsub -J primmap_%s -w "done(primalign_%s)" -o primmap_%s.lsf.out "samtools view -b -F4 %s/%s_lookback.bam | bedtools bamtobed -i - > %s/%s_lookback.bed " &'%tuple([sample, sample, sample, '%s/%s'%tuple([primate_omes,sample]), sample, '%s/%s'%tuple([primate_omes,sample]), sample]))
os.system('while [[ `bjobs -w | grep primmap_ | wc -l` -gt 0 ]]; do sleep 60; bar=$(); f="#"; percent=$((100*$(bjobs -w | grep retromap_ | wc -l)/%s)) ; for (( c=1; c<=$((100-$percent)); c++)); do bar=$bar$f; done; echo -ne "$percent%% remaining $bar\r" ; done; echo "\n" '%tuple([4]) )


###	3	:	play hide and seq


for sample in check_output('ls %s | grep -v the | grep -v out | grep pan'%primate_omes, shell=True).split('\n'):
	chumps = set(np.array(check_output('cut -f 4 %s/%s_lookback.bed | sort | uniq'%tuple([primate_omes, sample]), shell=True).split('\n')))
for sample in check_output('ls %s | grep -v the | grep -v out | grep gor'%primate_omes, shell=True).split('\n'):
	gorillaz = set(np.array(check_output('cut -f 4 %s/%s_lookback.bed | sort | uniq'%tuple([primate_omes, sample]), shell=True).split('\n')))

print "%s candidates observed in the transcriptomes of both chimp and gorilla: %s\n"%tuple([len(chumps.intersection(gorillaz)), '%s, '*len(chumps.intersection(gorillaz))%tuple(chumps.intersection(gorillaz))])
print "%s candidates were observed in chimps only: %s\n"%tuple([len(chumps.difference(gorillaz)), '%s, '*len(chumps.difference(gorillaz))%tuple(chumps.difference(gorillaz))])
print "%s candidates were observed in gorilla only: %s\n"%tuple([len(gorillaz.difference(chumps)), '%s, '*len(gorillaz.difference(chumps))%tuple(gorillaz.difference(chumps))])
print "%s candidates appeared clean, ie were not observed in either chimps or gorillas.\n"%tuple([tot_count-len(chumps.intersection(gorillaz))-len(chumps.difference(gorillaz))-len(gorillaz.difference(chumps))])

###	4	:	add a flag field to the DB?


curr.close()
conn.close()

os.remove('lookback.fasta')


