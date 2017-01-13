import argparse

parser = argparse.ArgumentParser(description = 'given an open reading frame, is a SNP synonymous or no?')
parser.add_argument('-b', '--bed', help='gene model in BED format')
parser.add_argument('-c', '--chrom', help='variant chromosome location')
parser.add_argument('-p', '--pos', help='variant position')

args = parser.parse_args()

print args.bed