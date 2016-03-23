import matplotlib 
import sys
import matplotlib.pyplot as plt
import csv
import scipy.stats as stats
import numpy as np

candidates_file = 'candidates.biochem.dat'
intergenic_file = 'intergenic.biochem.dat'
nonexonic_file='non_exonic.biochem.dat'
cds_file = 'cds.biochem.dat'



def file_to_dict(csv_in):
	with open(csv_in, 'rb') as csvfile:
		dict_out={}
		dict_out['pI']= []
		dict_out['aroma'] = []
		dict_out['gravy'] = []
		dict_out['Instabilities'] = []
		dict_out['gc'] = []

		spamreader = csv.reader(csvfile, delimiter='\t')
		for row in spamreader:
			try:
				dict_out['pI'].append( float(row[1]))
				dict_out['aroma'].append(float(row[2]))
				dict_out['gravy'].append( float(row[3]))
				dict_out['Instabilities'].append(float(row[4]))
				dict_out['gc'].append( float(row[5]))
			except ValueError:
				pass

	return dict_out

candidates_dict = file_to_dict(candidates_file)
intergenic_dict = file_to_dict(intergenic_file)
nonexonic_dict = file_to_dict(nonexonic_file)
cds_dict = file_to_dict(cds_file)


x=[1,2,3,4]
labels = ['de novo', 'intergenic','non-exonic', 'genic']

print "de novo candidates had a pI of	%s +/- %s." % tuple([np.mean(candidates_dict['pI']), 2*np.std(candidates_dict['pI'])])
tee, pea = stats.ttest_ind(candidates_dict['pI'], intergenic_dict['pI'], equal_var = False)
print "compare this to a pI of"
print"		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['pI']), 2*np.std(intergenic_dict['pI']), pea])
tee, pea = stats.ttest_ind(candidates_dict['pI'], nonexonic_dict['pI'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['pI']), 2*np.std(nonexonic_dict['pI']), pea])
tee, pea = stats.ttest_ind(candidates_dict['pI'], cds_dict['pI'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['pI']), 2*np.std(cds_dict['pI']), pea])
print

plt.boxplot([ candidates_dict['pI'], intergenic_dict['pI'], nonexonic_dict['pI'], cds_dict['pI']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of Calculated pI's")
plt.ylabel('pI')
plt.subplots_adjust(bottom=0.15)
plt.savefig('sequenceBiochem_pIdistribution.png')
plt.show()
plt.close()

print "aromaticity index: the fraction of aromatic residues (tryptophan, phenylalanine, tyrosine) ( Lobry, 1994.)"
print "de novo candidates had an aromaticity index of	%s +/- %s." % tuple([np.mean(candidates_dict['aroma']), 2*np.std(candidates_dict['aroma'])])
tee, pea = stats.ttest_ind(candidates_dict['aroma'], intergenic_dict['aroma'], equal_var = False)
print "compare this to a aromaticity index of"
print "		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['aroma']), 2*np.std(intergenic_dict['aroma']), pea])
tee, pea = stats.ttest_ind(candidates_dict['aroma'], nonexonic_dict['aroma'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['aroma']), 2*np.std(nonexonic_dict['aroma']), pea])
tee, pea = stats.ttest_ind(candidates_dict['aroma'], cds_dict['aroma'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['aroma']), 2*np.std(cds_dict['aroma']), pea])
print


plt.boxplot([candidates_dict['aroma'], intergenic_dict['aroma'], nonexonic_dict['aroma'], cds_dict['aroma']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of Calculated Aromaticities")
plt.ylabel('aromaticity index')
plt.subplots_adjust(bottom=0.15)
plt.savefig('sequenceBiochem_aromaticitydistribution.png')
plt.show()
plt.close()

print "Hydrophobicity is measured with the Kyte and Doolittle Gravy Index; large numbers indicate more hydrophobicity"
print "de novo candidates had an gravy index of	%s +/- %s." % tuple([np.mean(candidates_dict['gravy']), 2*np.std(candidates_dict['gravy'])])
tee, pea = stats.ttest_ind(candidates_dict['gravy'], intergenic_dict['gravy'], equal_var = False)
print "compare this to a gravy index of"
print "		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['gravy']), 2*np.std(intergenic_dict['gravy']), pea])
tee, pea = stats.ttest_ind(candidates_dict['gravy'], nonexonic_dict['gravy'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['gravy']), 2*np.std(nonexonic_dict['gravy']), pea])
tee, pea = stats.ttest_ind(candidates_dict['gravy'], cds_dict['gravy'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['gravy']), 2*np.std(cds_dict['gravy']), pea])
print

plt.boxplot([ candidates_dict['gravy'],intergenic_dict['gravy'], nonexonic_dict['gravy'], cds_dict['gravy']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of Calculated Hydrophobicities")
plt.ylabel('gravy')
plt.savefig('sequenceBiochem_hydrophobicitydistribution.png')
plt.show()
plt.close()

print "Instability index: values over 40 indicate a short half-life (Guruprasad et al 1990)"
print "de novo candidates had an Instability index of	%s +/- %s." % tuple([np.mean(candidates_dict['Instabilities']), 2*np.std(candidates_dict['Instabilities'])])
tee, pea = stats.ttest_ind(candidates_dict['Instabilities'], intergenic_dict['Instabilities'], equal_var = False)
print "compare this to an Instability index of"
print "		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['Instabilities']), 2*np.std(intergenic_dict['Instabilities']), pea])
tee, pea = stats.ttest_ind(candidates_dict['Instabilities'], nonexonic_dict['Instabilities'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['Instabilities']), 2*np.std(nonexonic_dict['Instabilities']), pea])
tee, pea = stats.ttest_ind(candidates_dict['Instabilities'], cds_dict['Instabilities'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['Instabilities']), 2*np.std(cds_dict['Instabilities']), pea])
print

plt.boxplot([ candidates_dict['Instabilities'], intergenic_dict['Instabilities'], nonexonic_dict['Instabilities'], cds_dict['Instabilities']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of Calculated Instabilities")
plt.ylabel('Instability Index')
plt.savefig('sequenceBiochem_Instabilitydistribution.png')
plt.show()
plt.close()


print "de novo candidates had an GC%% of	%s +/- %s." % tuple([np.mean(candidates_dict['gc']), 2*np.std(candidates_dict['gc'])])
tee, pea = stats.ttest_ind(candidates_dict['gc'], intergenic_dict['gc'], equal_var = False)
print "compare this to an GC% of"
print "		%s +/- %s in intergenic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(intergenic_dict['gc']), 2*np.std(intergenic_dict['gc']), pea])
tee, pea = stats.ttest_ind(candidates_dict['gc'], nonexonic_dict['gc'], equal_var = False)
print"		%s +/- %s in non-exonic ORFs (two-sided t-test p-value %s )" % tuple([np.mean(nonexonic_dict['gc']), 2*np.std(nonexonic_dict['gc']), pea])
tee, pea = stats.ttest_ind(candidates_dict['gc'], cds_dict['gc'], equal_var = False)
print"		%s +/- %s in coding sequence ORFs (two-sided t-test p-value %s )" % tuple([np.mean(cds_dict['gc']), 2*np.std(cds_dict['gc']), pea])
print

plt.boxplot([candidates_dict['gc'], intergenic_dict['gc'], nonexonic_dict['gc'], cds_dict['gc']])
plt.xticks(x, labels, rotation=30)
plt.title("Distribution of GC Content")
plt.ylabel('%% GC')
plt.savefig('sequenceBiochem_GCdistribution.png')
plt.show()
plt.close()

