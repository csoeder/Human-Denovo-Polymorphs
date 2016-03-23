import matplotlib 
import sys
import matplotlib.pyplot as plt
import csv
import scipy.stats as stats
import numpy as np

candidates_file = 'candidates.seqlen.dat'
intergenic_file = 'intergenic.seqlen.dat'
nonexonic_file='non_exonic.seqlen.dat'
cds_file = 'cds.seqlen.dat'



def file_to_dict(csv_in):
	with open(csv_in, 'rb') as csvfile:
		dict_out={}
		dict_out['length']= []

		spamreader = csv.reader(csvfile, delimiter='\t')
		for row in spamreader:
			dict_out['length'].append( float(row[0]))

	return dict_out

candidates_dict = file_to_dict(candidates_file)
intergenic_dict = file_to_dict(intergenic_file)
nonexonic_dict = file_to_dict(nonexonic_file)
cds_dict = file_to_dict(cds_file)


x=[1,2,3,4]
labels = ['de novo', 'intergenic','non-exonic', 'genic']
print "de novo candidates had a sequence length of	%s +/- %s nt." % tuple([np.mean(candidates_dict['length']), 2*np.std(candidates_dict['length'])])
tee, pea = stats.ttest_ind(candidates_dict['length'], intergenic_dict['length'], equal_var = False)
print "compare this to a sequence length of"
print"		%s +/- %s nt in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['length']), 2*np.std(intergenic_dict['length']), pea])
tee, pea = stats.ttest_ind(candidates_dict['length'], nonexonic_dict['length'], equal_var = False)
print"		%s +/- %s nt in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['length']), 2*np.std(nonexonic_dict['length']), pea])
tee, pea = stats.ttest_ind(candidates_dict['length'], cds_dict['length'], equal_var = False)
print"		%s +/- %s nt in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['length']), 2*np.std(cds_dict['length']), pea])
print

plt.boxplot([ candidates_dict['length'], intergenic_dict['length'], nonexonic_dict['length'], cds_dict['length']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of sequence lengths")
plt.ylabel('sequence length (nt)')
plt.subplots_adjust(bottom=0.15)
plt.savefig('sequence_lengthComparison.png')
plt.show()
plt.close()



n, bins, patches = plt.hist(candidates_dict['length'], bins=15)
plt.xlabel('Gene Length (nt)')
plt.ylabel('Number of Genes')
plt.title('Histogram of Gene lengths')
plt.savefig('sequence_lengthHistogram.png')
plt.show()
plt.close()








