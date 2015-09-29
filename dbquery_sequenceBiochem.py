import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqUtils.ProtParam import ProteinAnalysis as Analyze
import sys
import matplotlib.pyplot as plt


def calculate_biochem(sequence_list):
	pI_list = []
	aroma_list = []
	hydrophobe_list=[]
	instability_list=[]
	for seq_aa in sequence_list:
		pI_list.append( Analyze(seq_aa).isoelectric_point() )
		aroma_list.append( Analyze(seq_aa).aromaticity() )
		hydrophobe_list.append(Analyze(seq_aa.replace("*","")).gravy())
		instability_list.append(Analyze(seq_aa.replace("*","")).instability_index() )
	return [pI_list, aroma_list, hydrophobe_list, instability_list]


pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

deNovo_seqs=[]
curr.execute("SELECT seq FROM sequence where sequence_pk IN (SELECT seq FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE and gor_noncoding IS TRUE AND pan_noncoding IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE LIMIT 10));")
for seq in curr.fetchall():
	seq_nt = seq[0]
	seq_aa=Seq(seq_nt).translate().tostring()
	deNovo_seqs.append(seq_aa)

intergenic_seqs=[]
handle = open("intergenic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	intergenic_seqs.append(rec.seq.translate().tostring())

intronic_seqs=[]
handle = open("intronic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	intronic_seqs.append(rec.seq.translate().tostring())

genic_seqs=[]
handle = open("genic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	genic_seqs.append(rec.seq.translate().tostring())


deNovo_stats = calculate_biochem(deNovo_seqs)
intergenic_stats = calculate_biochem(intergenic_seqs)
intronic_stats = calculate_biochem(intronic_seqs)
genic_stats = calculate_biochem(genic_seqs)

fig, ax1=plt.subplots()
xtickNames = plt.setp(ax1, xticklabels=['intergenic','intronic','de novo', 'genic'])
plt.setp(xtickNames, rotation=45, fontsize=12)
plt.boxplot([intergenic_stats[0], intronic_stats[0], deNovo_stats[0], genic_stats[0]])
plt.title("Distribution of Calculated pI's")
plt.ylabel('pI')
# plt.show()
plt.savefig('pI_distribution.png')
plt.close()

fig, ax1=plt.subplots()
xtickNames = plt.setp(ax1, xticklabels=['intergenic','intronic','de novo', 'genic'])
plt.setp(xtickNames, rotation=45, fontsize=12)
plt.boxplot([intergenic_stats[1], intronic_stats[1], deNovo_stats[1], genic_stats[1]])
plt.title("Distribution of Calculated Aromaticities")
plt.ylabel('Aromaticity')
# plt.show()
plt.savefig('Aromaticity_distribution.png')
plt.close()

fig, ax1=plt.subplots()
xtickNames = plt.setp(ax1, xticklabels=['intergenic','intronic','de novo', 'genic'])
plt.setp(xtickNames, rotation=45, fontsize=12)
plt.boxplot([intergenic_stats[2], intronic_stats[2], deNovo_stats[2], genic_stats[2]])
plt.title("Distribution of Calculated Hydrophobicities")
plt.ylabel('Gravy')
# plt.show()
plt.savefig('Hydrophobicity_distribution.png')
plt.close()

fig, ax1=plt.subplots()
xtickNames = plt.setp(ax1, xticklabels=['intergenic','intronic','de novo', 'genic'])
plt.setp(xtickNames, rotation=45, fontsize=12)
plt.boxplot([intergenic_stats[3], intronic_stats[3], deNovo_stats[3], genic_stats[3]])
# ###	Add a line at the 40-cutoff?
plt.title("Distribution of Calculated Protein Instabilities")
plt.ylabel('Instability Index')
# plt.show()
plt.savefig('Instability_distribution.png')
plt.close()
