import matplotlib 
import sys
import matplotlib.pyplot as plt
import csv
import scipy.stats as stats
import numpy as np

anom_file = 'auxtrans_anom.CPAT.dat'
known_file = 'auxtrans_known.CPAT.dat'
mrna_file = 'auxtrans_mrna.CPAT.dat'
coding_file = 'auxtrans_coding.CPAT.dat'
noncoding_file = 'auxtrans_noncoding.CPAT.dat'
candidates_file = 'candidates.CPAT.dat'

def file_to_dict(csv_in):
	with open(csv_in, 'rb') as csvfile:
		dict_out={}
		dict_out['coding_prob']= []
		dict_out['orf_len'] = []
		dict_out['orf_cov'] = []
		dict_out['fickett'] = []
		dict_out['hexamer'] = []

		spamreader = csv.reader(csvfile, delimiter='\t')
		for row in spamreader:
			dict_out['coding_prob'].append( float(row[1]))
			dict_out['orf_len'].append(float(row[2]))
			dict_out['orf_cov'].append( float(row[3]))
			dict_out['fickett'].append(float(row[4]))
			dict_out['hexamer'].append( float(row[5]))

	return dict_out




anomtrans_dict = file_to_dict(anom_file)
knowntrans_dict = file_to_dict(known_file)
mrna_dict = file_to_dict(mrna_file)
coding_dict = file_to_dict(coding_file)
noncoding_dict = file_to_dict(noncoding_file)
candidate_dict = file_to_dict(candidates_file)



n1, bins, patches = plt.hist(mrna_dict['coding_prob'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="refSeq mRNA", log=True)	#log=True?
n2, bins, patches = plt.hist(knowntrans_dict['coding_prob'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="known transcripts", log=True)	#log=True?
n3, bins, patches = plt.hist(coding_dict['coding_prob'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="CPAT test: coding")	#log=True?
n4, bins, patches = plt.hist(anomtrans_dict['coding_prob'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="unknown transcripts", log=True)	#log=True?
n5, bins, patches = plt.hist(noncoding_dict['coding_prob'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="CPAT test: noncoding")	#log=True?
n6, bins, patches = plt.hist(candidate_dict['coding_prob'], histtype='step', bins=50, color='k', label="candidates", log=True)	#log=True?

ceiling = max(list(n1)+list(n2)+list(n3)+list(n4)+list(n5)+list(n6))
#ceiling = max(list(n1)+list(n2)+list(n4)+list(n6))
plt.title("Distribution of CPAT Coding Probability")
plt.ylabel('# transcripts')
plt.xlabel('Coding Probability')
plt.vlines( 0.364 , 0, ceiling) # suggested cutoff value for humans: http://rna-cpat.sourceforge.net/#how-to-choose-cutoff
plt.savefig('transcript_CPATcodingProb.png')
plt.show()
plt.close()



n1, bins, patches = plt.hist(mrna_dict['orf_len'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="refSeq mRNA")	#log=True?
n2, bins, patches = plt.hist(knowntrans_dict['orf_len'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="known transcripts")	#log=True?
n3, bins, patches = plt.hist(coding_dict['orf_len'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="CPAT test: coding")	#log=True?
n4, bins, patches = plt.hist(anomtrans_dict['orf_len'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="unknown transcripts")	#log=True?
n5, bins, patches = plt.hist(noncoding_dict['orf_len'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="CPAT test: noncoding")	#log=True?
n6, bins, patches = plt.hist(candidate_dict['orf_len'], histtype='step', bins=50, color='k', label="candidates")	#log=True?

plt.title("Distribution of CPAT ORF Length Consideration")
plt.ylabel('# transcripts')
plt.xlabel('ORF Length (nt)')
plt.savefig('transcript_CPATorfLength.png')
plt.show()
plt.close()


n1, bins, patches = plt.hist(mrna_dict['orf_cov'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="refSeq mRNA")	#log=True?
n2, bins, patches = plt.hist(knowntrans_dict['orf_cov'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="known transcripts")	#log=True?
n3, bins, patches = plt.hist(coding_dict['orf_cov'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="CPAT test: coding")	#log=True?
n4, bins, patches = plt.hist(anomtrans_dict['orf_cov'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="unknown transcripts")	#log=True?
n5, bins, patches = plt.hist(noncoding_dict['orf_cov'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="CPAT test: noncoding")	#log=True?
n6, bins, patches = plt.hist(candidate_dict['orf_cov'], histtype='step', bins=50, color='k', label="candidates")	#log=True?

plt.title("Distribution of CPAT ORF Coverage Consideration")
plt.ylabel('# transcripts')
plt.xlabel('ORF Coverage (fraction)')
plt.savefig('transcript_CPATorfCoverage.png')
plt.show()
plt.close()


n1, bins, patches = plt.hist(mrna_dict['fickett'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="refSeq mRNA")	#log=True?
n2, bins, patches = plt.hist(knowntrans_dict['fickett'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="known transcripts")	#log=True?
n3, bins, patches = plt.hist(coding_dict['fickett'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="CPAT test: coding")	#log=True?
n4, bins, patches = plt.hist(anomtrans_dict['fickett'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="unknown transcripts")	#log=True?
n5, bins, patches = plt.hist(noncoding_dict['fickett'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="CPAT test: noncoding")	#log=True?
n6, bins, patches = plt.hist(candidate_dict['fickett'], histtype='step', bins=50, color='k', label="candidates")	#log=True?

plt.title("Distribution of CPAT Fickett Score")
plt.ylabel('# transcripts')
plt.xlabel('Fickett Score')
plt.savefig('transcript_CPATfickett.png')
plt.show()
plt.close()

n1, bins, patches = plt.hist(mrna_dict['hexamer'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="refSeq mRNA")	#log=True?
n2, bins, patches = plt.hist(knowntrans_dict['hexamer'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="known transcripts")	#log=True?
n3, bins, patches = plt.hist(coding_dict['hexamer'], histtype='stepfilled', bins=50, color='r', alpha=0.5, label="CPAT test: coding")	#log=True?
n4, bins, patches = plt.hist(anomtrans_dict['hexamer'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="unknown transcripts")	#log=True?
n5, bins, patches = plt.hist(noncoding_dict['hexamer'], histtype='stepfilled', bins=50, color='b', alpha=0.5, label="CPAT test: noncoding")	#log=True?
n6, bins, patches = plt.hist(candidate_dict['hexamer'], histtype='step', bins=50, color='k', label="candidates")	#log=True?

plt.title("Distribution of CPAT Hexamer Score")
plt.ylabel('# transcripts')
plt.xlabel('Hexamer Score')
plt.show()
plt.savefig('transcript_CPAThexamer.png')
plt.close()

