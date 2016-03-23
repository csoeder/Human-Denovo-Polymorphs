
cat integrated_call_samples.20130502.ALL.ped | grep -v Fam | awk '{print $2,$3,$4,$5,$7}' | sed -e 's/ 1 / M /'| sed -e 's/ 2 / F /' | tr ' ' '\t' > pop_upload.dat 
echo "ALTER TABLE person ADD COLUMN population varchar(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE person ADD COLUMN superpop varchar(10);"| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE person ADD COLUMN sex varchar(5);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE person ADD COLUMN mother varchar(20);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE person ADD COLUMN father varchar(20);" | mysql --user=csoeder --password=tha_snazzle glurge -N

echo "CREATE TABLE temp (name varchar(20), pop varchar(10), sex varchar(5), mom varchar(20), dad varchar(20));" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "LOAD DATA INFILE 'pop_upload.dat' INTO TABLE temp (name, mom, dad, sex, pop) ;" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "update person p, temp t SET p.population=t.pop, p.sex=t.sex, p.mother=t.mom, p.father=t.dad WHERE p.person_name = t.name;" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "INSERT INTO person (population, sex, mother, father) SELECT t.pop, t.sex, t.mom, t.dad FROM temp t WHERE NOT EXISTS (SELECT person_pk FROM person p WHERE p.person_name=t.name) ; " | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "drop table temp;" | mysql --user=csoeder --password=tha_snazzle glurge -N



echo "UPDATE person SET superpop=EAS WHERE population=CHB; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EAS WHERE population=JPT; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EAS WHERE population=CHS; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EAS WHERE population=CDX; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EAS WHERE population=KHV; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EUR WHERE population=CEU; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EUR WHERE population=TSI; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EUR WHERE population=FIN; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EUR WHERE population=GBR; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=EUR WHERE population=IBS; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=YRI; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=LWK; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=GWD; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=MSL; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=ESN; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=ASW; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AFR WHERE population=ACB; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AMR WHERE population=MXL; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AMR WHERE population=PUR; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AMR WHERE population=CLM; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=AMR WHERE population=PEL; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=SAS WHERE population=GIH; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=SAS WHERE population=PJL; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=SAS WHERE population=BEB; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=SAS WHERE population=STU; "| mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE person SET superpop=SAS WHERE population=ITU; "| mysql --user=csoeder --password=tha_snazzle glurge -N
# source; http://www.1000genomes.org/category/frequently-asked-questions/population

## orfs
#orf sequences
echo "ALTER TABLE orf ADD COLUMN sequence text;" | mysql --user=csoeder --password=tha_snazzle glurge -N

echo "select orf_pk, trans, start, stop, person_name from orf; " | mysql --user=csoeder --password=tha_snazzle glurge -N | awk '{print "echo "$1"; samtools faidx individuals/"$5"/Trinity_files.Trinity.fasta "$2":"$3"-"$4" | grep -v comp > orf_"$1"}' | sh
for orf_pk in $( echo "select orf_pk from orf; " | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	sequence=$( cat orf_"$orf_pk" | tr -d '\n' );
	echo "UPDATE orf SET sequence="$sequence" WHERE orf_pk="$orf_pk";" |  mysql --user=csoeder --password=tha_snazzle glurge -N ;
	rm orf_"$orf_pk";
done

#calculate biochem, etc

echo "SELECT orf_pk, sequence FROM orf;" | mysql --user=csoeder --password=tha_snazzle glurge -N > orfs.list
python ORFbiochem_SQLuploadPrepper.py orfs.list orf.biochem.dat
echo "ALTER TABLE orf ADD COLUMN isoelectric_point float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE orf ADD COLUMN aromaticity float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE orf ADD COLUMN hydrophobicity float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE orf ADD COLUMN instability float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE orf ADD COLUMN cai float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "ALTER TABLE orf ADD COLUMN gc float(10);" | mysql --user=csoeder --password=tha_snazzle glurge -N

echo "CREATE TABLE temp (orf_id int, pi float(10), aroma float(10), gravy float(10)), instability (10));" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "LOAD DATA INFILE 'orf.biochem.dat' INTO TABLE temp (orf_id, pi, aroma, gravy, instability, gc, cai) ;" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE orf o, temp t SET o.isoelectric_point=t.pi, o.aromaticity=t.aroma o.hydrophobicity=t.gravy, o.instability=t.instability, o.gc=t.gc, o.cai=t.cai WHERE o.orf_pk = t.orf_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N


###########
## Relevent variants
(current code can be rewritten for this)

cat genome_locations.lookbackClean.compPrim_scrubbed.bed | cut -f 2 -d 'r' > genome_locations.vcfReady.bed
for i in {1..22}; do bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr"$i".phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_"$i".vcf.gz" ; done
bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_X.vcf.gz"
bsub "vcftools --gzvcf /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrY.phase3_integrated_v1a.20130502.genotypes.vcf.gz --bed genome_locations.vcfReady.bed --recode --stdout | bgzip > miniVCF_Y.vcf.gz"

### WAIT UNTIL THAT CHILLS OUT; tabix everything
###	Do it for X and Y too

merge the VCFs??

vcf-merge miniVCF_*.vcf.gz > merged.vcf

bgzip merged.vcf
tabix merged.vcf.gz
python VCF_to_SQLuploadPrepper.py merged.vcf merged # 	---> merged_variant.dat, merged_variantLookup.dat

echo "CREATE TABLE variant ( variant_pk int PRIMARY KEY, chrom varchar(20), pos bigint, ref_allele text, alt_alleles text, heterozygosity float(10), pi_hat float(10), snpDBid text, varType text, varSubtype text, meta text );" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "LOAD DATA INFILE 'merged_variant.dat' INTO TABLE variant (variant_pk, chrom, pos, ref_allele, alt_alleles, heterozygosity, varType, varSubtype, pi_hat, snpDBid) ;" | mysql --user=csoeder --password=tha_snazzle glurge -N
#		variant_sql.write("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"%tuple([variant_pk,"chr%s"%rec.CHROM, rec.POS, rec.REF, alts, hetZyggy(rec), rec.var_type, rec.var_subtype, piHat(rec), rec.ID]))
echo "CREATE TABLE variant_lookup (varlookup_pk int PRIMARY KEY AUTOINCREMENT, variant_id int, person_name varchar(20), genotype varchar(5));" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "LOAD DATA INFILE 'merged_variantLookup.dat' INTO TABLE variant_lookup (variant_id, person_name, genotype) ;" | mysql --user=csoeder --password=tha_snazzle glurge -N

echo "ALTER TABLE candidate ADD COLUMN poly boolean DEFAULT 0;" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "UPDATE candidate c, variant v SET c.poly = 1 WHERE c.chrom=v.chrom AND c.start <= v.pos AND c.stop >= v.pos;" | mysql --user=csoeder --password=tha_snazzle glurge -N



##coverage find & antifind

#/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -a <annotation_file> -o <output_file> input_file1 [input_file2] 

#5column bed to 5 column SAF#
cat candidates.bed | awk '{print $4,$1,$2,$3,$5}' | tr ' ' '\t' > candidates.SAF
/nas02/home/c/s/csoeder/modules/subread-1.5.0-p1-Linux-x86_64/bin/featureCounts -F SAF  -a candidates.SAF -o expression_stats.dat individuals/*/*_mapsplice_alignment.sort.bam
python featureCounts_to_SQLuploadPrepper.py expression_stats.dat expression_stats.dat.summary expression_stats 
cut -f 3 expression_stats.absoluteExpression.dat | paste expression_stats.relativeExpression.dat - > expression_stats.uploadReady.dat 
echo "CREATE TABLE expression (express_pk PRIMARY KEY AUTOINCREMENT int, person_name varchar(20), candidate_id int, FPKM float(10), abs_frag_number flaot(10) );" | mysql --user=csoeder --password=tha_snazzle glurge -N
echo "LOAD DATA INFILE 'expression_stats.uploadReady.dat' INTO TABLE expression (person_name, candidate_id, FPKM, abs_frag_number) ;" | mysql --user=csoeder --password=tha_snazzle glurge -N





## chimp/gor regions mapped to
# 



###
#	Annotate proteomics:
#	location-based (riboSeq)
#	sequence-based (https://www.proteomicsdb.org/#peptideSearch ; http://sysbio.sysu.edu.cn/rpfdb/index.html ?)



###	
#	do a ncRNA comparison ??




###	coding potential
##Wang, L., Park, H. J., Dasari, S., Wang, S., Kocher, J. P., & Li, W. (2013). CPAT: Coding-potential assessment tool using an alignment-free logistic regression model. Nucleic Acids Research, 41(6), 1–7. doi:10.1093/nar/gkt006


############		SOME OF THIS HAPPENS IN PARE_DOWN??




CPAT_DIR="/Users/csoeder/Downloads/CPAT-1.2.1"
cpat.py -g ../../coding.fa -o coding.out -d dat/Human_train.RData -x dat/Human_Hexamer.tab -o output.out


# candidate info: splicing data, lowcov warning
# 


###
#Mouse transcriptome:
#Pervouchine, D. D., Djebali, S., Breschi, A., Davis, C. A., Barja, P. P., Dobin, A., … Gingeras, T. R. (2015). Enhanced transcriptome maps from multiple mouse tissues reveal evolutionary constraint in gene expression. Nature Communications, 6, 5903. doi:10.1038/ncomms6903
#Supp. info table 1


################################################################################################################



######








