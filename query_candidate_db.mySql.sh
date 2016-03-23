
################################################################################################################

# Post-population querying


polymorphic_denovo_SQL="FROM candidate WHERE poly=1"

echo "BASIC FACTS"
echo "~~~~~~~~~~~~~~~~~~~~"

rna_seq_count=$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
echo "Transcriptome measurements, processed through the pipeline, were collected from "$rna_seq_count" individuals."
echo "These "$rna_seq_count" included the following populations:"

for pop in $(echo "SELECT DISTINCT population FROM person WHERE person.rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	echo "\t$pop\t$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.population='$pop';" | mysql --user=csoeder --password=tha_snazzle glurge -N )";
done

echo "and the following sex distribution:"
for sex in $(echo "SELECT DISTINCT sex FROM person WHERE person.rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	echo "\t$sex\t$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.sex='$sex';" | mysql --user=csoeder --password=tha_snazzle glurge -N )";
done

polymorphicdenovo_transcribers_count=$(echo "SELECT count(DISTINCT person_name) FROM precandidate_lookup where precand_id in ( SELECT precand_pk $polymorphic_denovo_SQL );" | mysql --user=csoeder --password=tha_snazzle glurge -N)
polymorphicdenovo_transcribers_fraction=$( echo "scale=2;100*$polymorphicdenovo_transcribers_count/$rna_seq_count" | bc )
echo "Of these, $polymorphicdenovo_transcribers_count ($polymorphicdenovo_transcribers_fraction percent) were observed transcribing at least one polymorphic de novo gene."
echo "These $polymorphicdenovo_transcribers_count transcribers were distributed across the following populations:"

for pop in $(echo "SELECT DISTINCT population FROM person WHERE person.rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
#	echo "\t$pop\t$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.population='$pop';" | mysql --user=csoeder --password=tha_snazzle glurge -N )";
#done
	pop_total=$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.population='$pop';" | mysql --user=csoeder --password=tha_snazzle glurge -N )
	pop_transcribers=$( echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.population='$pop' AND person_name IN (SELECT person_name FROM precandidate_lookup where precand_id in ( SELECT precand_pk $polymorphic_denovo_SQL ));" | mysql --user=csoeder --password=tha_snazzle glurge -N )
	pop_frac=$(echo "scale=2;100*$pop_transcribers/$pop_total" | bc )
	echo "\t$pop\t$pop_transcribers ($pop_frac %)"
done
echo "and the following sex distribution:"
for sex in $(echo "SELECT DISTINCT sex FROM person WHERE person.rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	sex_total=$(echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.sex='$sex';" | mysql --user=csoeder --password=tha_snazzle glurge -N )
	sex_transcribers=$( echo "SELECT count(*) FROM person WHERE person.rna_seq=1 AND person.sex='$sex' AND person_name IN (SELECT DISTINCT person_name FROM precandidate_lookup where precand_id in ( SELECT precand_pk $polymorphic_denovo_SQL ));" | mysql --user=csoeder --password=tha_snazzle glurge -N )
	sex_frac=$(echo "scale=2;100*$sex_transcribers/$sex_total" | bc )
	echo "\t$sex\t$sex_transcribers ($sex_frac %)"
done

##	Graph this?? ^^


total_denovo_count=$(echo "SELECT count(*) $polymorphic_denovo_SQL " | mysql --user=csoeder --password=tha_snazzle glurge -N )

#polymorphic_denovo_SQL="FROM candidate WHERE poly=1


echo "CHROMOSOME DISTRIBUTION"
echo "~~~~~~~~~~~~~~~~~~~~"
chrom_count=$(echo "select count(distinct chrom) $polymorphic_denovo_SQL ;" | mysql --user=csoeder --password=tha_snazzle glurge -N )

echo "The $total_denovo_count genomic loci were spread across $chrom_count chromosomes. $( echo "24-$chrom_count" | bc) chromosomes contained no sites:" 
echo "SELECT DISTINCT chrom FROM candidate WHERE chrom NOT IN (SELECT chrom $polymorphic_denovo_SQL);"  | mysql --user=csoeder --password=tha_snazzle glurge -N

echo "The least populated chromosome :"
echo "SELECT chrom chromosome, count(*) number_genes $polymorphic_denovo_SQL GROUP BY chromosome ORDER BY number_genes LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge
echo "The most populated chromosome :"
echo "SELECT chrom chromosome, count(*) number_genes $polymorphic_denovo_SQL GROUP BY chromosome ORDER BY number_genes DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge
chrom_avg=$(echo "SELECT count(*) number_genes $polymorphic_denovo_SQL GROUP BY chrom;" | mysql --user=csoeder --password=tha_snazzle glurge -N | awk '{ total += $1; count++ } END { print total/count }' )
chrom_median=$( echo "SELECT count(*) number_genes $polymorphic_denovo_SQL GROUP BY chrom ORDER BY number_genes;" | mysql --user=csoeder --password=tha_snazzle glurge -N  | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }' ) 
echo "The mean was $chrom_avg and the median was $chrom_median."

echo "SELECT chrom chromosome, count(*) number_genes $polymorphic_denovo_SQL GROUP BY chrom;" | mysql --user=csoeder --password=tha_snazzle glurge -N > chromosome_distribution.dat
python dbquery_chromsomeDist.py chromosome_distribution.dat


echo "GENES PER PERSON"
echo "~~~~~~~~~~~~~~~~~~~~"
echo "The $total_denovo_count genes found were found in a sample of $rna_seq_count individuals. "
non_expresser_count=$( echo "SELECT count(*) FROM person WHERE person.person_name NOT IN (SELECT DISTINCT person_name FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
echo "Of these $rna_seq_count people investigated, $non_expresser_count had no polymorphic denovo genes detected."
echo "The most genes detected in an individual:"
echo "SELECT count(*) genes_per_person, person_name FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY person_name ORDER BY genes_per_person DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge 
echo "The fewest genes detected in an expressing individual:"
echo "SELECT count(*) genes_per_person, person_name FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY person_name ORDER BY genes_per_person ASC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge 
mean_genes_per_person=$( echo "SELECT count(*) genes_per_person FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY person_name;" | mysql --user=csoeder --password=tha_snazzle glurge -N | tr '\n' '+' | awk '{print "scale=1;(",$0, 0")/'$rna_seq_count'"}' | bc )
#median_genes_per_person=$()
echo "The average gene detected per individual was $mean_genes_per_person ; the median was ____"

#GRAPHIT!
echo "SELECT count(*) genes_per_person, person_name FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY person_name ORDER BY genes_per_person ;" | mysql --user=csoeder --password=tha_snazzle glurge -N > genes_per_person.dat
python dbquery_genesPerPerson.py genes_per_person.dat

echo "PEOPLE PER GENE"
echo "~~~~~~~~~~~~~~~~~~~~"
echo "One or more of the $total_denovo_count gene sites were seen expressed in $(echo "$rna_seq_count - $non_expresser_count" | bc ) individuals, from a total population of $rna_seq_count."
echo "The most commonly expressed gene:"
echo "SELECT count(*) number_expressers, precand_id gene_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY gene_id ORDER BY number_expressers DESC LIMIT 1;" |  mysql --user=csoeder --password=tha_snazzle glurge
singleton_count=$( echo "SELECT count(*) FROM (SELECT count(*)  people_per_gene, precand_id gene_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY gene_id ORDER BY people_per_gene) x WHERE x.people_per_gene=1 ;" |  mysql --user=csoeder --password=tha_snazzle glurge -N )
echo "There were $singleton_count genes sighted which were seen only in a single individual."
mean_people_per_gene=$( echo "SELECT count(*) number_expressers, precand_id gene_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY gene_id ORDER BY number_expressers;" |  mysql --user=csoeder --password=tha_snazzle glurge -N | cut -f 1 | awk '{ total += $1; count++ } END { print total/count }' )
median_people_per_gene=$( echo "SELECT count(*) number_expressers, precand_id gene_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY gene_id ORDER BY number_expressers;" |  mysql --user=csoeder --password=tha_snazzle glurge -N | cut -f 1 | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }' )
echo "The mean individuals expressing a given gene was $mean_people_per_gene and the median was $median_people_per_gene."

#GRAPHIT!
echo "SELECT count(*) number_expressers, precand_id gene_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL ) GROUP BY gene_id ORDER BY number_expressers ;" |  mysql --user=csoeder --password=tha_snazzle glurge -N > people_per_gene.dat
python dbquery_peoplePerGene.py people_per_gene.dat 




######
#Sequence Biochem

#Compare:
#1. Rando intergenic ORFs
###	this occurs in pare_down??
# DATA_DIR='/netscr/csoeder/1kGen/data'
# bedtools makewindows -w 2500 -s 1000 -g $DATA_DIR/hg19.fa.clean.fai | bedtools intersect -split -v -wa -a - -b $DATA_DIR/UCSC_genes.bed $DATA_DIR/refSeq_genes.bed $DATA_DIR/complicated_repeats.bed $DATA_DIR/yalepseudo.bed $DATA_DIR/retroposed*.bed > non_exonic_windows.bed
# bedtools intersect -v -wa -a non_exonic_windows.bed -b $DATA_DIR/UCSC_genes.bed $DATA_DIR/refSeq_genes.bed $DATA_DIR/complicated_repeats.bed $DATA_DIR/yalepseudo.bed $DATA_DIR/retroposed*.bed > fully_intergenic_windows.bed
# bedtools getfasta -fi hg19.fa -bed non_exonic_windows.bed -fo non_exonic_windows.fa
# bedtools getfasta -fi hg19.fa -bed fully_intergenic_windows.bed -fo fully_intergenic_windows.fa
# python $SCRIPT_DIR/ORF_extract.py non_exonic_windows.fa rough_non_exonic_ORFs.fa
# python $SCRIPT_DIR/garbageman.py rough_non_exonic_ORFs.fa non_exonic_ORFs.fa
# python $SCRIPT_DIR/ORF_extract.py fully_intergenic_windows.fa rough_fully_intergenic_ORFs.fa
# python $SCRIPT_DIR/garbageman.py rough_fully_intergenic_ORFs.fa fully_intergenic_ORFs.fa
# grep ">" fully_intergenic_ORFs.fa | cut -f 2 -d ">" > fully_intergenic_ORFs.list
# grep ">" non_exonic_ORFs.fa | cut -f 2 -d ">" > non_exonic_ORFs.list
# for orf in $(python ~/modules/randoLine.py fully_intergenic_ORFs.list 2000); do samtools faidx fully_intergenic_ORFs.fa  $orf; done > fully_intergenic_ORFs.subsample.fa
# for orf in $(python ~/modules/randoLine.py non_exonic_ORFs.list 2000); do samtools faidx non_exonic_ORFs.fa  $orf; done > non_exonic_ORFs.subsample.fa

#2. candidates

#3. Rando known genes
# wget ftp://ftp.ensembl.org/pub/release-83/fasta/homo_sapiens/cds/Homo_sapiens.GRCh38.cds.all.fa.gz
# gzip -d Homo_sapiens.GRCh38.cds.all.fa.gz
# python $SCRIPT_DIR/garbageman.py Homo_sapiens.GRCh38.cds.all.fa Homo_sapiens.trimmedCDS.fa
# grep ">" Homo_sapiens.trimmedCDS.fa | cut -f 2 -d ">" | cut -f 1 -d ' ' > Homo_sapiens.trimmedCDS.list
# for orf in $(python ~/modules/randoLine.py Homo_sapiens.trimmedCDS.list 2000); do samtools faidx Homo_sapiens.trimmedCDS.fa $orf; done > Homo_sapiens.trimmedCDS.subsample.fa


echo "SEQUENCE FACTS"
echo "~~~~~~~~~~~~~~~~~~~~"
distinct_orfs=$(echo "SELECT count(DISTINCT sequence) FROM orf WHERE orf.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) ;" |  mysql --user=csoeder --password=tha_snazzle glurge -N)
echo "The $total_denovo_count genes were expressed as $distinct_orfs distinct sequences."
most_poly=$(echo "SELECT count( DISTINCT o.sequence) seq_count, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id ORDER BY seq_count DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge  -N | cut -f 1 )
mean_poly_orf=$(echo "SELECT count( DISTINCT o.sequence) seq_count, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id;" | mysql --user=csoeder --password=tha_snazzle glurge  -N | cut -f 1 | awk '{ total += $1; count++ } END { print total/count }' )
median_poly_orf=$(echo "SELECT count( DISTINCT o.sequence) seq_count, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id;" | mysql --user=csoeder --password=tha_snazzle glurge  -N | cut -f 1 | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }'  )
echo "The most variant sequences per site observed was $most_poly"
echo "the mean was $mean_poly_orf and the median was $median_poly_orf"
echo "SELECT count( DISTINCT o.sequence) seq_count, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id;" | mysql --user=csoeder --password=tha_snazzle glurge  > flatfile
#Graphit!

min_orf_len=$(echo "SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id ORDER BY seq_len ASC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N | cut -f 1)
max_orf_len=$(echo "SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id ORDER BY seq_len DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N | cut -f 1)
mean_orf_len=$(echo "SELECT avg(x.seq_len) FROM ( SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id) x;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
median_orf_len=$(echo "SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N | cut -f 1 | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }')
echo "SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL)) AND o.old_pk=l.orf_id AND o.person_name=l.person_name;" | mysql --user=csoeder --password=tha_snazzle glurge   > flatfile 
echo "The sequence length varied from $min_orf_len bp to $max_orf_len bp, with a mean and median of $mean_orf_len and $median_orf_len bp, respectively. (ORFs shorter than 75 bp were rejected a priori.)"
echo "For comparison and contrast, a sampling of intergenic, non-exonic, and annotated CDS ORFs (same length filter):"
echo "type\tmin_len\tmedian_len\tmean_len\tmax_len"

min_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='fully_intergenic' ORDER BY len ASC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
max_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='fully_intergenic' ORDER BY len DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
mean_auxorf_len=$(echo "SELECT avg(x.len) FROM (SELECT length(sequence) len FROM auxiliary_orf WHERE type='fully_intergenic') x;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
median_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='fully_intergenic';" | mysql --user=csoeder --password=tha_snazzle glurge -N | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }')
echo "intergenic\t$min_auxorf_len\t$median_auxorf_len\t$mean_auxorf_len\t$max_auxorf_len"

min_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='non_exonic' ORDER BY len ASC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
max_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='non_exonic' ORDER BY len DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
mean_auxorf_len=$(echo "SELECT avg(x.len) FROM (SELECT length(sequence) len FROM auxiliary_orf WHERE type='non_exonic') x;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
median_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='non_exonic';" | mysql --user=csoeder --password=tha_snazzle glurge -N | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }')
echo "non_exonic\t$min_auxorf_len\t$median_auxorf_len\t$mean_auxorf_len\t$max_auxorf_len"

min_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='cds' ORDER BY len ASC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
max_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='cds' ORDER BY len DESC LIMIT 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
mean_auxorf_len=$(echo "SELECT avg(x.len) FROM (SELECT length(sequence) len FROM auxiliary_orf WHERE type='cds') x;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
median_auxorf_len=$(echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='cds';" | mysql --user=csoeder --password=tha_snazzle glurge -N | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }')
echo "CDS\t$min_auxorf_len\t$median_auxorf_len\t$mean_auxorf_len\t$max_auxorf_len"

echo "SELECT length( o.sequence) seq_len, l.precand_id gene_id FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name GROUP BY gene_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N > candidates.seqlen.dat
echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='fully_intergenic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > intergenic.seqlen.dat
echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='non_exonic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > non_exonic.seqlen.dat
echo "SELECT length(sequence) len FROM auxiliary_orf WHERE type='cds';" | mysql --user=csoeder --password=tha_snazzle glurge -N > cds.seqlen.dat
python dbquery_sequenceLength.py 



echo "SEQUENCE BIOCHEMISTRY"
echo "~~~~~~~~~~~~~~~~~~~~"
echo "SELECT l.precand_id, o.isoelectric_point, o.aromaticity, o.hydrophobicity, o.instability, o.gc FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name;" | mysql --user=csoeder --password=tha_snazzle glurge -N > candidates.biochem.dat
echo "SELECT o.auxorf_pk, o.isoelectric_point, o.aromaticity, o.hydrophobicity, o.instability, o.gc FROM auxiliary_orf o where o.type='fully_intergenic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > intergenic.biochem.dat
echo "SELECT o.auxorf_pk, o.isoelectric_point, o.aromaticity, o.hydrophobicity, o.instability, o.gc FROM auxiliary_orf o where o.type='non_exonic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > non_exonic.biochem.dat
echo "SELECT o.auxorf_pk, o.isoelectric_point, o.aromaticity, o.hydrophobicity, o.instability, o.gc FROM auxiliary_orf o where o.type='cds';" | mysql --user=csoeder --password=tha_snazzle glurge -N > cds.biochem.dat
### graph this
python dbquery_sequenceBiochem.py

echo "SEQUENCE CODING ADAPTATION"
echo "~~~~~~~~~~~~~~~~~~~~"
echo "SELECT l.precand_id, o.cai FROM orf o, precandidate_lookup l WHERE o.old_pk IN (SELECT orf_id FROM precandidate_lookup WHERE precand_id IN (SELECT precand_pk $polymorphic_denovo_SQL )) AND o.old_pk=l.orf_id AND o.person_name=l.person_name;" | mysql --user=csoeder --password=tha_snazzle glurge -N > candidates.cai.dat
echo "SELECT o.auxorf_pk, o.cai FROM auxiliary_orf o where o.type='fully_intergenic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > intergenic.cai.dat
echo "SELECT o.auxorf_pk, o.cai FROM auxiliary_orf o where o.type='non_exonic';" | mysql --user=csoeder --password=tha_snazzle glurge -N > non_exonic.cai.dat
echo "SELECT o.auxorf_pk, o.cai FROM auxiliary_orf o where o.type='cds' and o.cai > 0;" | mysql --user=csoeder --password=tha_snazzle glurge -N > cds.cai.dat 
###	ARE THE CDSs OK?
python dbquery_sequenceCAI.py



echo "TRANSCRIPT CODING STATUS"
echo "~~~~~~~~~~~~~~~~~~~~"

#plt.vlines( 0.364 , 0, ceiling) # suggested cutoff value for humans: http://rna-cpat.sourceforge.net/#how-to-choose-cutoff

#echo "SELECT l.precand_id, avg(t.coding_prob), avg(t.orf_len), avg(t.orf_len/t.mrna_len) avg(t.fickett_score), avg(t.hexamer_score) FROM transcript t, candidate c, precandidate_lookup l, orf o WHERE o.trans=t.comp_name AND o.person_name=t.person_name AND o.old_pk=l.orf_id  AND o.person_name = l.person_name GROUP BY l.precand_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N > candidates.CPAT.dat
echo "SELECT l.precand_id, t.coding_prob, t.orf_len, t.orf_len/t.mrna_len, t.fickett_score, t.hexamer_score FROM transcript t, candidate c, precandidate_lookup l, orf o WHERE o.trans=t.comp_name AND o.person_name=t.person_name AND o.old_pk=l.orf_id  AND o.person_name = l.person_name GROUP BY l.precand_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N > candidates.CPAT.dat
echo "SELECT auxtrans_pk, coding_prob, orf_len, orf_len/mrna_len, fickett_score, hexamer_score FROM auxiliary_transcript WHERE type='ils_anom';" | mysql --user=csoeder --password=tha_snazzle glurge -N > auxtrans_anom.CPAT.dat
echo "SELECT auxtrans_pk, coding_prob, orf_len, orf_len/mrna_len, fickett_score, hexamer_score FROM auxiliary_transcript WHERE type='ils_known';" | mysql --user=csoeder --password=tha_snazzle glurge -N > auxtrans_known.CPAT.dat
echo "SELECT auxtrans_pk, coding_prob, orf_len, orf_len/mrna_len, fickett_score, hexamer_score FROM auxiliary_transcript WHERE type='refseq_mrna';" | mysql --user=csoeder --password=tha_snazzle glurge -N > auxtrans_mrna.CPAT.dat
echo "SELECT auxtrans_pk, coding_prob, orf_len, orf_len/mrna_len, fickett_score, hexamer_score FROM auxiliary_transcript WHERE type='cpat_coding';" | mysql --user=csoeder --password=tha_snazzle glurge -N > auxtrans_coding.CPAT.dat
echo "SELECT auxtrans_pk, coding_prob, orf_len, orf_len/mrna_len, fickett_score, hexamer_score FROM auxiliary_transcript WHERE type='cpat_noncoding';" | mysql --user=csoeder --password=tha_snazzle glurge -N > auxtrans_noncoding.CPAT.dat
python dbquery_transcriptCPAT.py
###	compare CPAT to GWIPS:
#select c.precand_pk, avg(t.coding_prob), c.gwips from transcript t, orf o, precandidate_lookup l, candidate c where c.gwips>0 and l.precand_id=c.precand_pk and o.person_name=l.person_name and o.old_pk-l.orf_id and o.trans=t.comp_name and t.person_name=o.person_name group by c.precand_pk;


echo "TRANSLATIONAL EVIDENCE"
echo "~~~~~~~~~~~~~~~~~~~~"
sorf_count=$( echo "SELECT count(*) $polymorphic_denovo_SQL AND sorf_strong = 1;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
gwips_count=$( echo "SELECT count(*) $polymorphic_denovo_SQL AND gwips > 0;" | mysql --user=csoeder --password=tha_snazzle glurge -N )

echo "There were $sorf_count candidates which overlapped a sORFdb annotation (riboSeq-based); here are some:"
echo "SELECT precand_pk,chrom,start,stop $polymorphic_denovo_SQL AND sorf_strong = 1;" | mysql --user=csoeder --password=tha_snazzle glurge
echo "There were $gwips_count candidates with nonzero gwipsvizRiboseq (riboSeq-based); here are the most highly translated:"
echo "SELECT precand_pk,chrom,start,stop,gwips length_weighted_gwips_cov $polymorphic_denovo_SQL AND gwips > 0 ORDER BY length_weighted_gwips_cov DESC LIMIT 5;" | mysql --user=csoeder --password=tha_snazzle glurge

echo "EXPRESSION FACTS"
echo "~~~~~~~~~~~~~~~~~~~~"

mkdir expression_figures

for pk in $( echo "SELECT precand_pk $polymorphic_denovo_SQL;"  | mysql --user=csoeder --password=tha_snazzle glurge -N ) ; do 
	echo "select FPKM from expression where candidate_id = $pk order by FPKM asc;" | mysql --user=csoeder --password=tha_snazzle glurge -N  > all_expression_$pk.dat;
	echo "select e.FPKM from expression e where e.candidate_id=$pk AND e.person_name in (select person_name from precandidate_lookup l where l.precand_id = $pk) group by e.candidate_id;" | mysql --user=csoeder --password=tha_snazzle glurge -N > expresser_expression_$pk.dat
	python dbquery_expressionDepicter.py all_expression_$pk.dat expresser_expression_$pk.dat $pk
	rm all_expression_$pk.dat expresser_expression_$pk.dat
done

echo "CUMULATIVE NOVELTY"
echo "~~~~~~~~~~~~~~~~~~~~"
echo "SELECT person_name, precand_id FROM precandidate_lookup where precand_id in (SELECT precand_pk $polymorphic_denovo_SQL);" | mysql --user=csoeder --password=tha_snazzle glurge -N > person_candidate_roster.list
echo "select person_name from person where rna_seq=1;" | mysql --user=csoeder --password=tha_snazzle glurge -N > rna_seq_people.list 
python dbquery_cumulativenovelty.py person_candidate_roster.list rna_seq_people.list 


echo "SEX BIAS"
echo "~~~~~~~~~~~~~~~~~~~~"



echo "VARIATION FACTS"
echo "~~~~~~~~~~~~~~~~~~~~"

dna_seq_count=$(echo "SELECT count(*) FROM person;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
echo "1000 Genomes Project variant data was used, based on DNA-Seq from $dna_seq_count individuals."
echo "These "$dna_seq_count" included the following populations:"
for pop in $(echo "SELECT DISTINCT population FROM person;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	echo "\t$pop\t$(echo "SELECT count(*) FROM person WHERE person.population='$pop';" | mysql --user=csoeder --password=tha_snazzle glurge -N )";
done

echo "and the following sex distribution:"
for sex in $(echo "SELECT DISTINCT sex FROM person;" | mysql --user=csoeder --password=tha_snazzle glurge -N ); do 
	echo "\t$sex\t$(echo "SELECT count(*) FROM person WHERE person.sex='$sex';" | mysql --user=csoeder --password=tha_snazzle glurge -N )";
done

#select count(v.variant_pk) variant_count, c.precand_pk from variant v, candidate c where v.chrom=c.chrom AND v.pos < c.stop AND v.pos > c.start group by c.precand_pk order by variant_count desc limit 10 ;
 
total_length=$( echo "SELECT sum(x.size) total_length FROM (SELECT (stop-start) size FROM candidate) x;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
number_variants=$( echo "SELECT count(*) FROM variant;" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
variant_density=$( echo "scale=2;$number_variants / %total_length" | bc)
####	this will need refining ^^
echo "The $total_denovo_count polymorphic ORFs spanned $total_length nt total and contained $number_variants total variant sites."
echo "This is a variant density of $variant_density variants per nt"
echo "A candidate location contained a mean of %s variants and a median of "
non_variant_loci=$(echo "SELECT count(*) FROM candidate WHERE poly=0;" | mysql --user=csoeder --password=tha_snazzle glurge -N )
echo "There were $non_variant_loci loci which met the criteria for a de novo gene but did not contain a variant site annotated in the 1kGen data."
snp_count=$(echo "SELECT count(*) FROM variant WHERE varType='snp';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
indel_count=$(echo "SELECT count(*) FROM variant WHERE varType='indel';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
echo "These variants consist of  $snp_count SNPs and $indel_count indels, including"
ts_count=$(echo "SELECT count(*) FROM variant WHERE varSubtype='ts';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
tv_count=$(echo "SELECT count(*) FROM variant WHERE varSubtype='tv';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
ins_count=$(echo "SELECT count(*) FROM variant WHERE varSubtype='ins';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
del_count=$(echo "SELECT count(*) FROM variant WHERE varSubtype='del';" | mysql --user=csoeder --password=tha_snazzle glurge -N  )
echo "\t$ts_count transitions"
echo "\t$tv_count transversions"
echo "\t$ins_count insertions"
echo "\t$del_count deletions"


phial.write("For the %s sites on which it was defined, nucleotide diversity (pi_hat) had a minimum of %s, a maximum of %s, a mean of %s and a median of %s.\n"%tuple([len(pi_list), min(pi_list), max(pi_list), np.mean(pi_list), np.median(pi_list)]) )
phial.write("For the %s sites on which it was defined, heterozygosity had a minimum of %s, a maximum of %s, a mean of %s and a median of%s.\n"%tuple([len(hetZyg_list), min(hetZyg_list), max(hetZyg_list), np.mean(hetZyg_list), np.median(hetZyg_list)]) )



phial = open('Variation_BasicFacts.txt', 'w')
phial.write('Over %s genes, spanning %s nucleotides, there were observed %s variant sites within the 1kGen variation data. \n This translates to a variant density of %s variants per kilobase.\n'%tuple([len(all_genes), span, totVar, totVar*1000./span]))
###		compare to the genome at large???
###						known genes?
phial.write('\nThis includes %s SNPs (%s%%, %s per kilobase) and %s indels (%s%%, %s per kilobase).\n'%tuple([numSnps, numSnps*100./totVar, numSnps*1000./span, numIndels, numIndels*100./totVar, numIndels*1000./span]))
###		compare to the genome at large???
###						known genes?

varz_per_site=[]
for jean in all_genes:
	varz_per_site.append(len(num_seqs[jean[0]]))
phial.write('\nThe number of variant sites per gene ranged from %s to %s. The mean was %s and the median was %s.\n'%tuple([min(varz_per_site), max(varz_per_site), mean(varz_per_site), median(varz_per_site)]))

phial.write('\nAn additional %s sites met the criteria for a de novo human gene, but were not polymorphic.\n'%tuple([len(monogs)]))
phial.write('\n'%tuple([]))
