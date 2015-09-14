"""
A script to load orthologous primate locations into the DB
"""

import psycopg2
import sys
import vcf
from subprocess import check_output

chimp_genome="/netscr/csoeder/1kGen/data/chimp/panTro4.fa"
gorilla_genome="/netscr/csoeder/1kGen/data/gorilla/gorGor3.fa"

pwd = sys.argv[1]	#password
conn = psycopg2.connect("dbname=denovogenes user=gene password=%s host=bioapps.its.unc.edu"%pwd)

curr = conn.cursor()


######

print check_output("cat chimpCheck.psl | awk '{if($10==%s)print;}' | psl2bed | cut -f 1,2,3 " % tuple([90]), shell=True)

curr.execute("SELECT location_pk FROM location WHERE location.poly IS TRUE and location.pan_noncoding IS TRUE AND location.gor_noncoding IS TRUE AND location.lookback_clean IS TRUE AND location.handchecked IS NOT FALSE AND location.lookback_clean IS TRUE;")
places = curr.fetchall()

for loc in places:
	print loc
	loc_string = check_output("cat chimpCheck.psl | grep -v -E 'rand|Un|CABD' | awk '{if($10==%s)print;}'  | psl2bed | cut -f 1,2,3 " % tuple(loc), shell=True)
	print loc_string
	for ortholog in loc_string.splitlines():
		seq_query = check_output("samtools faidx %s %s:%s-%s "%tuple([chimp_genome, ortholog.split('\t')[0], int(ortholog.split('\t')[1])+1, ortholog.split('\t')[2]]), shell=True)
		sequence = ''.join(seq_query.split('\n')[1:]).upper()
		curr.execute('INSERT INTO sequence (seq, ref) VALUES (%s, %s);', tuple([sequence, 'panTro4']))
		conn.commit()
		curr.execute("SELECT sequence_pk FROM sequence WHERE ref='panTro4' AND seq='%s';"%tuple([sequence]));
		seq_pk = curr.fetchone()[0]
		curr.execute('INSERT INTO chimp_location (chrom, start, stop, human_loc, ref, sequence) VALUES (%s, %s, %s, %s, %s, %s);', tuple([ortholog.split('\t')[0], int(ortholog.split('\t')[1]), ortholog.split('\t')[2], loc[0], 'panTro4', seq_pk]))
		conn.commit()
		

for loc in places:
	loc_string = check_output("cat gorillaCheck.psl | grep -v -E 'rand|Un|CABD' | awk '{if($10==%s)print;}'  | psl2bed | cut -f 1,2,3 " % tuple(loc), shell=True)
	print loc_string
	for ortholog in loc_string.splitlines():
		seq_query = check_output("samtools faidx %s %s:%s-%s "%tuple([gorilla_genome, ortholog.split('\t')[0], int(ortholog.split('\t')[1])+1, ortholog.split('\t')[2]]), shell=True)
		sequence = ''.join(seq_query.split('\n')[1:]).upper()
		curr.execute('INSERT INTO sequence (seq, ref) VALUES (%s, %s);', tuple([sequence, 'gorGor3']))
		conn.commit()
		curr.execute("SELECT sequence_pk FROM sequence WHERE ref='gorGor3' AND seq='%s';"%tuple([sequence]));
		seq_pk = curr.fetchone()[0]
		curr.execute('INSERT INTO chimp_location (chrom, start, stop, human_loc, ref, sequence) VALUES (%s, %s, %s, %s, %s, %s);', tuple([ortholog.split('\t')[0], int(ortholog.split('\t')[1]), ortholog.split('\t')[2], loc[0], 'gorGor3', seq_pk]))
		conn.commit()



#curr.execute("CREATE TABLE sequence ( sequence_pk serial PRIMARY KEY, seq text, ref varchar(20), meta text);")

	

#curr.execute("CREATE TABLE chimp_location ( panLoc_pk serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, human_loc int, ref varchar(20), sequence serial references sequence(sequence_pk), pan145_cov float(10), pan146_cov float(10), meta text ) ;")



#curr.execute("CREATE TABLE gorilla_location ( gorLoc_pk serial PRIMARY KEY, chrom varchar(20), start bigint, stop bigint, human_loc int, ref varchar(20), sequence serial references sequence(sequence_pk), gor142_cov float(10), gor143_cov float(10), meta text ) ;")



# try:#is the location already entered in the database, ie, this site has been detected as expressed?
# 	curr.execute("SELECT id, chrom, start, stop FROM location;")
# 	loc_sites = curr.fetchall()

# 	for site in loc_sites:
# 		parser = vcf.Reader(open('vcf_file','r'))
# 		fetch = parser.fetch(loc_sites[1], loc_sites[2], loc_sites[3])
# 		for rec in fetch:
# 			alts = ''
# 			for var in rec.ALT:
# 				alts = '%s%s,'%tuple([alts, var])
# 			curr.execute('INSERT INTO variant (chrom, pos, ref_allele, alt_alleles, hom_refs, hom_alts, hets, heterozygosity, is_snp, is_indel, pi_hat) VALUES (chr%s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s);', tuple([rec.CHROM, rec.POS, rec.REF, alts]))
# 			alts = ''



# except TypeError:#if not, put it into the appropriate table
# 	curr.execute('INSERT INTO location (chrom, start, stop, ref) VALUES (%s, %s, %s, %s);', tuple([chro, begin, end, 'hg19']))
# 	curr.execute("SELECT id FROM location WHERE chrom = %s AND start = %s AND stop = %s AND ref = 'hg19';", tuple([chro, begin, end]))
# 	loc_pk = curr.fetchone()[0]





conn.commit()

curr.close()
conn.close()







