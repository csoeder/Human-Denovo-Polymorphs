import matplotlib 
import sys
import matplotlib.pyplot as plt
import csv
import scipy.stats as stats
import numpy as np

candidates_file = 'candidates.cai.dat'
intergenic_file = 'intergenic.cai.dat'
nonexonic_file='non_exonic.cai.dat'
cds_file = 'cds.cai.dat'



def file_to_dict(csv_in):
	with open(csv_in, 'rb') as csvfile:
		dict_out={}
		dict_out['cai']= []

		spamreader = csv.reader(csvfile, delimiter='\t')
		for row in spamreader:
			dict_out['cai'].append( float(row[1]))

	return dict_out

candidates_dict = file_to_dict(candidates_file)
intergenic_dict = file_to_dict(intergenic_file)
nonexonic_dict = file_to_dict(nonexonic_file)
cds_dict = file_to_dict(cds_file)


x=[1,2,3,4]
labels = ['de novo', 'intergenic','non-exonic', 'genic']
print "Codon Adaptation Index was calculated with codon frequencies from Nakamura, Y., Gojobori, T., & Ikemura, T. (1999) (http://www.kazusa.or.jp/codon/) "
print "de novo candidates had a CAI of	%s +/- %s." % tuple([np.mean(candidates_dict['cai']), 2*np.std(candidates_dict['cai'])])
tee, pea = stats.ttest_ind(candidates_dict['cai'], intergenic_dict['cai'], equal_var = False)
print "compare this to a CAI of"
print"		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['cai']), 2*np.std(intergenic_dict['cai']), pea])
tee, pea = stats.ttest_ind(candidates_dict['cai'], nonexonic_dict['cai'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['cai']), 2*np.std(nonexonic_dict['cai']), pea])
tee, pea = stats.ttest_ind(candidates_dict['cai'], cds_dict['cai'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['cai']), 2*np.std(cds_dict['cai']), pea])
print

plt.boxplot([ candidates_dict['cai'], intergenic_dict['cai'], nonexonic_dict['cai'], cds_dict['cai']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of CAI's")
plt.ylabel('CAI')
plt.subplots_adjust(bottom=0.15)
plt.savefig('sequence_CAIdistribution.png')
plt.show()

plt.close()

