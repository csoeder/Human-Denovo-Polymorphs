import csv
import sys
import numpy as np
import matplotlib 
matplotlib.use('agg')
from matplotlib import pyplot as plt
from Bio import SeqIO
from subprocess import call, check_output

mer_de_noms = check_output("bjobs -w | grep grind | cut -f 3 -d _ | cut -f 1 -d ' ' | sort | uniq", shell=True).split('\n')[:-1]

for name in mer_de_noms:
	dats = check_output("for jorb in $(bjobs -w | grep RUN | grep %s | grep grind | cut -f 1 -d ' '); do c=$(bpeek $jorb | grep -c ccumulated); echo $c ; done"%tuple([name]), shell=True)

	cleandats =[]
	for d in dats.split('\n')[:-1]:
		cleandats.append(float(d)/2)
	if len(cleandats) > 0:
		plt.hist(cleandats, bins=25, histtype='step')



plt.show()
plt.savefig("Progress_Histogram.png")






