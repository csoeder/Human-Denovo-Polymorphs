#!/bin/sh

db_name=$1
#db_file=deNovo.db
subsetFilter=$2
user=$3
pswd=$4
homebase=$(pwd)

#################################################
echo "select count(*) from person where rna_seq=1;" |  mysql $db_name --password="$pswd" --user="$user" -N | awk '{print "RNA-Seq was analyzed for "$1" individuals."}'
num_expressors=$( echo "select count(*) from person where rna_seq=1;" |  mysql $db_name --password="$pswd" --user="$user" -N )

#################################################
echo "Individuals had the following quantity of transcripts built by Trinity:"
total_transcript_count=0;
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "select '"$d00d"', count(*) from transcript_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N
	total_transcript_count=$((total_transcript_count+$(echo "select count(*) from transcript_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N) ))
done
echo "Total: "$total_transcript_count" Per-Individual Average: "$((total_transcript_count/num_expressors))""

#################################################

echo "Individuals had the following quantity of RNA-Seq reads processed through MapSplice2:"

#################################################
echo "These transcripts were aligned with BLAT, giving the following alignments:"
#	Total, good_align
echo "Quality alignments were excluded if they overlapped forbidden annotations, leaving the following alignments:"
total_ILSanom_count=0;
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "select '"$d00d"', count(*) from alignment_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N
	total_ILSanom_count=$((total_ILSanom_count+$(echo "select count(*) from alignment_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N) ))

done
echo "Total: "$total_ILSanom_count" Per-Individual Average: "$((total_ILSanom_count/num_expressors))""

echo "Of these, the following survived the accumulation-test:"
total_accumClean_count=0;
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "select '"$d00d"', count(*) from alignment_"$d00d" where no_accumulated_overlap=1;" | mysql $db_name --password="$pswd" --user="$user" -N ;
	total_accumClean_count=$((total_accumClean_count+$(echo "select count(*) from alignment_"$d00d" where no_accumulated_overlap=1;" | mysql $db_name --password="$pswd" --user="$user" -N) ));
done
echo "Total: "$total_accumClean_count" Per-individual average: "$((total_accumClean_count/num_expressors))" Percent of non-forbidden alignments: "$( echo "scale=4;100*$total_accumClean_count/$total_ILSanom_count" | bc)" " 


#################################################
echo "These transcripts were scanned and ORFs meeting a minimum length threshold were collected:"
total_orf_count=0;
for d00d in $(ls individuals/ | grep $subsetFilter ); do 
	echo "select '"$d00d"', count(*) from orf_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N ;
	total_orf_count=$((total_orf_count+$(echo "select count(*) from orf_"$d00d";" | mysql $db_name --password="$pswd" --user="$user" -N) ))
done
echo "Total: "$total_orf_count" Per-Individual Average: "$((total_orf_count/num_expressors))""
#################################################

echo "These ORFs were considered and those which had no detected homologous coding region in chimp/gorilla, no similarity to known peptides in the PDB, no duplication across the genome, whose transcripts and accumulations thereof do not overlap a forbidden annotation were recorded as a potential hit."
#echo "SELECT a.chrom, a.start, a.stop, a.qstart, a.qstop, a.strand, o.start, o.stop, o.orf_pk, t.comp_name, a.aln_pk FROM alignment_"$d00d" a, orf_"$d00d" o, transcript_"$d00d" t WHERE a.trans=o.trans AND t.comp_name=a.trans AND o.absent_from_pdb=1 AND o.no_duplicates=1 AND o.no_pan_homologous_ORF=1 AND o.no_gor_homologous_ORF=1 AND a.no_direct_overlap=1 AND a.no_accumulated_overlap=1;"
number_precand=$( echo "select count(*) from precandidate;" | mysql $db_name --password="$pswd" --user="$user" -N  )
echo "A total of $number_precand genomic regions were thus identified."

#################################################

