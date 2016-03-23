#   via https://www.biostars.org/p/76119/
import sys
import pysam

bamFile    = sys.argv[1];

bamFP = pysam.Samfile(bamFile, "rb");

identity_fraction=0.95
indel_size = 10

lookback_unmapped = open('lookback_unmapped.list', 'w')
lookback_fragmentary = pysam.AlignmentFile("lookback_fragmentary.bam", "wb", header=bamFP.header)
lookback_mapped = pysam.AlignmentFile("lookback_mapped.bam", "wb", header=bamFP.header)

for read in bamFP:
	if read.is_unmapped:
		lookback_unmapped.write('%s\n'%tuple(read.qname))
	else:
		cigarLine=read.cigar

		matches=0
		insrt = 0
		delet = 0
		flag=0
		qLen = float(len(read.query_sequence))

		for (cigarType,cigarLength) in cigarLine:
			try:
				if(  cigarType == 0): #match                 
					matches += cigarLength                           
				elif(cigarType == 1): #insertions
					insrt += cigarLength
				elif(cigarType == 2): #deletion
					delet += cigarLength
				elif(cigarType == 4 or cigarType == 5): #soft clipping #hard clipping
					flag=1
				else:
					print "Wrong CIGAR number"
					sys.exit(1)
			except:
				print "Problem";

		if insrt+delet > indel_size or matches/qLen < identity_fraction or (insrt-delet)%3 != 0 or flag:
			lookback_fragmentary.write(read)
		else:
			lookback_mapped.write(read)

lookback_mapped.close()
lookback_unmapped.close()
lookback_fragmentary.close()

