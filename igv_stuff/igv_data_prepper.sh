#!/bin/sh

#	igv_data_prepper.sh $chrom $start_z2 $stop_z2 $strand $xpressr1 $xpressr2 $xpressr3 "Expressers_$peekay"
chromosome=$1
region_begin=$2
region_end=$3
strand=$4
name=$5
person1=$6
person2=$7
person3=$8

RNA_dir=/netscr/csoeder/1kGen/individuals
RNApath=/netscr/csoeder/1kGen/RNApath_v4_up
DNA_dir=/lustre/scr/c/s/csoeder/DNA-Seq/alignments/
DNApath=/netscr/csoeder/1kGen/DNApath_v4_up
VCF_dir=/proj/cdjones_lab/Genomics_Data_Commons/variation/homo_sapiens/1000Genomes_phase3
VCFpath=/netscr/csoeder/1kGen/VCFpath_v4_up

chr_abrv=$(echo $chromosome | cut -f 2 -d r)



if [ "$chromosome" == "chrX" ]; then 

	echo "tabix -H "$VCF_dir"/ALL.$chromosome.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz > "$VCFpath"/"$name".vcf" >> data_prep_script.sh
	echo "tabix -H "$VCF_dir"/ALL.$chromosome.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz  $chr_abrv:$region_begin-$region_end |  vcf-subset -c $person1,$person2,$person3 >> "$VCFpath"/"$name".vcf " >> data_prep_script.sh

elif [ "$chromosome" == "chrY" ]; then 

	echo "tabix -H "$VCF_dir"/ALL.$chromosome.phase3_integrated_v1a.20130502.genotypes.vcf.gz > "$VCFpath"/"$name".vcf" >> data_prep_script.sh
	echo "tabix -H "$VCF_dir"/ALL.$chromosome.phase3_integrated_v1a.20130502.genotypes.vcf.gz $chr_abrv:$region_begin-$region_end |  vcf-subset -c $person1,$person2,$person3 >> "$VCFpath"/"$name".vcf" >> data_prep_script.sh

else 

	echo "tabix -H "$VCF_dir"/ALL.$chromosome.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > "$VCFpath"/"$name".vcf" >> data_prep_script.sh
	echo "tabix -h "$VCF_dir"/ALL.$chromosome.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz $chr_abrv:$region_begin-$region_end |  vcf-subset -c $person1,$person2,$person3 >> "$VCFpath"/"$name".vcf" >> data_prep_script.sh

fi 

echo "echo -e $chromosome'\t'$region_begin'\t'$region_end > test.bed" >> data_prep_script.sh

echo "samtools view -bh $RNA_dir/$person1/"$person1"_mapsplice_alignment.sort.bam $chromosome:$region_begin-$region_end | bedtools intersect -split -a - -b test.bed > $RNApath/"$name"_"$person1".bam " >> data_prep_script.sh
echo "samtools index $RNApath/"$name"_"$person1".bam " >> data_prep_script.sh
echo "samtools view -bh $DNA_dir/$person1/"$person1"_DNA_alignment.sort.bam $chr_abrv:$region_begin-$region_end > $DNApath/"$name"_"$person1".bam " >> data_prep_script.sh
echo "samtools index $DNApath/"$name"_"$person1".bam " >> data_prep_script.sh



if  [ -n "$person2" ]; then
	echo "samtools view -bh $RNA_dir/$person2/"$person2"_mapsplice_alignment.sort.bam $chromosome:$region_begin-$region_end | bedtools intersect -split -a - -b test.bed > $RNApath/"$name"_"$person2".bam " >> data_prep_script.sh
	echo "samtools index $RNApath/"$name"_"$person2".bam " >> data_prep_script.sh
	echo "samtools view -bh $DNA_dir/$person2/"$person2"_DNA_alignment.sort.bam $chr_abrv:$region_begin-$region_end  > $DNApath/"$name"_"$person2".bam " >> data_prep_script.sh
	echo "samtools index $DNApath/"$name"_"$person2".bam " >> data_prep_script.sh
fi

if  [ -n "$person3" ]; then
echo "samtools view -bh $RNA_dir/$person3/"$person3"_mapsplice_alignment.sort.bam $chromosome:$region_begin-$region_end | bedtools intersect -split -a - -b test.bed > $RNApath/"$name"_"$person3".bam " >> data_prep_script.sh
echo "samtools index $RNApath/"$name"_"$person3".bam " >> data_prep_script.sh
echo "samtools view -bh $DNA_dir/$person3/"$person3"_DNA_alignment.sort.bam $chr_abrv:$region_begin-$region_end > $DNApath/"$name"_"$person3".bam " >> data_prep_script.sh
echo "samtools index $DNApath/"$name"_"$person3".bam " >> data_prep_script.sh
fi








