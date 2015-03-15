#	http://www.walkingrandomly.com/?p=5215
import matplotlib
matplotlib.use('agg')
from matplotlib import pyplot as plt
from scipy.optimize import curve_fit
from math import e, factorial, sqrt, log
import numpy as np
import csv
import sys
from scipy.stats import poisson

file_in = sys.argv[1]

#def Poisson_Model(k, lamb):	#	Define the Poisson distribution so that we 
#can fit to it
#	return (np.power(lamb, k) * np.exp(-k)/np.array(map(factorial, k)))

def Poisson_Model(k, lamb):
	poison = poisson(lamb)
	return poison.pmf(k)

with open(file_in, 'rb') as f:
    reader = csv.reader(f, delimiter='\t')
    dats= reader.next()

per_nt_coverage = map(float, dats[:-1])
coverage_range = list(set(per_nt_coverage))
coverage_range.sort()

coverage_freq = []
for cov in coverage_range:
	coverage_freq.append(per_nt_coverage.count(cov)/float(len(per_nt_coverage)))
coverage_range=np.array(coverage_range)
coverage_freq=np.array(coverage_freq)



lambduh, pcov = curve_fit(Poisson_Model, coverage_range[coverage_range<20], coverage_freq[coverage_range<20])
#	popt contains optimized fit parameters, ie lambda
lambduh = lambduh[0]
print "Poisson lambda:	%s"%lambduh
print "Modeled mean: %s"%lambduh
print "95%% Confidence Interval: (%s - %s)"%tuple([max(0, lambduh-2*sqrt(lambduh)), lambduh+2*sqrt(lambduh)])
print "Median bounds: (%s - %s)"%tuple([max(0,lambduh-log(2.)), lambduh+1/3.])
pois_fit = Poisson_Model(np.array(coverage_range), lambduh)

plt.subplot(211)
plt.plot(coverage_range, pois_fit, 'b-', label='GLM Poisson Fit')
plt.plot(coverage_range, coverage_freq, 'ro', label="Observed frequency of coverage depth")
plt.title("Background Transcription (in RNA-Seq Coverage) per Base Pair \n in Unannotated Regions")
plt.xlabel("Coverage Depth, in MapSplice-mapped Reads")
plt.ylabel("Proportion of Base Pairs")
plt.xlim(0,20)
plt.legend(loc=1)

plt.subplot(212)
plt.plot(coverage_range, coverage_freq-pois_fit, 'ko-', label="Fit residual")
plt.legend(loc=0)
plt.ylabel('Data-Poisson')
#plt.xlabel("Residuals of Poisson Fit")
plt.savefig('dat_v_model.png')

