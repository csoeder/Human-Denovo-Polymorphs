import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqUtils.CodonUsage import CodonAdaptationIndex
import sys
import matplotlib.pyplot as plt




###	http://www.kazusa.or.jp/codon/
Codon_Index={'TTT':0.46,
'TTC':0.54,
'TTA':0.08,
'TTG':0.13,
'CTT':0.13,
'CTC':0.20,
'CTA':0.07,
'CTG':0.40,
'ATT':0.36,
'ATC':0.47,
'ATA':0.17,
'ATG':1.00,
'GTT':0.18,
'GTC':0.24,
'GTA':0.12,
'GTG':0.46,
'TCT':0.19,
'TCC':0.22,
'TCA':0.15,
'TCG':0.05,
'CCT':0.29,
'CCC':0.32,
'CCA':0.28,
'CCG':0.11,
'ACT':0.25,
'ACC':0.36,
'ACA':0.28,
'ACG':0.11,
'GCT':0.27,
'GCC':0.40,
'GCA':0.23,
'GCG':0.11,
'TAT':0.44,
'TAC':0.56,
'TAA':0.30,
'TAG':0.24,
'CAT':0.42,
'CAC':0.58,
'CAA':0.27,
'CAG':0.73,
'AAT':0.47,
'AAC':0.53,
'AAA':0.43,
'AAG':0.57,
'GAT':0.46,
'GAC':0.54,
'GAA':0.42,
'GAG':0.58,
'TGT':0.46,
'TGC':0.54,
'TGA':0.47,
'TGG':1.00,
'CGT':0.08,
'CGC':0.18,
'CGA':0.11,
'CGG':0.20,
'AGT':0.15,
'AGC':0.24,
'AGA':0.21,
'AGG':0.21,
'GGT':0.16,
'GGC':0.34,
'GGA':0.25,
'GGG':0.25,}

CAI = CodonAdaptationIndex()
CAI.set_cai_index(Codon_Index)



def calculate_CAI(sequence_list):
	CAI_list=[]
	for seq_nt in sequence_list:
		CAI_list.append(CAI.cai_for_gene(seq_nt.upper()))
	return CAI_list




# def calculate_biochem(sequence_list):
# 	pI_list = []
# 	aroma_list = []
# 	hydrophobe_list=[]
# 	instability_list=[]
# 	for seq_aa in sequence_list:
# 		pI_list.append( Analyze(seq_aa).isoelectric_point() )
# 		aroma_list.append( Analyze(seq_aa).aromaticity() )
# 		hydrophobe_list.append(Analyze(seq_aa.replace("*","")).gravy())
# 		instability_list.append(Analyze(seq_aa.replace("*","")).instability_index() )
# 	return [pI_list, aroma_list, hydrophobe_list, instability_list]


pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

deNovo_seqs=[]
curr.execute("SELECT seq FROM sequence where sequence_pk IN (SELECT seq FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE and gor_noncoding IS TRUE AND pan_noncoding IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE LIMIT 10));")
for seq in curr.fetchall():
	deNovo_seqs.append(seq[0])

intergenic_seqs=[]
handle = open("intergenic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	intergenic_seqs.append(rec.seq.tostring())

intronic_seqs=[]
handle = open("intronic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	intronic_seqs.append(rec.seq.tostring())

genic_seqs=[]
handle = open("genic_ORFs.fa", "rU")
records = list(SeqIO.parse(handle, "fasta"))
handle.close()
for rec in records:
	genic_seqs.append(rec.seq.tostring())


deNovo_stats = calculate_CAI(deNovo_seqs)
intergenic_stats = calculate_CAI(intergenic_seqs)
intronic_stats = calculate_CAI(intronic_seqs)
genic_stats = calculate_CAI(genic_seqs)

fig, ax1=plt.subplots()
xtickNames = plt.setp(ax1, xticklabels=['intergenic','intronic','de novo', 'CDS'])
plt.setp(xtickNames, rotation=45, fontsize=12)
plt.boxplot([intergenic_stats, intronic_stats, deNovo_stats, genic_stats])
plt.title("Distribution of Codon Adaptation Indicies")
plt.ylabel('CAI')
# plt.show()
plt.savefig('CAI_distribution.png')
plt.close()

