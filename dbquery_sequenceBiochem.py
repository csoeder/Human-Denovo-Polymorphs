import matplotlib 
matplotlib.use('agg')
import psycopg2
from Bio.Seq import Seq
from Bio.SeqUtils.ProtParam import ProteinAnalysis as Analyze
import sys
import matplotlib.pyplot as plt

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)
curr= conn.cursor()

curr.execute("SELECT seq FROM sequence where sequence_pk IN (SELECT seq FROM find WHERE find.loc IN (SELECT location_pk FROM location WHERE location.poly IS TRUE and gor_noncoding IS TRUE AND pan_noncoding IS TRUE AND handchecked IS NOT FALSE AND lookback_clean IS TRUE LIMIT 10));")

pI_list = []
aroma_list = []
hydrophobe_list=[]
instability_list=[]


for seq in curr.fetchall():
	seq_nt = seq[0]
	seq_aa=Seq(seq_nt).translate().tostring()

	pI_list.append( Analyze(seq_aa).isoelectric_point() )
	aroma_list.append( Analyze(seq_aa).aromaticity() )
	hydrophobe_list.append(Analyze(seq_aa.replace("*","")).gravy())
	instability_list.append(Analyze(seq_aa.replace("*","")).instability_index() )



plt.boxplot(pI_list)
plt.title("Distribution of Calculated pI's")
plt.ylabel('pI')
plt.savefig('pI_distribution.png')
plt.close()

plt.boxplot(aroma_list)
plt.title("Distribution of Calculated Aromaticities")
plt.ylabel('Aromaticity')
plt.savefig('Aromaticity_distribution.png')
plt.close()

plt.boxplot(hydrophobe_list)
plt.title("Distribution of Calculated Hydrophobicities")
plt.ylabel('Gravy')
plt.savefig('Hydrophobicity_distribution.png')
plt.close()

plt.boxplot(instability_list)
###	Add a line at the 40-cutoff?
plt.title("Distribution of Calculated Protein Instabilities")
plt.ylabel('Instability Index')
plt.savefig('Instability_distribution.png')
plt.close()
