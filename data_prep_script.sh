tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_153.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418607-68419872 |  vcf-subset -c HG00102,HG00102,HG00102 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_153.vcf
echo -e chr9'	'68418607'	'68419872 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00102/HG00102_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00102/HG00102_DNA_alignment.sort.bam 9:68418607-68419872 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00102/HG00102_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00102/HG00102_DNA_alignment.sort.bam 9:68418607-68419872  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00102/HG00102_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_153_HG00102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00102/HG00102_DNA_alignment.sort.bam 9:68418607-68419872 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_153_HG00102.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_153.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418607-68419872 |  vcf-subset -c HG00103,NA20765,NA20768 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_153.vcf
echo -e chr9'	'68418607'	'68419872 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00103/HG00103_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_HG00103.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_HG00103.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00103/HG00103_DNA_alignment.sort.bam 9:68418607-68419872 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_HG00103.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_HG00103.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20765/NA20765_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_NA20765.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_NA20765.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20765/NA20765_DNA_alignment.sort.bam 9:68418607-68419872  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_NA20765.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_NA20765.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20768/NA20768_mapsplice_alignment.sort.bam chr9:68418607-68419872 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_NA20768.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_153_NA20768.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20768/NA20768_DNA_alignment.sort.bam 9:68418607-68419872 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_NA20768.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_153_NA20768.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_182.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:80893591-80894669 |  vcf-subset -c HG00103,HG00103,HG00103 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_182.vcf
echo -e chr17'	'80893591'	'80894669 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00103/HG00103_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00103/HG00103_DNA_alignment.sort.bam 17:80893591-80894669 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00103/HG00103_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00103/HG00103_DNA_alignment.sort.bam 17:80893591-80894669  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00103/HG00103_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_182_HG00103.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00103/HG00103_DNA_alignment.sort.bam 17:80893591-80894669 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_182_HG00103.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_182.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:80893591-80894669 |  vcf-subset -c HG00330,NA11994,HG00263 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_182.vcf
echo -e chr17'	'80893591'	'80894669 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00330/HG00330_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_HG00330.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_HG00330.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00330/HG00330_DNA_alignment.sort.bam 17:80893591-80894669 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_HG00330.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_HG00330.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11994/NA11994_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_NA11994.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_NA11994.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11994/NA11994_DNA_alignment.sort.bam 17:80893591-80894669  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_NA11994.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_NA11994.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00263/HG00263_mapsplice_alignment.sort.bam chr17:80893591-80894669 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_HG00263.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_182_HG00263.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00263/HG00263_DNA_alignment.sort.bam 17:80893591-80894669 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_HG00263.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_182_HG00263.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_220.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60885731-60888393 |  vcf-subset -c HG00105,HG00105,NA19131 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_220.vcf
echo -e chr18'	'60885731'	'60888393 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00105/HG00105_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_HG00105.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_HG00105.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00105/HG00105_DNA_alignment.sort.bam 18:60885731-60888393 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_HG00105.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_HG00105.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00105/HG00105_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_HG00105.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_HG00105.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00105/HG00105_DNA_alignment.sort.bam 18:60885731-60888393  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_HG00105.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_HG00105.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19131/NA19131_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_NA19131.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_220_NA19131.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19131/NA19131_DNA_alignment.sort.bam 18:60885731-60888393 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_NA19131.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_220_NA19131.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_220.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60885731-60888393 |  vcf-subset -c HG00096,HG00362,HG00250 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_220.vcf
echo -e chr18'	'60885731'	'60888393 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00096/HG00096_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00096/HG00096_DNA_alignment.sort.bam 18:60885731-60888393 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00362/HG00362_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00362.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00362.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00362/HG00362_DNA_alignment.sort.bam 18:60885731-60888393  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00362.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00362.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00250/HG00250_mapsplice_alignment.sort.bam chr18:60885731-60888393 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00250.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_220_HG00250.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00250/HG00250_DNA_alignment.sort.bam 18:60885731-60888393 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00250.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_220_HG00250.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_224.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:18640848-18641959 |  vcf-subset -c HG00105,HG00105,HG00105 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_224.vcf
echo -e chr22'	'18640848'	'18641959 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00105/HG00105_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00105/HG00105_DNA_alignment.sort.bam 22:18640848-18641959 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00105/HG00105_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00105/HG00105_DNA_alignment.sort.bam 22:18640848-18641959  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00105/HG00105_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_224_HG00105.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00105/HG00105_DNA_alignment.sort.bam 22:18640848-18641959 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_224_HG00105.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_224.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:18640848-18641959 |  vcf-subset -c NA12341,NA12043,HG00361 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_224.vcf
echo -e chr22'	'18640848'	'18641959 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12341/NA12341_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_NA12341.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_NA12341.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12341/NA12341_DNA_alignment.sort.bam 22:18640848-18641959 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_NA12341.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_NA12341.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12043/NA12043_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_NA12043.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_NA12043.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12043/NA12043_DNA_alignment.sort.bam 22:18640848-18641959  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_NA12043.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_NA12043.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00361/HG00361_mapsplice_alignment.sort.bam chr22:18640848-18641959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_HG00361.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_224_HG00361.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00361/HG00361_DNA_alignment.sort.bam 22:18640848-18641959 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_HG00361.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_224_HG00361.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72460264-72463179 |  vcf-subset -c HG00112,HG00112,HG00112 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_308.vcf
echo -e chr17'	'72460264'	'72463179 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00112/HG00112_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00112/HG00112_DNA_alignment.sort.bam 17:72460264-72463179 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00112/HG00112_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00112/HG00112_DNA_alignment.sort.bam 17:72460264-72463179  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00112/HG00112_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_308_HG00112.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00112/HG00112_DNA_alignment.sort.bam 17:72460264-72463179 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_308_HG00112.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72460264-72463179 |  vcf-subset -c NA11930,NA12716,HG00380 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_308.vcf
echo -e chr17'	'72460264'	'72463179 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11930/NA11930_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_NA11930.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_NA11930.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11930/NA11930_DNA_alignment.sort.bam 17:72460264-72463179 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_NA11930.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_NA11930.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12716/NA12716_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_NA12716.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_NA12716.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12716/NA12716_DNA_alignment.sort.bam 17:72460264-72463179  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_NA12716.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_NA12716.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00380/HG00380_mapsplice_alignment.sort.bam chr17:72460264-72463179 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_HG00380.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_308_HG00380.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00380/HG00380_DNA_alignment.sort.bam 17:72460264-72463179 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_HG00380.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_308_HG00380.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_370.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:125661766-125662987 |  vcf-subset -c HG00117,HG00117,HG00117 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_370.vcf
echo -e chr9'	'125661766'	'125662987 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00117/HG00117_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00117/HG00117_DNA_alignment.sort.bam 9:125661766-125662987 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00117/HG00117_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00117/HG00117_DNA_alignment.sort.bam 9:125661766-125662987  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00117/HG00117_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_370_HG00117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00117/HG00117_DNA_alignment.sort.bam 9:125661766-125662987 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_370_HG00117.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_370.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:125661766-125662987 |  vcf-subset -c NA20819,NA20540,HG00252 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_370.vcf
echo -e chr9'	'125661766'	'125662987 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20819/NA20819_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_NA20819.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_NA20819.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20819/NA20819_DNA_alignment.sort.bam 9:125661766-125662987 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_NA20819.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_NA20819.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20540/NA20540_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_NA20540.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_NA20540.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20540/NA20540_DNA_alignment.sort.bam 9:125661766-125662987  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_NA20540.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_NA20540.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00252/HG00252_mapsplice_alignment.sort.bam chr9:125661766-125662987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_HG00252.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_370_HG00252.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00252/HG00252_DNA_alignment.sort.bam 9:125661766-125662987 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_HG00252.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_370_HG00252.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_441.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418611-68419865 |  vcf-subset -c HG00379,HG00379,NA20814 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_441.vcf
echo -e chr9'	'68418611'	'68419865 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00379/HG00379_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_HG00379.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_HG00379.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00379/HG00379_DNA_alignment.sort.bam 9:68418611-68419865 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_HG00379.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_HG00379.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00379/HG00379_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_HG00379.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_HG00379.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00379/HG00379_DNA_alignment.sort.bam 9:68418611-68419865  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_HG00379.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_HG00379.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20814/NA20814_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_NA20814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_441_NA20814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20814/NA20814_DNA_alignment.sort.bam 9:68418611-68419865 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_NA20814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_441_NA20814.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_441.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418611-68419865 |  vcf-subset -c HG00339,HG00116,HG00313 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_441.vcf
echo -e chr9'	'68418611'	'68419865 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00339/HG00339_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00339.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00339.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00339/HG00339_DNA_alignment.sort.bam 9:68418611-68419865 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00339.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00339.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00116/HG00116_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00116.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00116.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00116/HG00116_DNA_alignment.sort.bam 9:68418611-68419865  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00116.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00116.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00313/HG00313_mapsplice_alignment.sort.bam chr9:68418611-68419865 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00313.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_441_HG00313.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00313/HG00313_DNA_alignment.sort.bam 9:68418611-68419865 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00313.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_441_HG00313.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_620.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:17764950-17770307 |  vcf-subset -c HG00131,HG00131,HG00131 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_620.vcf
echo -e chr1'	'17764950'	'17770307 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00131/HG00131_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00131/HG00131_DNA_alignment.sort.bam 1:17764950-17770307 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00131/HG00131_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00131/HG00131_DNA_alignment.sort.bam 1:17764950-17770307  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00131/HG00131_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_620_HG00131.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00131/HG00131_DNA_alignment.sort.bam 1:17764950-17770307 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_620_HG00131.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_620.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:17764950-17770307 |  vcf-subset -c NA18916,HG00334,HG00177 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_620.vcf
echo -e chr1'	'17764950'	'17770307 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18916/NA18916_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_NA18916.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_NA18916.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18916/NA18916_DNA_alignment.sort.bam 1:17764950-17770307 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_NA18916.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_NA18916.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00334/HG00334_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_HG00334.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_HG00334.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00334/HG00334_DNA_alignment.sort.bam 1:17764950-17770307  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_HG00334.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_HG00334.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00177/HG00177_mapsplice_alignment.sort.bam chr1:17764950-17770307 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_HG00177.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_620_HG00177.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00177/HG00177_DNA_alignment.sort.bam 1:17764950-17770307 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_HG00177.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_620_HG00177.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_647.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417956-68420431 |  vcf-subset -c HG00132,HG00336,HG00336 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_647.vcf
echo -e chr9'	'68417956'	'68420431 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam 9:68417956-68420431 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00132.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00336/HG00336_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00336.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00336.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00336/HG00336_DNA_alignment.sort.bam 9:68417956-68420431  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00336.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00336.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00336/HG00336_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00336.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_647_HG00336.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00336/HG00336_DNA_alignment.sort.bam 9:68417956-68420431 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00336.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_647_HG00336.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_647.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417956-68420431 |  vcf-subset -c NA12399,NA11992,HG00360 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_647.vcf
echo -e chr9'	'68417956'	'68420431 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12399/NA12399_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_NA12399.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_NA12399.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12399/NA12399_DNA_alignment.sort.bam 9:68417956-68420431 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_NA12399.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_NA12399.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11992/NA11992_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_NA11992.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_NA11992.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11992/NA11992_DNA_alignment.sort.bam 9:68417956-68420431  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_NA11992.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_NA11992.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00360/HG00360_mapsplice_alignment.sort.bam chr9:68417956-68420431 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_HG00360.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_647_HG00360.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00360/HG00360_DNA_alignment.sort.bam 9:68417956-68420431 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_HG00360.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_647_HG00360.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_650.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:74324986-74325866 |  vcf-subset -c HG00132,HG00132,HG00132 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_650.vcf
echo -e chr16'	'74324986'	'74325866 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam 16:74324986-74325866 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam 16:74324986-74325866  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_650_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam 16:74324986-74325866 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_650_HG00132.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_650.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:74324986-74325866 |  vcf-subset -c NA20516,NA20774,NA11843 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_650.vcf
echo -e chr16'	'74324986'	'74325866 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20516/NA20516_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA20516.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA20516.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20516/NA20516_DNA_alignment.sort.bam 16:74324986-74325866 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA20516.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA20516.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20774/NA20774_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA20774.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA20774.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20774/NA20774_DNA_alignment.sort.bam 16:74324986-74325866  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA20774.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA20774.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11843/NA11843_mapsplice_alignment.sort.bam chr16:74324986-74325866 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA11843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_650_NA11843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11843/NA11843_DNA_alignment.sort.bam 16:74324986-74325866 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA11843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_650_NA11843.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_669.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:162115803-162116991 |  vcf-subset -c HG00133,HG00133,HG00133 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_669.vcf
echo -e chr2'	'162115803'	'162116991 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00133/HG00133_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00133/HG00133_DNA_alignment.sort.bam 2:162115803-162116991 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00133/HG00133_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00133/HG00133_DNA_alignment.sort.bam 2:162115803-162116991  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00133/HG00133_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_669_HG00133.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00133/HG00133_DNA_alignment.sort.bam 2:162115803-162116991 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_669_HG00133.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_669.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:162115803-162116991 |  vcf-subset -c HG00373,NA12383,NA19119 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_669.vcf
echo -e chr2'	'162115803'	'162116991 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00373/HG00373_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_HG00373.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_HG00373.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00373/HG00373_DNA_alignment.sort.bam 2:162115803-162116991 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_HG00373.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_HG00373.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12383/NA12383_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_NA12383.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_NA12383.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12383/NA12383_DNA_alignment.sort.bam 2:162115803-162116991  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_NA12383.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_NA12383.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19119/NA19119_mapsplice_alignment.sort.bam chr2:162115803-162116991 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_NA19119.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_669_NA19119.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19119/NA19119_DNA_alignment.sort.bam 2:162115803-162116991 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_NA19119.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_669_NA19119.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_734.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:96000207-96001087 |  vcf-subset -c HG00139,HG00139,HG00139 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_734.vcf
echo -e chr11'	'96000207'	'96001087 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00139/HG00139_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00139/HG00139_DNA_alignment.sort.bam 11:96000207-96001087 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00139/HG00139_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00139/HG00139_DNA_alignment.sort.bam 11:96000207-96001087  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00139/HG00139_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_734_HG00139.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00139/HG00139_DNA_alignment.sort.bam 11:96000207-96001087 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_734_HG00139.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_734.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:96000207-96001087 |  vcf-subset -c HG00282,NA20510,NA12283 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_734.vcf
echo -e chr11'	'96000207'	'96001087 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00282/HG00282_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_HG00282.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_HG00282.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00282/HG00282_DNA_alignment.sort.bam 11:96000207-96001087 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_HG00282.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_HG00282.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20510/NA20510_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_NA20510.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_NA20510.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20510/NA20510_DNA_alignment.sort.bam 11:96000207-96001087  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_NA20510.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_NA20510.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12283/NA12283_mapsplice_alignment.sort.bam chr11:96000207-96001087 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_NA12283.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_734_NA12283.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12283/NA12283_DNA_alignment.sort.bam 11:96000207-96001087 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_NA12283.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_734_NA12283.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_802.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:180680854-180682471 |  vcf-subset -c HG00141,HG00141,HG00141 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_802.vcf
echo -e chr3'	'180680854'	'180682471 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 3:180680854-180682471 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 3:180680854-180682471  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_802_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 3:180680854-180682471 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_802_HG00141.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_802.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:180680854-180682471 |  vcf-subset -c NA19184,NA18520,NA20754 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_802.vcf
echo -e chr3'	'180680854'	'180682471 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19184/NA19184_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA19184.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA19184.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19184/NA19184_DNA_alignment.sort.bam 3:180680854-180682471 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA19184.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA19184.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18520/NA18520_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA18520.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA18520.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18520/NA18520_DNA_alignment.sort.bam 3:180680854-180682471  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA18520.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA18520.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20754/NA20754_mapsplice_alignment.sort.bam chr3:180680854-180682471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA20754.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_802_NA20754.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20754/NA20754_DNA_alignment.sort.bam 3:180680854-180682471 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA20754.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_802_NA20754.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_804.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:214096220-214109420 |  vcf-subset -c HG00141,HG00141,HG00141 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_804.vcf
echo -e chr2'	'214096220'	'214109420 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 2:214096220-214109420 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 2:214096220-214109420  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00141/HG00141_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_804_HG00141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00141/HG00141_DNA_alignment.sort.bam 2:214096220-214109420 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_804_HG00141.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_804.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:214096220-214109420 |  vcf-subset -c NA19141,HG00344,NA19197 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_804.vcf
echo -e chr2'	'214096220'	'214109420 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19141/NA19141_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_NA19141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_NA19141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19141/NA19141_DNA_alignment.sort.bam 2:214096220-214109420 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_NA19141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_NA19141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00344/HG00344_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_HG00344.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_HG00344.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00344/HG00344_DNA_alignment.sort.bam 2:214096220-214109420  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_HG00344.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_HG00344.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19197/NA19197_mapsplice_alignment.sort.bam chr2:214096220-214109420 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_NA19197.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_804_NA19197.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19197/NA19197_DNA_alignment.sort.bam 2:214096220-214109420 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_NA19197.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_804_NA19197.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_817.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:27125259-27126447 |  vcf-subset -c HG00142,HG00142,HG00142 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_817.vcf
echo -e chr1'	'27125259'	'27126447 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00142/HG00142_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00142/HG00142_DNA_alignment.sort.bam 1:27125259-27126447 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00142/HG00142_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00142/HG00142_DNA_alignment.sort.bam 1:27125259-27126447  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00142/HG00142_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_817_HG00142.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00142/HG00142_DNA_alignment.sort.bam 1:27125259-27126447 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_817_HG00142.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_817.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:27125259-27126447 |  vcf-subset -c NA20509,HG00330,HG00158 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_817.vcf
echo -e chr1'	'27125259'	'27126447 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20509/NA20509_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_NA20509.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_NA20509.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20509/NA20509_DNA_alignment.sort.bam 1:27125259-27126447 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_NA20509.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_NA20509.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00330/HG00330_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_HG00330.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_HG00330.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00330/HG00330_DNA_alignment.sort.bam 1:27125259-27126447  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_HG00330.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_HG00330.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00158/HG00158_mapsplice_alignment.sort.bam chr1:27125259-27126447 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_HG00158.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_817_HG00158.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00158/HG00158_DNA_alignment.sort.bam 1:27125259-27126447 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_HG00158.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_817_HG00158.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_858.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72460230-72463233 |  vcf-subset -c HG00145,HG00145,HG00145 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_858.vcf
echo -e chr17'	'72460230'	'72463233 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00145/HG00145_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00145/HG00145_DNA_alignment.sort.bam 17:72460230-72463233 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00145/HG00145_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00145/HG00145_DNA_alignment.sort.bam 17:72460230-72463233  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00145/HG00145_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_858_HG00145.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00145/HG00145_DNA_alignment.sort.bam 17:72460230-72463233 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_858_HG00145.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_858.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72460230-72463233 |  vcf-subset -c HG00310,HG00351,NA06984 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_858.vcf
echo -e chr17'	'72460230'	'72463233 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00310/HG00310_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_HG00310.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_HG00310.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00310/HG00310_DNA_alignment.sort.bam 17:72460230-72463233 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_HG00310.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_HG00310.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00351/HG00351_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_HG00351.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_HG00351.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00351/HG00351_DNA_alignment.sort.bam 17:72460230-72463233  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_HG00351.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_HG00351.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06984/NA06984_mapsplice_alignment.sort.bam chr17:72460230-72463233 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_NA06984.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_858_NA06984.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06984/NA06984_DNA_alignment.sort.bam 17:72460230-72463233 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_NA06984.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_858_NA06984.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_922.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947193-46952550 |  vcf-subset -c HG00152,HG00152,HG00152 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_922.vcf
echo -e chr21'	'46947193'	'46952550 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947193-46952550 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947193-46952550  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_922_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947193-46952550 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_922_HG00152.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_922.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947193-46952550 |  vcf-subset -c NA18916,NA20512,HG00330 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_922.vcf
echo -e chr21'	'46947193'	'46952550 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18916/NA18916_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_NA18916.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_NA18916.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18916/NA18916_DNA_alignment.sort.bam 21:46947193-46952550 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_NA18916.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_NA18916.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20512/NA20512_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_NA20512.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_NA20512.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20512/NA20512_DNA_alignment.sort.bam 21:46947193-46952550  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_NA20512.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_NA20512.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00330/HG00330_mapsplice_alignment.sort.bam chr21:46947193-46952550 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_HG00330.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_922_HG00330.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00330/HG00330_DNA_alignment.sort.bam 21:46947193-46952550 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_HG00330.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_922_HG00330.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_923.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947464-46952293 |  vcf-subset -c HG00152,HG00152,HG00152 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_923.vcf
echo -e chr21'	'46947464'	'46952293 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947464-46952293 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947464-46952293  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00152/HG00152_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_923_HG00152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00152/HG00152_DNA_alignment.sort.bam 21:46947464-46952293 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_923_HG00152.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_923.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947464-46952293 |  vcf-subset -c HG00329,NA06989,HG00262 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_923.vcf
echo -e chr21'	'46947464'	'46952293 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 21:46947464-46952293 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06989/NA06989_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_NA06989.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_NA06989.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06989/NA06989_DNA_alignment.sort.bam 21:46947464-46952293  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_NA06989.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_NA06989.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00262/HG00262_mapsplice_alignment.sort.bam chr21:46947464-46952293 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_HG00262.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_923_HG00262.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00262/HG00262_DNA_alignment.sort.bam 21:46947464-46952293 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_HG00262.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_923_HG00262.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1018.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:75842599-75843578 |  vcf-subset -c HG00156,HG00156,HG00156 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1018.vcf
echo -e chr11'	'75842599'	'75843578 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00156/HG00156_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00156/HG00156_DNA_alignment.sort.bam 11:75842599-75843578 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00156/HG00156_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00156/HG00156_DNA_alignment.sort.bam 11:75842599-75843578  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00156/HG00156_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1018_HG00156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00156/HG00156_DNA_alignment.sort.bam 11:75842599-75843578 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1018_HG00156.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1018.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:75842599-75843578 |  vcf-subset -c HG00186,HG00311,HG00255 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1018.vcf
echo -e chr11'	'75842599'	'75843578 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00186/HG00186_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00186.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00186.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00186/HG00186_DNA_alignment.sort.bam 11:75842599-75843578 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00186.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00186.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00311/HG00311_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00311.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00311.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00311/HG00311_DNA_alignment.sort.bam 11:75842599-75843578  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00311.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00311.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00255/HG00255_mapsplice_alignment.sort.bam chr11:75842599-75843578 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00255.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1018_HG00255.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00255/HG00255_DNA_alignment.sort.bam 11:75842599-75843578 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00255.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1018_HG00255.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1045.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:38578023-38582687 |  vcf-subset -c HG00159,HG00159,HG00159 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1045.vcf
echo -e chr3'	'38578023'	'38582687 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00159/HG00159_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00159/HG00159_DNA_alignment.sort.bam 3:38578023-38582687 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00159/HG00159_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00159/HG00159_DNA_alignment.sort.bam 3:38578023-38582687  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00159/HG00159_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1045_HG00159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00159/HG00159_DNA_alignment.sort.bam 3:38578023-38582687 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1045_HG00159.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1045.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:38578023-38582687 |  vcf-subset -c NA19113,NA18508,HG00375 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1045.vcf
echo -e chr3'	'38578023'	'38582687 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19113/NA19113_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_NA19113.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_NA19113.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19113/NA19113_DNA_alignment.sort.bam 3:38578023-38582687 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_NA19113.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_NA19113.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18508/NA18508_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_NA18508.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_NA18508.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18508/NA18508_DNA_alignment.sort.bam 3:38578023-38582687  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_NA18508.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_NA18508.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00375/HG00375_mapsplice_alignment.sort.bam chr3:38578023-38582687 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_HG00375.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1045_HG00375.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00375/HG00375_DNA_alignment.sort.bam 3:38578023-38582687 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_HG00375.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1045_HG00375.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1047.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:11264605-11267212 |  vcf-subset -c HG00178,HG00178,HG00159 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1047.vcf
echo -e chr16'	'11264605'	'11267212 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00178/HG00178_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00178.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00178.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00178/HG00178_DNA_alignment.sort.bam 16:11264605-11267212 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00178.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00178.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00178/HG00178_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00178.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00178.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00178/HG00178_DNA_alignment.sort.bam 16:11264605-11267212  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00178.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00178.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00159/HG00159_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1047_HG00159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00159/HG00159_DNA_alignment.sort.bam 16:11264605-11267212 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1047_HG00159.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1047.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:11264605-11267212 |  vcf-subset -c NA19143,NA20814,NA12283 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1047.vcf
echo -e chr16'	'11264605'	'11267212 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19143/NA19143_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA19143.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA19143.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19143/NA19143_DNA_alignment.sort.bam 16:11264605-11267212 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA19143.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA19143.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20814/NA20814_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA20814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA20814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20814/NA20814_DNA_alignment.sort.bam 16:11264605-11267212  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA20814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA20814.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12283/NA12283_mapsplice_alignment.sort.bam chr16:11264605-11267212 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA12283.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1047_NA12283.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12283/NA12283_DNA_alignment.sort.bam 16:11264605-11267212 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA12283.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1047_NA12283.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1051.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:42652349-42653878 |  vcf-subset -c HG00379,HG00379,HG00160 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1051.vcf
echo -e chr1'	'42652349'	'42653878 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00379/HG00379_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00379.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00379.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00379/HG00379_DNA_alignment.sort.bam 1:42652349-42653878 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00379.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00379.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00379/HG00379_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00379.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00379.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00379/HG00379_DNA_alignment.sort.bam 1:42652349-42653878  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00379.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00379.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00160/HG00160_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00160.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1051_HG00160.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00160/HG00160_DNA_alignment.sort.bam 1:42652349-42653878 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00160.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1051_HG00160.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1051.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:42652349-42653878 |  vcf-subset -c HG00188,HG00329,NA12873 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1051.vcf
echo -e chr1'	'42652349'	'42653878 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 1:42652349-42653878 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_HG00188.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 1:42652349-42653878  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12873/NA12873_mapsplice_alignment.sort.bam chr1:42652349-42653878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_NA12873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1051_NA12873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12873/NA12873_DNA_alignment.sort.bam 1:42652349-42653878 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_NA12873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1051_NA12873.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1077.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418605-68419870 |  vcf-subset -c NA06985,HG00176,HG00176 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1077.vcf
echo -e chr9'	'68418605'	'68419870 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06985/NA06985_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_NA06985.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_NA06985.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06985/NA06985_DNA_alignment.sort.bam 9:68418605-68419870 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_NA06985.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_NA06985.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00176/HG00176_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_HG00176.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_HG00176.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00176/HG00176_DNA_alignment.sort.bam 9:68418605-68419870  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_HG00176.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_HG00176.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00176/HG00176_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_HG00176.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1077_HG00176.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00176/HG00176_DNA_alignment.sort.bam 9:68418605-68419870 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_HG00176.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1077_HG00176.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1077.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418605-68419870 |  vcf-subset -c HG00148,NA19144,HG00188 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1077.vcf
echo -e chr9'	'68418605'	'68419870 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00148/HG00148_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_HG00148.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_HG00148.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00148/HG00148_DNA_alignment.sort.bam 9:68418605-68419870 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_HG00148.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_HG00148.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19144/NA19144_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_NA19144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_NA19144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19144/NA19144_DNA_alignment.sort.bam 9:68418605-68419870  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_NA19144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_NA19144.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr9:68418605-68419870 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1077_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 9:68418605-68419870 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1077_HG00188.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1102.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:8872781-8873837 |  vcf-subset -c NA11893,NA12874,HG00362 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1102.vcf
echo -e chr17'	'8872781'	'8873837 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11893/NA11893_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_NA11893.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_NA11893.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11893/NA11893_DNA_alignment.sort.bam 17:8872781-8873837 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_NA11893.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_NA11893.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12874/NA12874_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_NA12874.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_NA12874.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12874/NA12874_DNA_alignment.sort.bam 17:8872781-8873837  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_NA12874.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_NA12874.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00362/HG00362_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_HG00362.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1102_HG00362.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00362/HG00362_DNA_alignment.sort.bam 17:8872781-8873837 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_HG00362.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1102_HG00362.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1102.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:8872781-8873837 |  vcf-subset -c NA18909,NA20541,NA20819 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1102.vcf
echo -e chr17'	'8872781'	'8873837 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18909/NA18909_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA18909.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA18909.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18909/NA18909_DNA_alignment.sort.bam 17:8872781-8873837 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA18909.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA18909.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20541/NA20541_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA20541.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA20541.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20541/NA20541_DNA_alignment.sort.bam 17:8872781-8873837  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA20541.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA20541.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20819/NA20819_mapsplice_alignment.sort.bam chr17:8872781-8873837 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA20819.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1102_NA20819.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20819/NA20819_DNA_alignment.sort.bam 17:8872781-8873837 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA20819.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1102_NA20819.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1126.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:6740434-6741281 |  vcf-subset -c HG00181,HG00181,HG00181 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1126.vcf
echo -e chr7'	'6740434'	'6741281 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00181/HG00181_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00181/HG00181_DNA_alignment.sort.bam 7:6740434-6741281 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00181/HG00181_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00181/HG00181_DNA_alignment.sort.bam 7:6740434-6741281  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00181/HG00181_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1126_HG00181.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00181/HG00181_DNA_alignment.sort.bam 7:6740434-6741281 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1126_HG00181.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1126.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:6740434-6741281 |  vcf-subset -c HG00250,NA20806,HG00263 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1126.vcf
echo -e chr7'	'6740434'	'6741281 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00250/HG00250_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_HG00250.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_HG00250.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00250/HG00250_DNA_alignment.sort.bam 7:6740434-6741281 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_HG00250.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_HG00250.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20806/NA20806_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_NA20806.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_NA20806.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20806/NA20806_DNA_alignment.sort.bam 7:6740434-6741281  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_NA20806.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_NA20806.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00263/HG00263_mapsplice_alignment.sort.bam chr7:6740434-6741281 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_HG00263.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1126_HG00263.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00263/HG00263_DNA_alignment.sort.bam 7:6740434-6741281 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_HG00263.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1126_HG00263.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1196.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:16761104-16762149 |  vcf-subset -c HG00188,HG00188,HG00188 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1196.vcf
echo -e chr11'	'16761104'	'16762149 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 11:16761104-16762149 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 11:16761104-16762149  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1196_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 11:16761104-16762149 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1196_HG00188.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1196.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:16761104-16762149 |  vcf-subset -c HG00338,NA20756,HG00355 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1196.vcf
echo -e chr11'	'16761104'	'16762149 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00338/HG00338_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_HG00338.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_HG00338.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00338/HG00338_DNA_alignment.sort.bam 11:16761104-16762149 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_HG00338.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_HG00338.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20756/NA20756_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_NA20756.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_NA20756.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20756/NA20756_DNA_alignment.sort.bam 11:16761104-16762149  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_NA20756.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_NA20756.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00355/HG00355_mapsplice_alignment.sort.bam chr11:16761104-16762149 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_HG00355.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1196_HG00355.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00355/HG00355_DNA_alignment.sort.bam 11:16761104-16762149 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_HG00355.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1196_HG00355.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1198.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417855-68420495 |  vcf-subset -c HG00188,HG00188,HG00188 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1198.vcf
echo -e chr9'	'68417855'	'68420495 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 9:68417855-68420495 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 9:68417855-68420495  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1198_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 9:68417855-68420495 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1198_HG00188.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1198.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417855-68420495 |  vcf-subset -c NA20792,HG00177,NA12348 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1198.vcf
echo -e chr9'	'68417855'	'68420495 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20792/NA20792_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_NA20792.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_NA20792.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20792/NA20792_DNA_alignment.sort.bam 9:68417855-68420495 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_NA20792.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_NA20792.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00177/HG00177_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_HG00177.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_HG00177.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00177/HG00177_DNA_alignment.sort.bam 9:68417855-68420495  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_HG00177.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_HG00177.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12348/NA12348_mapsplice_alignment.sort.bam chr9:68417855-68420495 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_NA12348.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1198_NA12348.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12348/NA12348_DNA_alignment.sort.bam 9:68417855-68420495 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_NA12348.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1198_NA12348.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1225.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:47841634-47842954 |  vcf-subset -c HG00232,HG00232,HG00232 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1225.vcf
echo -e chr4'	'47841634'	'47842954 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 4:47841634-47842954 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 4:47841634-47842954  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1225_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 4:47841634-47842954 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1225_HG00232.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1225.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:47841634-47842954 |  vcf-subset -c NA20808,NA19190,NA12546 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1225.vcf
echo -e chr4'	'47841634'	'47842954 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20808/NA20808_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA20808.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA20808.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20808/NA20808_DNA_alignment.sort.bam 4:47841634-47842954 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA20808.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA20808.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19190/NA19190_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA19190.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA19190.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19190/NA19190_DNA_alignment.sort.bam 4:47841634-47842954  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA19190.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA19190.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12546/NA12546_mapsplice_alignment.sort.bam chr4:47841634-47842954 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA12546.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1225_NA12546.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12546/NA12546_DNA_alignment.sort.bam 4:47841634-47842954 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA12546.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1225_NA12546.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1229.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:34604514-34605493 |  vcf-subset -c HG00232,HG00232,HG00232 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1229.vcf
echo -e chr21'	'34604514'	'34605493 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 21:34604514-34605493 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 21:34604514-34605493  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1229_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 21:34604514-34605493 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1229_HG00232.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1229.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:34604514-34605493 |  vcf-subset -c NA12814,NA19141,HG00158 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1229.vcf
echo -e chr21'	'34604514'	'34605493 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12814/NA12814_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_NA12814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_NA12814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12814/NA12814_DNA_alignment.sort.bam 21:34604514-34605493 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_NA12814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_NA12814.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19141/NA19141_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_NA19141.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_NA19141.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19141/NA19141_DNA_alignment.sort.bam 21:34604514-34605493  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_NA19141.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_NA19141.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00158/HG00158_mapsplice_alignment.sort.bam chr21:34604514-34605493 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_HG00158.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1229_HG00158.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00158/HG00158_DNA_alignment.sort.bam 21:34604514-34605493 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_HG00158.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1229_HG00158.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1268.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:221280100-221281310 |  vcf-subset -c HG00234,HG00234,HG00234 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1268.vcf
echo -e chr1'	'221280100'	'221281310 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 1:221280100-221281310 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 1:221280100-221281310  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1268_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 1:221280100-221281310 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1268_HG00234.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1268.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:221280100-221281310 |  vcf-subset -c NA12286,HG00180,HG00243 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1268.vcf
echo -e chr1'	'221280100'	'221281310 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12286/NA12286_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_NA12286.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_NA12286.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12286/NA12286_DNA_alignment.sort.bam 1:221280100-221281310 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_NA12286.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_NA12286.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00180/HG00180_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_HG00180.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_HG00180.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00180/HG00180_DNA_alignment.sort.bam 1:221280100-221281310  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_HG00180.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_HG00180.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00243/HG00243_mapsplice_alignment.sort.bam chr1:221280100-221281310 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_HG00243.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1268_HG00243.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00243/HG00243_DNA_alignment.sort.bam 1:221280100-221281310 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_HG00243.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1268_HG00243.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1271.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:14150733-14151580 |  vcf-subset -c HG00234,HG00234,HG00234 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1271.vcf
echo -e chr5'	'14150733'	'14151580 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 5:14150733-14151580 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 5:14150733-14151580  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1271_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 5:14150733-14151580 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1271_HG00234.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1271.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:14150733-14151580 |  vcf-subset -c NA12282,HG00311,HG00372 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1271.vcf
echo -e chr5'	'14150733'	'14151580 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12282/NA12282_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_NA12282.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_NA12282.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12282/NA12282_DNA_alignment.sort.bam 5:14150733-14151580 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_NA12282.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_NA12282.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00311/HG00311_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_HG00311.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_HG00311.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00311/HG00311_DNA_alignment.sort.bam 5:14150733-14151580  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_HG00311.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_HG00311.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00372/HG00372_mapsplice_alignment.sort.bam chr5:14150733-14151580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_HG00372.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1271_HG00372.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00372/HG00372_DNA_alignment.sort.bam 5:14150733-14151580 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_HG00372.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1271_HG00372.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1333.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1464992-1465839 |  vcf-subset -c HG00238,HG00238,HG00238 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1333.vcf
echo -e chr5'	'1464992'	'1465839 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00238/HG00238_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00238/HG00238_DNA_alignment.sort.bam 5:1464992-1465839 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00238/HG00238_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00238/HG00238_DNA_alignment.sort.bam 5:1464992-1465839  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00238/HG00238_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1333_HG00238.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00238/HG00238_DNA_alignment.sort.bam 5:1464992-1465839 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1333_HG00238.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1333.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1464992-1465839 |  vcf-subset -c NA12043,NA20531,NA12829 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1333.vcf
echo -e chr5'	'1464992'	'1465839 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12043/NA12043_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA12043.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA12043.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12043/NA12043_DNA_alignment.sort.bam 5:1464992-1465839 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA12043.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA12043.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20531/NA20531_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA20531.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA20531.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20531/NA20531_DNA_alignment.sort.bam 5:1464992-1465839  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA20531.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA20531.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12829/NA12829_mapsplice_alignment.sort.bam chr5:1464992-1465839 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA12829.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1333_NA12829.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12829/NA12829_DNA_alignment.sort.bam 5:1464992-1465839 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA12829.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1333_NA12829.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1514.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:97724150-97727472 |  vcf-subset -c NA18934,NA18934,HG00251 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1514.vcf
echo -e chr10'	'97724150'	'97727472 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 10:97724150-97727472 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 10:97724150-97727472  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00251/HG00251_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_HG00251.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1514_HG00251.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00251/HG00251_DNA_alignment.sort.bam 10:97724150-97727472 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_HG00251.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1514_HG00251.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1514.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:97724150-97727472 |  vcf-subset -c NA19160,NA20539,NA19118 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1514.vcf
echo -e chr10'	'97724150'	'97727472 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19160/NA19160_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA19160.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA19160.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19160/NA19160_DNA_alignment.sort.bam 10:97724150-97727472 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA19160.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA19160.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20539/NA20539_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA20539.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA20539.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20539/NA20539_DNA_alignment.sort.bam 10:97724150-97727472  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA20539.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA20539.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19118/NA19118_mapsplice_alignment.sort.bam chr10:97724150-97727472 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA19118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1514_NA19118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19118/NA19118_DNA_alignment.sort.bam 10:97724150-97727472 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA19118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1514_NA19118.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1548.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:154999075-155002122 |  vcf-subset -c HG00255,HG00255,HG00255 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1548.vcf
echo -e chr7'	'154999075'	'155002122 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00255/HG00255_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00255/HG00255_DNA_alignment.sort.bam 7:154999075-155002122 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00255/HG00255_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00255/HG00255_DNA_alignment.sort.bam 7:154999075-155002122  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00255/HG00255_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1548_HG00255.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00255/HG00255_DNA_alignment.sort.bam 7:154999075-155002122 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1548_HG00255.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1548.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:154999075-155002122 |  vcf-subset -c HG00262,HG00329,NA12546 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1548.vcf
echo -e chr7'	'154999075'	'155002122 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00262/HG00262_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_HG00262.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_HG00262.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00262/HG00262_DNA_alignment.sort.bam 7:154999075-155002122 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_HG00262.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_HG00262.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 7:154999075-155002122  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12546/NA12546_mapsplice_alignment.sort.bam chr7:154999075-155002122 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_NA12546.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1548_NA12546.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12546/NA12546_DNA_alignment.sort.bam 7:154999075-155002122 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_NA12546.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1548_NA12546.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1560.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72461114-72462159 |  vcf-subset -c NA20752,NA20752,NA20752 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1560.vcf
echo -e chr17'	'72461114'	'72462159 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 17:72461114-72462159 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 17:72461114-72462159  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1560_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 17:72461114-72462159 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1560_NA20752.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1560.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72461114-72462159 |  vcf-subset -c HG00272,NA20502,NA20785 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1560.vcf
echo -e chr17'	'72461114'	'72462159 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00272/HG00272_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_HG00272.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_HG00272.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00272/HG00272_DNA_alignment.sort.bam 17:72461114-72462159 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_HG00272.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_HG00272.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20502/NA20502_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_NA20502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_NA20502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20502/NA20502_DNA_alignment.sort.bam 17:72461114-72462159  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_NA20502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_NA20502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20785/NA20785_mapsplice_alignment.sort.bam chr17:72461114-72462159 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_NA20785.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1560_NA20785.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20785/NA20785_DNA_alignment.sort.bam 17:72461114-72462159 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_NA20785.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1560_NA20785.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1565.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418491-68420009 |  vcf-subset -c HG00256,HG00256,HG00256 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1565.vcf
echo -e chr9'	'68418491'	'68420009 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00256/HG00256_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00256/HG00256_DNA_alignment.sort.bam 9:68418491-68420009 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00256/HG00256_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00256/HG00256_DNA_alignment.sort.bam 9:68418491-68420009  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00256/HG00256_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1565_HG00256.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00256/HG00256_DNA_alignment.sort.bam 9:68418491-68420009 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1565_HG00256.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1565.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418491-68420009 |  vcf-subset -c HG00375,NA20758,HG00313 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1565.vcf
echo -e chr9'	'68418491'	'68420009 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00375/HG00375_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_HG00375.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_HG00375.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00375/HG00375_DNA_alignment.sort.bam 9:68418491-68420009 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_HG00375.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_HG00375.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20758/NA20758_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_NA20758.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_NA20758.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20758/NA20758_DNA_alignment.sort.bam 9:68418491-68420009  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_NA20758.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_NA20758.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00313/HG00313_mapsplice_alignment.sort.bam chr9:68418491-68420009 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_HG00313.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1565_HG00313.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00313/HG00313_DNA_alignment.sort.bam 9:68418491-68420009 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_HG00313.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1565_HG00313.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1575.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:121427175-121429111 |  vcf-subset -c HG00257,HG00257,HG00257 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1575.vcf
echo -e chr6'	'121427175'	'121429111 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 6:121427175-121429111 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 6:121427175-121429111  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1575_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 6:121427175-121429111 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1575_HG00257.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1575.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:121427175-121429111 |  vcf-subset -c HG00121,HG00278,HG00343 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1575.vcf
echo -e chr6'	'121427175'	'121429111 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00121/HG00121_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00121.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00121.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00121/HG00121_DNA_alignment.sort.bam 6:121427175-121429111 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00121.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00121.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00278/HG00278_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00278.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00278.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00278/HG00278_DNA_alignment.sort.bam 6:121427175-121429111  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00278.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00278.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00343/HG00343_mapsplice_alignment.sort.bam chr6:121427175-121429111 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00343.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1575_HG00343.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00343/HG00343_DNA_alignment.sort.bam 6:121427175-121429111 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00343.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1575_HG00343.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1576.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:130751643-130752754 |  vcf-subset -c HG00257,HG00257,HG00257 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1576.vcf
echo -e chr11'	'130751643'	'130752754 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 11:130751643-130752754 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 11:130751643-130752754  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1576_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 11:130751643-130752754 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1576_HG00257.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1576.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:130751643-130752754 |  vcf-subset -c NA19225,HG00148,HG00101 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1576.vcf
echo -e chr11'	'130751643'	'130752754 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19225/NA19225_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_NA19225.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_NA19225.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19225/NA19225_DNA_alignment.sort.bam 11:130751643-130752754 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_NA19225.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_NA19225.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00148/HG00148_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_HG00148.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_HG00148.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00148/HG00148_DNA_alignment.sort.bam 11:130751643-130752754  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_HG00148.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_HG00148.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00101/HG00101_mapsplice_alignment.sort.bam chr11:130751643-130752754 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_HG00101.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1576_HG00101.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00101/HG00101_DNA_alignment.sort.bam 11:130751643-130752754 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_HG00101.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1576_HG00101.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1582.vcf
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz  X:73435360-73436273 |  vcf-subset -c HG00258,HG00258,HG00258 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1582.vcf 
echo -e chrX'	'73435360'	'73436273 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam X:73435360-73436273 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam X:73435360-73436273  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1582_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam X:73435360-73436273 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1582_HG00258.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1582.vcf
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz  X:73435360-73436273 |  vcf-subset -c NA12830,HG00274,HG00132 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1582.vcf 
echo -e chrX'	'73435360'	'73436273 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12830/NA12830_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_NA12830.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_NA12830.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12830/NA12830_DNA_alignment.sort.bam X:73435360-73436273 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_NA12830.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_NA12830.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00274/HG00274_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_HG00274.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_HG00274.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00274/HG00274_DNA_alignment.sort.bam X:73435360-73436273  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_HG00274.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_HG00274.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chrX:73435360-73436273 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1582_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam X:73435360-73436273 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1582_HG00132.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1583.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:100203568-100204580 |  vcf-subset -c HG00258,HG00258,HG00258 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1583.vcf
echo -e chr5'	'100203568'	'100204580 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam 5:100203568-100204580 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam 5:100203568-100204580  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1583_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam 5:100203568-100204580 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1583_HG00258.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1583.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:100203568-100204580 |  vcf-subset -c HG00262,NA11995,HG00099 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1583.vcf
echo -e chr5'	'100203568'	'100204580 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00262/HG00262_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_HG00262.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_HG00262.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00262/HG00262_DNA_alignment.sort.bam 5:100203568-100204580 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_HG00262.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_HG00262.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11995/NA11995_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_NA11995.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_NA11995.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11995/NA11995_DNA_alignment.sort.bam 5:100203568-100204580  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_NA11995.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_NA11995.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00099/HG00099_mapsplice_alignment.sort.bam chr5:100203568-100204580 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_HG00099.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1583_HG00099.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00099/HG00099_DNA_alignment.sort.bam 5:100203568-100204580 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_HG00099.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1583_HG00099.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1597.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:51743610-51744644 |  vcf-subset -c HG00259,HG00259,HG00259 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1597.vcf
echo -e chr14'	'51743610'	'51744644 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:51743610-51744644 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:51743610-51744644  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1597_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:51743610-51744644 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1597_HG00259.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1597.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:51743610-51744644 |  vcf-subset -c NA18934,HG00187,NA12043 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1597.vcf
echo -e chr14'	'51743610'	'51744644 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 14:51743610-51744644 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00187/HG00187_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_HG00187.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_HG00187.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00187/HG00187_DNA_alignment.sort.bam 14:51743610-51744644  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_HG00187.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_HG00187.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12043/NA12043_mapsplice_alignment.sort.bam chr14:51743610-51744644 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_NA12043.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1597_NA12043.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12043/NA12043_DNA_alignment.sort.bam 14:51743610-51744644 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_NA12043.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1597_NA12043.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1598.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418562-68419926 |  vcf-subset -c NA19225,NA20812,NA20812 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1598.vcf
echo -e chr9'	'68418562'	'68419926 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19225/NA19225_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA19225.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA19225.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19225/NA19225_DNA_alignment.sort.bam 9:68418562-68419926 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA19225.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA19225.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20812/NA20812_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA20812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA20812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20812/NA20812_DNA_alignment.sort.bam 9:68418562-68419926  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA20812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA20812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20812/NA20812_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA20812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1598_NA20812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20812/NA20812_DNA_alignment.sort.bam 9:68418562-68419926 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA20812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1598_NA20812.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1598.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418562-68419926 |  vcf-subset -c HG00267,HG00308,NA20506 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1598.vcf
echo -e chr9'	'68418562'	'68419926 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00267/HG00267_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_HG00267.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_HG00267.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00267/HG00267_DNA_alignment.sort.bam 9:68418562-68419926 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_HG00267.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_HG00267.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00308/HG00308_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_HG00308.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_HG00308.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00308/HG00308_DNA_alignment.sort.bam 9:68418562-68419926  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_HG00308.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_HG00308.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20506/NA20506_mapsplice_alignment.sort.bam chr9:68418562-68419926 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_NA20506.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1598_NA20506.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20506/NA20506_DNA_alignment.sort.bam 9:68418562-68419926 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_NA20506.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1598_NA20506.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1600.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:106151844-106161524 |  vcf-subset -c HG00259,HG00259,HG00259 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1600.vcf
echo -e chr14'	'106151844'	'106161524 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151844-106161524 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151844-106161524  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1600_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151844-106161524 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1600_HG00259.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1600.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:106151844-106161524 |  vcf-subset -c HG00382,HG00106,HG00112 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1600.vcf
echo -e chr14'	'106151844'	'106161524 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 14:106151844-106161524 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00382.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00106/HG00106_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00106.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00106.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00106/HG00106_DNA_alignment.sort.bam 14:106151844-106161524  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00106.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00106.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00112/HG00112_mapsplice_alignment.sort.bam chr14:106151844-106161524 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00112.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1600_HG00112.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00112/HG00112_DNA_alignment.sort.bam 14:106151844-106161524 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00112.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1600_HG00112.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1601.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:106151447-106162117 |  vcf-subset -c HG00259,HG00259,HG00259 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1601.vcf
echo -e chr14'	'106151447'	'106162117 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151447-106162117 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151447-106162117  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1601_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 14:106151447-106162117 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1601_HG00259.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1601.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:106151447-106162117 |  vcf-subset -c NA19138,HG00182,HG00361 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1601.vcf
echo -e chr14'	'106151447'	'106162117 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 14:106151447-106162117 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_NA19138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00182/HG00182_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_HG00182.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_HG00182.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00182/HG00182_DNA_alignment.sort.bam 14:106151447-106162117  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_HG00182.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_HG00182.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00361/HG00361_mapsplice_alignment.sort.bam chr14:106151447-106162117 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_HG00361.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1601_HG00361.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00361/HG00361_DNA_alignment.sort.bam 14:106151447-106162117 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_HG00361.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1601_HG00361.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1653.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:14143450-14146277 |  vcf-subset -c HG00261,HG00261,HG00261 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1653.vcf
echo -e chr5'	'14143450'	'14146277 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00261/HG00261_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00261/HG00261_DNA_alignment.sort.bam 5:14143450-14146277 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00261/HG00261_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00261/HG00261_DNA_alignment.sort.bam 5:14143450-14146277  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00261/HG00261_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1653_HG00261.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00261/HG00261_DNA_alignment.sort.bam 5:14143450-14146277 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1653_HG00261.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1653.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:14143450-14146277 |  vcf-subset -c NA12045,NA20542,NA18917 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1653.vcf
echo -e chr5'	'14143450'	'14146277 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12045/NA12045_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA12045.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA12045.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12045/NA12045_DNA_alignment.sort.bam 5:14143450-14146277 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA12045.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA12045.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20542/NA20542_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA20542.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA20542.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20542/NA20542_DNA_alignment.sort.bam 5:14143450-14146277  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA20542.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA20542.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18917/NA18917_mapsplice_alignment.sort.bam chr5:14143450-14146277 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA18917.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1653_NA18917.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18917/NA18917_DNA_alignment.sort.bam 5:14143450-14146277 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA18917.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1653_NA18917.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1695.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:81002352-81004057 |  vcf-subset -c HG00264,HG00264,HG00264 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1695.vcf
echo -e chr10'	'81002352'	'81004057 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00264/HG00264_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00264/HG00264_DNA_alignment.sort.bam 10:81002352-81004057 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00264/HG00264_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00264/HG00264_DNA_alignment.sort.bam 10:81002352-81004057  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00264/HG00264_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1695_HG00264.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00264/HG00264_DNA_alignment.sort.bam 10:81002352-81004057 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1695_HG00264.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1695.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:81002352-81004057 |  vcf-subset -c NA20801,HG00106,NA07056 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1695.vcf
echo -e chr10'	'81002352'	'81004057 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20801/NA20801_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_NA20801.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_NA20801.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20801/NA20801_DNA_alignment.sort.bam 10:81002352-81004057 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_NA20801.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_NA20801.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00106/HG00106_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_HG00106.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_HG00106.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00106/HG00106_DNA_alignment.sort.bam 10:81002352-81004057  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_HG00106.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_HG00106.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07056/NA07056_mapsplice_alignment.sort.bam chr10:81002352-81004057 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_NA07056.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1695_NA07056.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07056/NA07056_DNA_alignment.sort.bam 10:81002352-81004057 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_NA07056.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1695_NA07056.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1703.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:15305136-15306984 |  vcf-subset -c HG00266,HG00266,HG00266 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1703.vcf
echo -e chr9'	'15305136'	'15306984 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00266/HG00266_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00266/HG00266_DNA_alignment.sort.bam 9:15305136-15306984 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00266/HG00266_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00266/HG00266_DNA_alignment.sort.bam 9:15305136-15306984  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00266/HG00266_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1703_HG00266.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00266/HG00266_DNA_alignment.sort.bam 9:15305136-15306984 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1703_HG00266.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1703.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:15305136-15306984 |  vcf-subset -c NA10851,HG00313,HG00246 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1703.vcf
echo -e chr9'	'15305136'	'15306984 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10851/NA10851_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_NA10851.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_NA10851.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10851/NA10851_DNA_alignment.sort.bam 9:15305136-15306984 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_NA10851.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_NA10851.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00313/HG00313_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_HG00313.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_HG00313.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00313/HG00313_DNA_alignment.sort.bam 9:15305136-15306984  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_HG00313.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_HG00313.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00246/HG00246_mapsplice_alignment.sort.bam chr9:15305136-15306984 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_HG00246.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1703_HG00246.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00246/HG00246_DNA_alignment.sort.bam 9:15305136-15306984 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_HG00246.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1703_HG00246.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1742.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418167-68420235 |  vcf-subset -c HG00271,HG00271,HG00271 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1742.vcf
echo -e chr9'	'68418167'	'68420235 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00271/HG00271_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00271/HG00271_DNA_alignment.sort.bam 9:68418167-68420235 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00271/HG00271_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00271/HG00271_DNA_alignment.sort.bam 9:68418167-68420235  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00271/HG00271_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1742_HG00271.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00271/HG00271_DNA_alignment.sort.bam 9:68418167-68420235 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1742_HG00271.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1742.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418167-68420235 |  vcf-subset -c HG00174,NA20589,HG00119 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1742.vcf
echo -e chr9'	'68418167'	'68420235 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00174/HG00174_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_HG00174.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_HG00174.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00174/HG00174_DNA_alignment.sort.bam 9:68418167-68420235 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_HG00174.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_HG00174.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20589/NA20589_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_NA20589.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_NA20589.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20589/NA20589_DNA_alignment.sort.bam 9:68418167-68420235  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_NA20589.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_NA20589.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00119/HG00119_mapsplice_alignment.sort.bam chr9:68418167-68420235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_HG00119.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1742_HG00119.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00119/HG00119_DNA_alignment.sort.bam 9:68418167-68420235 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_HG00119.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1742_HG00119.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1759.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:124839644-124845815 |  vcf-subset -c HG00275,HG00275,HG00275 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1759.vcf
echo -e chr12'	'124839644'	'124845815 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 12:124839644-124845815 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 12:124839644-124845815  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1759_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 12:124839644-124845815 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1759_HG00275.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1759.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:124839644-124845815 |  vcf-subset -c HG00238,HG00234,HG00250 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1759.vcf
echo -e chr12'	'124839644'	'124845815 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00238/HG00238_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00238.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00238.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00238/HG00238_DNA_alignment.sort.bam 12:124839644-124845815 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00238.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00238.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 12:124839644-124845815  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00250/HG00250_mapsplice_alignment.sort.bam chr12:124839644-124845815 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00250.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1759_HG00250.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00250/HG00250_DNA_alignment.sort.bam 12:124839644-124845815 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00250.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1759_HG00250.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1767.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:119288790-119289934 |  vcf-subset -c HG00275,HG00275,HG00275 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1767.vcf
echo -e chr3'	'119288790'	'119289934 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 3:119288790-119289934 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 3:119288790-119289934  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00275/HG00275_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1767_HG00275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00275/HG00275_DNA_alignment.sort.bam 3:119288790-119289934 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1767_HG00275.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1767.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:119288790-119289934 |  vcf-subset -c NA12830,NA10851,HG00309 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1767.vcf
echo -e chr3'	'119288790'	'119289934 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12830/NA12830_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_NA12830.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_NA12830.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12830/NA12830_DNA_alignment.sort.bam 3:119288790-119289934 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_NA12830.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_NA12830.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10851/NA10851_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_NA10851.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_NA10851.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10851/NA10851_DNA_alignment.sort.bam 3:119288790-119289934  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_NA10851.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_NA10851.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00309/HG00309_mapsplice_alignment.sort.bam chr3:119288790-119289934 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_HG00309.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1767_HG00309.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00309/HG00309_DNA_alignment.sort.bam 3:119288790-119289934 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_HG00309.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1767_HG00309.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1805.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418056-68420531 |  vcf-subset -c HG00280,HG00280,HG00280 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1805.vcf
echo -e chr9'	'68418056'	'68420531 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00280/HG00280_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00280/HG00280_DNA_alignment.sort.bam 9:68418056-68420531 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00280/HG00280_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00280/HG00280_DNA_alignment.sort.bam 9:68418056-68420531  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00280/HG00280_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1805_HG00280.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00280/HG00280_DNA_alignment.sort.bam 9:68418056-68420531 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1805_HG00280.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1805.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418056-68420531 |  vcf-subset -c HG00235,NA12400,NA12815 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1805.vcf
echo -e chr9'	'68418056'	'68420531 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00235/HG00235_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_HG00235.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_HG00235.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00235/HG00235_DNA_alignment.sort.bam 9:68418056-68420531 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_HG00235.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_HG00235.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12400/NA12400_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_NA12400.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_NA12400.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12400/NA12400_DNA_alignment.sort.bam 9:68418056-68420531  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_NA12400.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_NA12400.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12815/NA12815_mapsplice_alignment.sort.bam chr9:68418056-68420531 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_NA12815.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1805_NA12815.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12815/NA12815_DNA_alignment.sort.bam 9:68418056-68420531 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_NA12815.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1805_NA12815.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1856.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:207096428-207097737 |  vcf-subset -c HG00309,HG00309,HG00309 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1856.vcf
echo -e chr1'	'207096428'	'207097737 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00309/HG00309_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00309/HG00309_DNA_alignment.sort.bam 1:207096428-207097737 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00309/HG00309_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00309/HG00309_DNA_alignment.sort.bam 1:207096428-207097737  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00309/HG00309_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1856_HG00309.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00309/HG00309_DNA_alignment.sort.bam 1:207096428-207097737 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1856_HG00309.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1856.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:207096428-207097737 |  vcf-subset -c HG00235,HG00110,HG00240 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1856.vcf
echo -e chr1'	'207096428'	'207097737 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00235/HG00235_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00235.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00235.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00235/HG00235_DNA_alignment.sort.bam 1:207096428-207097737 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00235.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00235.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00110/HG00110_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00110.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00110.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00110/HG00110_DNA_alignment.sort.bam 1:207096428-207097737  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00110.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00110.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00240/HG00240_mapsplice_alignment.sort.bam chr1:207096428-207097737 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00240.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1856_HG00240.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00240/HG00240_DNA_alignment.sort.bam 1:207096428-207097737 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00240.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1856_HG00240.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1874.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:26195324-26196215 |  vcf-subset -c NA20504,NA20504,NA20504 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1874.vcf
echo -e chr6'	'26195324'	'26196215 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 6:26195324-26196215 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 6:26195324-26196215  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1874_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 6:26195324-26196215 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1874_NA20504.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1874.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:26195324-26196215 |  vcf-subset -c NA12814,NA18489,NA19147 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1874.vcf
echo -e chr6'	'26195324'	'26196215 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12814/NA12814_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA12814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA12814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12814/NA12814_DNA_alignment.sort.bam 6:26195324-26196215 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA12814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA12814.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18489/NA18489_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA18489.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA18489.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18489/NA18489_DNA_alignment.sort.bam 6:26195324-26196215  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA18489.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA18489.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19147/NA19147_mapsplice_alignment.sort.bam chr6:26195324-26196215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA19147.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1874_NA19147.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19147/NA19147_DNA_alignment.sort.bam 6:26195324-26196215 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA19147.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1874_NA19147.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1957.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68419077-68420210 |  vcf-subset -c HG00323,HG00323,HG00323 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1957.vcf
echo -e chr9'	'68419077'	'68420210 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00323/HG00323_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00323/HG00323_DNA_alignment.sort.bam 9:68419077-68420210 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00323/HG00323_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00323/HG00323_DNA_alignment.sort.bam 9:68419077-68420210  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00323/HG00323_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1957_HG00323.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00323/HG00323_DNA_alignment.sort.bam 9:68419077-68420210 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1957_HG00323.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1957.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68419077-68420210 |  vcf-subset -c NA20540,NA06994,NA20503 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1957.vcf
echo -e chr9'	'68419077'	'68420210 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20540/NA20540_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA20540.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA20540.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20540/NA20540_DNA_alignment.sort.bam 9:68419077-68420210 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA20540.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA20540.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06994/NA06994_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA06994.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA06994.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06994/NA06994_DNA_alignment.sort.bam 9:68419077-68420210  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA06994.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA06994.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20503/NA20503_mapsplice_alignment.sort.bam chr9:68419077-68420210 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA20503.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1957_NA20503.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20503/NA20503_DNA_alignment.sort.bam 9:68419077-68420210 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA20503.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1957_NA20503.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1988.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:36382979-36384519 |  vcf-subset -c HG00325,HG00325,HG00325 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_1988.vcf
echo -e chr9'	'36382979'	'36384519 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00325/HG00325_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00325/HG00325_DNA_alignment.sort.bam 9:36382979-36384519 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00325/HG00325_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00325/HG00325_DNA_alignment.sort.bam 9:36382979-36384519  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00325/HG00325_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_1988_HG00325.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00325/HG00325_DNA_alignment.sort.bam 9:36382979-36384519 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_1988_HG00325.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1988.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:36382979-36384519 |  vcf-subset -c HG00284,NA12843,NA20541 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_1988.vcf
echo -e chr9'	'36382979'	'36384519 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00284/HG00284_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_HG00284.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_HG00284.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00284/HG00284_DNA_alignment.sort.bam 9:36382979-36384519 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_HG00284.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_HG00284.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12843/NA12843_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_NA12843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_NA12843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12843/NA12843_DNA_alignment.sort.bam 9:36382979-36384519  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_NA12843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_NA12843.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20541/NA20541_mapsplice_alignment.sort.bam chr9:36382979-36384519 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_NA20541.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_1988_NA20541.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20541/NA20541_DNA_alignment.sort.bam 9:36382979-36384519 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_NA20541.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_1988_NA20541.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2024.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:878225-884330 |  vcf-subset -c HG00328,HG00328,HG00328 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2024.vcf
echo -e chr4'	'878225'	'884330 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:878225-884330 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:878225-884330  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2024_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:878225-884330 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2024_HG00328.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2024.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:878225-884330 |  vcf-subset -c NA12778,NA19143,NA18908 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2024.vcf
echo -e chr4'	'878225'	'884330 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12778/NA12778_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA12778.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA12778.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12778/NA12778_DNA_alignment.sort.bam 4:878225-884330 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA12778.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA12778.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19143/NA19143_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA19143.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA19143.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19143/NA19143_DNA_alignment.sort.bam 4:878225-884330  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA19143.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA19143.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18908/NA18908_mapsplice_alignment.sort.bam chr4:878225-884330 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA18908.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2024_NA18908.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18908/NA18908_DNA_alignment.sort.bam 4:878225-884330 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA18908.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2024_NA18908.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2025.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:3528180-3530094 |  vcf-subset -c HG00328,HG00328,HG00328 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2025.vcf
echo -e chr4'	'3528180'	'3530094 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:3528180-3530094 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:3528180-3530094  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00328/HG00328_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2025_HG00328.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00328/HG00328_DNA_alignment.sort.bam 4:3528180-3530094 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2025_HG00328.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2025.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:3528180-3530094 |  vcf-subset -c HG00231,NA20504,HG00380 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2025.vcf
echo -e chr4'	'3528180'	'3530094 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00231/HG00231_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_HG00231.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_HG00231.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00231/HG00231_DNA_alignment.sort.bam 4:3528180-3530094 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_HG00231.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_HG00231.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 4:3528180-3530094  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_NA20504.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00380/HG00380_mapsplice_alignment.sort.bam chr4:3528180-3530094 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_HG00380.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2025_HG00380.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00380/HG00380_DNA_alignment.sort.bam 4:3528180-3530094 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_HG00380.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2025_HG00380.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2029.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:45880269-45881215 |  vcf-subset -c HG00329,HG00329,HG00329 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2029.vcf
echo -e chr21'	'45880269'	'45881215 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 21:45880269-45881215 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 21:45880269-45881215  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2029_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 21:45880269-45881215 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2029_HG00329.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2029.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:45880269-45881215 |  vcf-subset -c NA12874,NA11918,NA20826 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2029.vcf
echo -e chr21'	'45880269'	'45881215 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12874/NA12874_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA12874.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA12874.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12874/NA12874_DNA_alignment.sort.bam 21:45880269-45881215 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA12874.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA12874.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11918/NA11918_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA11918.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA11918.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11918/NA11918_DNA_alignment.sort.bam 21:45880269-45881215  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA11918.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA11918.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20826/NA20826_mapsplice_alignment.sort.bam chr21:45880269-45881215 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA20826.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2029_NA20826.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20826/NA20826_DNA_alignment.sort.bam 21:45880269-45881215 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA20826.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2029_NA20826.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2051.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:27449662-27452038 |  vcf-subset -c HG00332,HG00332,HG00332 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2051.vcf
echo -e chr16'	'27449662'	'27452038 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00332/HG00332_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00332/HG00332_DNA_alignment.sort.bam 16:27449662-27452038 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00332/HG00332_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00332/HG00332_DNA_alignment.sort.bam 16:27449662-27452038  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00332/HG00332_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2051_HG00332.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00332/HG00332_DNA_alignment.sort.bam 16:27449662-27452038 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2051_HG00332.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2051.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:27449662-27452038 |  vcf-subset -c NA19137,NA20515,NA20769 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2051.vcf
echo -e chr16'	'27449662'	'27452038 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19137/NA19137_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA19137.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA19137.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19137/NA19137_DNA_alignment.sort.bam 16:27449662-27452038 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA19137.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA19137.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20515/NA20515_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA20515.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA20515.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20515/NA20515_DNA_alignment.sort.bam 16:27449662-27452038  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA20515.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA20515.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20769/NA20769_mapsplice_alignment.sort.bam chr16:27449662-27452038 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA20769.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2051_NA20769.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20769/NA20769_DNA_alignment.sort.bam 16:27449662-27452038 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA20769.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2051_NA20769.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2071.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:99199965-99202297 |  vcf-subset -c HG00336,HG00336,HG00336 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2071.vcf
echo -e chr2'	'99199965'	'99202297 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00336/HG00336_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00336/HG00336_DNA_alignment.sort.bam 2:99199965-99202297 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00336/HG00336_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00336/HG00336_DNA_alignment.sort.bam 2:99199965-99202297  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00336/HG00336_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2071_HG00336.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00336/HG00336_DNA_alignment.sort.bam 2:99199965-99202297 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2071_HG00336.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2071.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:99199965-99202297 |  vcf-subset -c HG00233,NA18909,NA19098 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2071.vcf
echo -e chr2'	'99199965'	'99202297 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00233/HG00233_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_HG00233.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_HG00233.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00233/HG00233_DNA_alignment.sort.bam 2:99199965-99202297 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_HG00233.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_HG00233.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18909/NA18909_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_NA18909.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_NA18909.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18909/NA18909_DNA_alignment.sort.bam 2:99199965-99202297  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_NA18909.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_NA18909.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19098/NA19098_mapsplice_alignment.sort.bam chr2:99199965-99202297 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_NA19098.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2071_NA19098.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19098/NA19098_DNA_alignment.sort.bam 2:99199965-99202297 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_NA19098.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2071_NA19098.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2091.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:15829714-15831001 |  vcf-subset -c HG00339,HG00339,HG00339 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2091.vcf
echo -e chr10'	'15829714'	'15831001 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00339/HG00339_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00339/HG00339_DNA_alignment.sort.bam 10:15829714-15831001 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00339/HG00339_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00339/HG00339_DNA_alignment.sort.bam 10:15829714-15831001  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00339/HG00339_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2091_HG00339.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00339/HG00339_DNA_alignment.sort.bam 10:15829714-15831001 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2091_HG00339.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2091.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:15829714-15831001 |  vcf-subset -c NA19189,NA12751,HG00320 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2091.vcf
echo -e chr10'	'15829714'	'15831001 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19189/NA19189_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_NA19189.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_NA19189.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19189/NA19189_DNA_alignment.sort.bam 10:15829714-15831001 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_NA19189.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_NA19189.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12751/NA12751_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_NA12751.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_NA12751.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12751/NA12751_DNA_alignment.sort.bam 10:15829714-15831001  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_NA12751.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_NA12751.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00320/HG00320_mapsplice_alignment.sort.bam chr10:15829714-15831001 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_HG00320.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2091_HG00320.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00320/HG00320_DNA_alignment.sort.bam 10:15829714-15831001 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_HG00320.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2091_HG00320.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2122.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38789070-38790511 |  vcf-subset -c HG00345,HG00345,HG00345 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2122.vcf
echo -e chr4'	'38789070'	'38790511 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00345/HG00345_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00345/HG00345_DNA_alignment.sort.bam 4:38789070-38790511 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00345/HG00345_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00345/HG00345_DNA_alignment.sort.bam 4:38789070-38790511  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00345/HG00345_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2122_HG00345.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00345/HG00345_DNA_alignment.sort.bam 4:38789070-38790511 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2122_HG00345.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2122.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38789070-38790511 |  vcf-subset -c HG02215,HG00272,NA20536 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2122.vcf
echo -e chr4'	'38789070'	'38790511 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG02215/HG02215_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_HG02215.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_HG02215.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG02215/HG02215_DNA_alignment.sort.bam 4:38789070-38790511 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_HG02215.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_HG02215.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00272/HG00272_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_HG00272.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_HG00272.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00272/HG00272_DNA_alignment.sort.bam 4:38789070-38790511  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_HG00272.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_HG00272.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20536/NA20536_mapsplice_alignment.sort.bam chr4:38789070-38790511 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_NA20536.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2122_NA20536.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20536/NA20536_DNA_alignment.sort.bam 4:38789070-38790511 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_NA20536.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2122_NA20536.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2152.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418617-68419860 |  vcf-subset -c HG00377,NA18916,HG00377 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2152.vcf
echo -e chr9'	'68418617'	'68419860 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00377/HG00377_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_HG00377.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_HG00377.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00377/HG00377_DNA_alignment.sort.bam 9:68418617-68419860 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_HG00377.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_HG00377.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18916/NA18916_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_NA18916.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_NA18916.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18916/NA18916_DNA_alignment.sort.bam 9:68418617-68419860  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_NA18916.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_NA18916.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00377/HG00377_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_HG00377.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2152_HG00377.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00377/HG00377_DNA_alignment.sort.bam 9:68418617-68419860 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_HG00377.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2152_HG00377.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2152.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418617-68419860 |  vcf-subset -c HG00321,NA12874,HG00250 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2152.vcf
echo -e chr9'	'68418617'	'68419860 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00321/HG00321_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_HG00321.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_HG00321.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00321/HG00321_DNA_alignment.sort.bam 9:68418617-68419860 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_HG00321.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_HG00321.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12874/NA12874_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_NA12874.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_NA12874.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12874/NA12874_DNA_alignment.sort.bam 9:68418617-68419860  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_NA12874.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_NA12874.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00250/HG00250_mapsplice_alignment.sort.bam chr9:68418617-68419860 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_HG00250.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2152_HG00250.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00250/HG00250_DNA_alignment.sort.bam 9:68418617-68419860 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_HG00250.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2152_HG00250.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2186.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:139330719-139331654 |  vcf-subset -c HG00358,HG00358,HG00358 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2186.vcf
echo -e chr9'	'139330719'	'139331654 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 9:139330719-139331654 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 9:139330719-139331654  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2186_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 9:139330719-139331654 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2186_HG00358.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2186.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:139330719-139331654 |  vcf-subset -c HG00242,NA19185,NA20510 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2186.vcf
echo -e chr9'	'139330719'	'139331654 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00242/HG00242_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_HG00242.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_HG00242.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00242/HG00242_DNA_alignment.sort.bam 9:139330719-139331654 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_HG00242.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_HG00242.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19185/NA19185_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_NA19185.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_NA19185.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19185/NA19185_DNA_alignment.sort.bam 9:139330719-139331654  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_NA19185.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_NA19185.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20510/NA20510_mapsplice_alignment.sort.bam chr9:139330719-139331654 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_NA20510.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2186_NA20510.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20510/NA20510_DNA_alignment.sort.bam 9:139330719-139331654 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_NA20510.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2186_NA20510.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2188.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:129087277-129091633 |  vcf-subset -c HG00358,HG00358,HG00358 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2188.vcf
echo -e chr3'	'129087277'	'129091633 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 3:129087277-129091633 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 3:129087277-129091633  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00358/HG00358_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2188_HG00358.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00358/HG00358_DNA_alignment.sort.bam 3:129087277-129091633 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2188_HG00358.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2188.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:129087277-129091633 |  vcf-subset -c HG00182,NA11931,HG00148 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2188.vcf
echo -e chr3'	'129087277'	'129091633 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00182/HG00182_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_HG00182.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_HG00182.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00182/HG00182_DNA_alignment.sort.bam 3:129087277-129091633 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_HG00182.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_HG00182.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11931/NA11931_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_NA11931.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_NA11931.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11931/NA11931_DNA_alignment.sort.bam 3:129087277-129091633  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_NA11931.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_NA11931.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00148/HG00148_mapsplice_alignment.sort.bam chr3:129087277-129091633 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_HG00148.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2188_HG00148.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00148/HG00148_DNA_alignment.sort.bam 3:129087277-129091633 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_HG00148.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2188_HG00148.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2212.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 15:67467602-67468867 |  vcf-subset -c NA12763,NA12383,NA18499 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2212.vcf
echo -e chr15'	'67467602'	'67468867 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12763/NA12763_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA12763.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA12763.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12763/NA12763_DNA_alignment.sort.bam 15:67467602-67468867 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA12763.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA12763.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12383/NA12383_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA12383.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA12383.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12383/NA12383_DNA_alignment.sort.bam 15:67467602-67468867  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA12383.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA12383.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18499/NA18499_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA18499.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2212_NA18499.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18499/NA18499_DNA_alignment.sort.bam 15:67467602-67468867 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA18499.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2212_NA18499.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2212.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 15:67467602-67468867 |  vcf-subset -c NA11920,HG00255,NA12275 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2212.vcf
echo -e chr15'	'67467602'	'67468867 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11920/NA11920_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_NA11920.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_NA11920.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11920/NA11920_DNA_alignment.sort.bam 15:67467602-67468867 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_NA11920.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_NA11920.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00255/HG00255_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_HG00255.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_HG00255.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00255/HG00255_DNA_alignment.sort.bam 15:67467602-67468867  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_HG00255.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_HG00255.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12275/NA12275_mapsplice_alignment.sort.bam chr15:67467602-67468867 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_NA12275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2212_NA12275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12275/NA12275_DNA_alignment.sort.bam 15:67467602-67468867 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_NA12275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2212_NA12275.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2218.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:76619875-76620986 |  vcf-subset -c HG00364,HG00364,HG00364 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2218.vcf
echo -e chr6'	'76619875'	'76620986 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00364/HG00364_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00364/HG00364_DNA_alignment.sort.bam 6:76619875-76620986 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00364/HG00364_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00364/HG00364_DNA_alignment.sort.bam 6:76619875-76620986  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00364/HG00364_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2218_HG00364.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00364/HG00364_DNA_alignment.sort.bam 6:76619875-76620986 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2218_HG00364.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2218.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:76619875-76620986 |  vcf-subset -c HG00355,NA18908,HG00273 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2218.vcf
echo -e chr6'	'76619875'	'76620986 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00355/HG00355_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_HG00355.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_HG00355.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00355/HG00355_DNA_alignment.sort.bam 6:76619875-76620986 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_HG00355.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_HG00355.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18908/NA18908_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_NA18908.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_NA18908.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18908/NA18908_DNA_alignment.sort.bam 6:76619875-76620986  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_NA18908.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_NA18908.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00273/HG00273_mapsplice_alignment.sort.bam chr6:76619875-76620986 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_HG00273.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2218_HG00273.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00273/HG00273_DNA_alignment.sort.bam 6:76619875-76620986 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_HG00273.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2218_HG00273.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2299.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:44260279-44261313 |  vcf-subset -c HG02215,NA19138,HG00376 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2299.vcf
echo -e chr21'	'44260279'	'44261313 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG02215/HG02215_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_HG02215.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_HG02215.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG02215/HG02215_DNA_alignment.sort.bam 21:44260279-44261313 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_HG02215.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_HG02215.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 21:44260279-44261313  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_NA19138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2299_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 21:44260279-44261313 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2299_HG00376.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2299.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:44260279-44261313 |  vcf-subset -c HG01790,HG00365,NA12400 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2299.vcf
echo -e chr21'	'44260279'	'44261313 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01790/HG01790_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_HG01790.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_HG01790.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01790/HG01790_DNA_alignment.sort.bam 21:44260279-44261313 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_HG01790.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_HG01790.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00365/HG00365_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_HG00365.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_HG00365.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00365/HG00365_DNA_alignment.sort.bam 21:44260279-44261313  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_HG00365.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_HG00365.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12400/NA12400_mapsplice_alignment.sort.bam chr21:44260279-44261313 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_NA12400.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2299_NA12400.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12400/NA12400_DNA_alignment.sort.bam 21:44260279-44261313 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_NA12400.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2299_NA12400.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2301.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68416426-68421662 |  vcf-subset -c HG00376,HG00376,HG00376 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2301.vcf
echo -e chr9'	'68416426'	'68421662 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68416426-68421662 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68416426-68421662  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2301_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68416426-68421662 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2301_HG00376.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2301.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68416426-68421662 |  vcf-subset -c NA19144,HG00258,HG00380 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2301.vcf
echo -e chr9'	'68416426'	'68421662 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19144/NA19144_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_NA19144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_NA19144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19144/NA19144_DNA_alignment.sort.bam 9:68416426-68421662 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_NA19144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_NA19144.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00258/HG00258_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_HG00258.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_HG00258.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00258/HG00258_DNA_alignment.sort.bam 9:68416426-68421662  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_HG00258.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_HG00258.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00380/HG00380_mapsplice_alignment.sort.bam chr9:68416426-68421662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_HG00380.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2301_HG00380.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00380/HG00380_DNA_alignment.sort.bam 9:68416426-68421662 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_HG00380.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2301_HG00380.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2302.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417211-68420599 |  vcf-subset -c HG00376,HG00376,HG00376 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2302.vcf
echo -e chr9'	'68417211'	'68420599 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68417211-68420599 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68417211-68420599  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00376/HG00376_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2302_HG00376.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00376/HG00376_DNA_alignment.sort.bam 9:68417211-68420599 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2302_HG00376.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2302.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68417211-68420599 |  vcf-subset -c HG00128,NA19130,NA20544 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2302.vcf
echo -e chr9'	'68417211'	'68420599 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00128/HG00128_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_HG00128.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_HG00128.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00128/HG00128_DNA_alignment.sort.bam 9:68417211-68420599 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_HG00128.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_HG00128.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19130/NA19130_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_NA19130.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_NA19130.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19130/NA19130_DNA_alignment.sort.bam 9:68417211-68420599  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_NA19130.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_NA19130.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20544/NA20544_mapsplice_alignment.sort.bam chr9:68417211-68420599 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_NA20544.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2302_NA20544.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20544/NA20544_DNA_alignment.sort.bam 9:68417211-68420599 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_NA20544.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2302_NA20544.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2317.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:107368157-107369323 |  vcf-subset -c HG00378,HG00378,HG00378 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2317.vcf
echo -e chr12'	'107368157'	'107369323 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00378/HG00378_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00378/HG00378_DNA_alignment.sort.bam 12:107368157-107369323 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00378/HG00378_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00378/HG00378_DNA_alignment.sort.bam 12:107368157-107369323  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00378/HG00378_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2317_HG00378.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00378/HG00378_DNA_alignment.sort.bam 12:107368157-107369323 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2317_HG00378.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2317.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:107368157-107369323 |  vcf-subset -c HG00380,HG00356,NA18934 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2317.vcf
echo -e chr12'	'107368157'	'107369323 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00380/HG00380_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_HG00380.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_HG00380.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00380/HG00380_DNA_alignment.sort.bam 12:107368157-107369323 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_HG00380.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_HG00380.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00356/HG00356_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_HG00356.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_HG00356.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00356/HG00356_DNA_alignment.sort.bam 12:107368157-107369323  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_HG00356.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_HG00356.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr12:107368157-107369323 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2317_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 12:107368157-107369323 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2317_NA18934.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2347.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:151727618-151729576 |  vcf-subset -c NA18934,NA20531,NA18934 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2347.vcf
echo -e chr6'	'151727618'	'151729576 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 6:151727618-151729576 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20531/NA20531_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA20531.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA20531.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20531/NA20531_DNA_alignment.sort.bam 6:151727618-151729576  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA20531.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA20531.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2347_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 6:151727618-151729576 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2347_NA18934.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2347.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:151727618-151729576 |  vcf-subset -c NA20800,NA20786,NA11893 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2347.vcf
echo -e chr6'	'151727618'	'151729576 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20800/NA20800_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA20800.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA20800.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20800/NA20800_DNA_alignment.sort.bam 6:151727618-151729576 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA20800.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA20800.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20786/NA20786_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA20786.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA20786.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20786/NA20786_DNA_alignment.sort.bam 6:151727618-151729576  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA20786.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA20786.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11893/NA11893_mapsplice_alignment.sort.bam chr6:151727618-151729576 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA11893.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2347_NA11893.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11893/NA11893_DNA_alignment.sort.bam 6:151727618-151729576 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA11893.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2347_NA11893.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2370.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418125-68420270 |  vcf-subset -c HG01334,HG01334,HG01334 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2370.vcf
echo -e chr9'	'68418125'	'68420270 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01334/HG01334_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01334/HG01334_DNA_alignment.sort.bam 9:68418125-68420270 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01334/HG01334_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01334/HG01334_DNA_alignment.sort.bam 9:68418125-68420270  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01334/HG01334_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2370_HG01334.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01334/HG01334_DNA_alignment.sort.bam 9:68418125-68420270 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2370_HG01334.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2370.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418125-68420270 |  vcf-subset -c NA20790,HG00329,NA06985 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2370.vcf
echo -e chr9'	'68418125'	'68420270 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20790/NA20790_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_NA20790.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_NA20790.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20790/NA20790_DNA_alignment.sort.bam 9:68418125-68420270 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_NA20790.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_NA20790.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 9:68418125-68420270  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06985/NA06985_mapsplice_alignment.sort.bam chr9:68418125-68420270 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_NA06985.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2370_NA06985.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06985/NA06985_DNA_alignment.sort.bam 9:68418125-68420270 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_NA06985.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2370_NA06985.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2384.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418572-68419914 |  vcf-subset -c HG01789,HG01789,HG01789 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2384.vcf
echo -e chr9'	'68418572'	'68419914 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 9:68418572-68419914 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 9:68418572-68419914  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2384_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 9:68418572-68419914 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2384_HG01789.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2384.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418572-68419914 |  vcf-subset -c NA20765,HG00253,NA11881 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2384.vcf
echo -e chr9'	'68418572'	'68419914 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20765/NA20765_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_NA20765.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_NA20765.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20765/NA20765_DNA_alignment.sort.bam 9:68418572-68419914 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_NA20765.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_NA20765.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00253/HG00253_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_HG00253.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_HG00253.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00253/HG00253_DNA_alignment.sort.bam 9:68418572-68419914  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_HG00253.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_HG00253.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr9:68418572-68419914 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2384_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 9:68418572-68419914 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2384_NA11881.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2388.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38753679-38757364 |  vcf-subset -c HG01789,HG01789,HG01789 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2388.vcf
echo -e chr4'	'38753679'	'38757364 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 4:38753679-38757364 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 4:38753679-38757364  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01789/HG01789_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2388_HG01789.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01789/HG01789_DNA_alignment.sort.bam 4:38753679-38757364 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2388_HG01789.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2388.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38753679-38757364 |  vcf-subset -c NA07051,NA12383,NA12843 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2388.vcf
echo -e chr4'	'38753679'	'38757364 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07051/NA07051_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA07051.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA07051.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07051/NA07051_DNA_alignment.sort.bam 4:38753679-38757364 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA07051.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA07051.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12383/NA12383_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA12383.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA12383.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12383/NA12383_DNA_alignment.sort.bam 4:38753679-38757364  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA12383.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA12383.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12843/NA12843_mapsplice_alignment.sort.bam chr4:38753679-38757364 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA12843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2388_NA12843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12843/NA12843_DNA_alignment.sort.bam 4:38753679-38757364 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA12843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2388_NA12843.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2517.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:60142383-60144022 |  vcf-subset -c NA10847,NA10847,NA10847 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2517.vcf
echo -e chr17'	'60142383'	'60144022 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10847/NA10847_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10847/NA10847_DNA_alignment.sort.bam 17:60142383-60144022 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10847/NA10847_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10847/NA10847_DNA_alignment.sort.bam 17:60142383-60144022  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10847/NA10847_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2517_NA10847.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10847/NA10847_DNA_alignment.sort.bam 17:60142383-60144022 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2517_NA10847.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2517.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:60142383-60144022 |  vcf-subset -c HG00282,HG00119,NA12778 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2517.vcf
echo -e chr17'	'60142383'	'60144022 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00282/HG00282_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_HG00282.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_HG00282.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00282/HG00282_DNA_alignment.sort.bam 17:60142383-60144022 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_HG00282.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_HG00282.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00119/HG00119_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_HG00119.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_HG00119.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00119/HG00119_DNA_alignment.sort.bam 17:60142383-60144022  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_HG00119.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_HG00119.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12778/NA12778_mapsplice_alignment.sort.bam chr17:60142383-60144022 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_NA12778.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2517_NA12778.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12778/NA12778_DNA_alignment.sort.bam 17:60142383-60144022 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_NA12778.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2517_NA12778.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2546.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:77918967-77919913 |  vcf-subset -c NA11840,NA11840,NA11840 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2546.vcf
echo -e chr18'	'77918967'	'77919913 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11840/NA11840_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11840/NA11840_DNA_alignment.sort.bam 18:77918967-77919913 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11840/NA11840_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11840/NA11840_DNA_alignment.sort.bam 18:77918967-77919913  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11840/NA11840_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2546_NA11840.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11840/NA11840_DNA_alignment.sort.bam 18:77918967-77919913 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2546_NA11840.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2546.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:77918967-77919913 |  vcf-subset -c HG00123,HG00108,NA12275 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2546.vcf
echo -e chr18'	'77918967'	'77919913 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00123/HG00123_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_HG00123.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_HG00123.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00123/HG00123_DNA_alignment.sort.bam 18:77918967-77919913 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_HG00123.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_HG00123.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00108/HG00108_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_HG00108.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_HG00108.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00108/HG00108_DNA_alignment.sort.bam 18:77918967-77919913  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_HG00108.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_HG00108.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12275/NA12275_mapsplice_alignment.sort.bam chr18:77918967-77919913 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_NA12275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2546_NA12275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12275/NA12275_DNA_alignment.sort.bam 18:77918967-77919913 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_NA12275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2546_NA12275.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2565.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:33965651-33966498 |  vcf-subset -c NA11881,NA11881,NA11881 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2565.vcf
echo -e chr1'	'33965651'	'33966498 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 1:33965651-33966498 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 1:33965651-33966498  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2565_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 1:33965651-33966498 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2565_NA11881.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2565.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:33965651-33966498 |  vcf-subset -c HG00253,HG00339,HG00101 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2565.vcf
echo -e chr1'	'33965651'	'33966498 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00253/HG00253_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00253.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00253.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00253/HG00253_DNA_alignment.sort.bam 1:33965651-33966498 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00253.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00253.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00339/HG00339_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00339.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00339.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00339/HG00339_DNA_alignment.sort.bam 1:33965651-33966498  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00339.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00339.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00101/HG00101_mapsplice_alignment.sort.bam chr1:33965651-33966498 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00101.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2565_HG00101.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00101/HG00101_DNA_alignment.sort.bam 1:33965651-33966498 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00101.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2565_HG00101.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2586.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:48289551-48291256 |  vcf-subset -c NA11893,NA11893,NA11893 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2586.vcf
echo -e chr3'	'48289551'	'48291256 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11893/NA11893_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11893/NA11893_DNA_alignment.sort.bam 3:48289551-48291256 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11893/NA11893_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11893/NA11893_DNA_alignment.sort.bam 3:48289551-48291256  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11893/NA11893_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2586_NA11893.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11893/NA11893_DNA_alignment.sort.bam 3:48289551-48291256 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2586_NA11893.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2586.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:48289551-48291256 |  vcf-subset -c NA12154,NA18933,NA20828 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2586.vcf
echo -e chr3'	'48289551'	'48291256 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12154/NA12154_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA12154.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA12154.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12154/NA12154_DNA_alignment.sort.bam 3:48289551-48291256 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA12154.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA12154.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18933/NA18933_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA18933.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA18933.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18933/NA18933_DNA_alignment.sort.bam 3:48289551-48291256  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA18933.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA18933.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20828/NA20828_mapsplice_alignment.sort.bam chr3:48289551-48291256 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA20828.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2586_NA20828.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20828/NA20828_DNA_alignment.sort.bam 3:48289551-48291256 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA20828.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2586_NA20828.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2615.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1461333-1469275 |  vcf-subset -c NA11993,NA11993,NA11993 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2615.vcf
echo -e chr5'	'1461333'	'1469275 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11993/NA11993_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11993/NA11993_DNA_alignment.sort.bam 5:1461333-1469275 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11993/NA11993_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11993/NA11993_DNA_alignment.sort.bam 5:1461333-1469275  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11993/NA11993_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2615_NA11993.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11993/NA11993_DNA_alignment.sort.bam 5:1461333-1469275 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2615_NA11993.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2615.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1461333-1469275 |  vcf-subset -c HG00342,NA19189,NA19198 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2615.vcf
echo -e chr5'	'1461333'	'1469275 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00342/HG00342_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_HG00342.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_HG00342.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00342/HG00342_DNA_alignment.sort.bam 5:1461333-1469275 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_HG00342.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_HG00342.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19189/NA19189_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_NA19189.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_NA19189.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19189/NA19189_DNA_alignment.sort.bam 5:1461333-1469275  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_NA19189.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_NA19189.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19198/NA19198_mapsplice_alignment.sort.bam chr5:1461333-1469275 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_NA19198.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2615_NA19198.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19198/NA19198_DNA_alignment.sort.bam 5:1461333-1469275 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_NA19198.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2615_NA19198.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2638.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:16133086-16134571 |  vcf-subset -c NA12156,NA12156,NA12043 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2638.vcf
echo -e chr21'	'16133086'	'16134571 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12156/NA12156_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12156/NA12156_DNA_alignment.sort.bam 21:16133086-16134571 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12156.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12156/NA12156_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12156/NA12156_DNA_alignment.sort.bam 21:16133086-16134571  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12156.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12043/NA12043_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12043.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2638_NA12043.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12043/NA12043_DNA_alignment.sort.bam 21:16133086-16134571 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12043.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2638_NA12043.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2638.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:16133086-16134571 |  vcf-subset -c HG00189,NA12044,HG00122 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2638.vcf
echo -e chr21'	'16133086'	'16134571 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00189/HG00189_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_HG00189.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_HG00189.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00189/HG00189_DNA_alignment.sort.bam 21:16133086-16134571 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_HG00189.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_HG00189.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12044/NA12044_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_NA12044.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_NA12044.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12044/NA12044_DNA_alignment.sort.bam 21:16133086-16134571  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_NA12044.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_NA12044.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00122/HG00122_mapsplice_alignment.sort.bam chr21:16133086-16134571 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_HG00122.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2638_HG00122.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00122/HG00122_DNA_alignment.sort.bam 21:16133086-16134571 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_HG00122.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2638_HG00122.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2695.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:178993062-178993997 |  vcf-subset -c NA12283,NA12283,NA12154 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2695.vcf
echo -e chr2'	'178993062'	'178993997 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12283/NA12283_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12283.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12283.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12283/NA12283_DNA_alignment.sort.bam 2:178993062-178993997 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12283.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12283.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12283/NA12283_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12283.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12283.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12283/NA12283_DNA_alignment.sort.bam 2:178993062-178993997  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12283.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12283.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12154/NA12154_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12154.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2695_NA12154.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12154/NA12154_DNA_alignment.sort.bam 2:178993062-178993997 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12154.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2695_NA12154.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2695.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:178993062-178993997 |  vcf-subset -c HG00369,HG00128,NA11994 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2695.vcf
echo -e chr2'	'178993062'	'178993997 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00369/HG00369_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_HG00369.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_HG00369.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00369/HG00369_DNA_alignment.sort.bam 2:178993062-178993997 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_HG00369.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_HG00369.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00128/HG00128_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_HG00128.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_HG00128.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00128/HG00128_DNA_alignment.sort.bam 2:178993062-178993997  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_HG00128.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_HG00128.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11994/NA11994_mapsplice_alignment.sort.bam chr2:178993062-178993997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_NA11994.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2695_NA11994.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11994/NA11994_DNA_alignment.sort.bam 2:178993062-178993997 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_NA11994.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2695_NA11994.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2698.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:112006203-112007468 |  vcf-subset -c NA12155,NA12155,NA12155 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2698.vcf
echo -e chr1'	'112006203'	'112007468 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12155/NA12155_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12155/NA12155_DNA_alignment.sort.bam 1:112006203-112007468 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12155/NA12155_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12155/NA12155_DNA_alignment.sort.bam 1:112006203-112007468  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12155/NA12155_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2698_NA12155.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12155/NA12155_DNA_alignment.sort.bam 1:112006203-112007468 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2698_NA12155.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2698.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:112006203-112007468 |  vcf-subset -c HG00379,NA19223,NA20510 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2698.vcf
echo -e chr1'	'112006203'	'112007468 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00379/HG00379_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_HG00379.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_HG00379.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00379/HG00379_DNA_alignment.sort.bam 1:112006203-112007468 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_HG00379.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_HG00379.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19223/NA19223_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_NA19223.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_NA19223.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19223/NA19223_DNA_alignment.sort.bam 1:112006203-112007468  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_NA19223.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_NA19223.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20510/NA20510_mapsplice_alignment.sort.bam chr1:112006203-112007468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_NA20510.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2698_NA20510.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20510/NA20510_DNA_alignment.sort.bam 1:112006203-112007468 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_NA20510.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2698_NA20510.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2709.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:68725586-68727885 |  vcf-subset -c NA12234,NA12234,NA12234 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2709.vcf
echo -e chr12'	'68725586'	'68727885 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12234/NA12234_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12234/NA12234_DNA_alignment.sort.bam 12:68725586-68727885 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12234/NA12234_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12234/NA12234_DNA_alignment.sort.bam 12:68725586-68727885  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12234/NA12234_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2709_NA12234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12234/NA12234_DNA_alignment.sort.bam 12:68725586-68727885 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2709_NA12234.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2709.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:68725586-68727885 |  vcf-subset -c NA19223,NA20810,NA11843 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2709.vcf
echo -e chr12'	'68725586'	'68727885 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19223/NA19223_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA19223.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA19223.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19223/NA19223_DNA_alignment.sort.bam 12:68725586-68727885 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA19223.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA19223.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20810/NA20810_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA20810.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA20810.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20810/NA20810_DNA_alignment.sort.bam 12:68725586-68727885  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA20810.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA20810.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11843/NA11843_mapsplice_alignment.sort.bam chr12:68725586-68727885 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA11843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2709_NA11843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11843/NA11843_DNA_alignment.sort.bam 12:68725586-68727885 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA11843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2709_NA11843.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2732.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418116-68419513 |  vcf-subset -c NA12275,NA12275,NA12275 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2732.vcf
echo -e chr9'	'68418116'	'68419513 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12275/NA12275_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12275/NA12275_DNA_alignment.sort.bam 9:68418116-68419513 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12275/NA12275_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12275/NA12275_DNA_alignment.sort.bam 9:68418116-68419513  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12275/NA12275_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2732_NA12275.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12275/NA12275_DNA_alignment.sort.bam 9:68418116-68419513 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2732_NA12275.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2732.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418116-68419513 |  vcf-subset -c NA20787,NA07056,NA12156 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2732.vcf
echo -e chr9'	'68418116'	'68419513 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20787/NA20787_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA20787.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA20787.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20787/NA20787_DNA_alignment.sort.bam 9:68418116-68419513 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA20787.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA20787.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07056/NA07056_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA07056.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA07056.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07056/NA07056_DNA_alignment.sort.bam 9:68418116-68419513  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA07056.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA07056.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12156/NA12156_mapsplice_alignment.sort.bam chr9:68418116-68419513 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA12156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2732_NA12156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12156/NA12156_DNA_alignment.sort.bam 9:68418116-68419513 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA12156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2732_NA12156.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2811.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:58981402-58982282 |  vcf-subset -c NA12400,NA12400,NA12400 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2811.vcf
echo -e chr14'	'58981402'	'58982282 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12400/NA12400_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12400/NA12400_DNA_alignment.sort.bam 14:58981402-58982282 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12400/NA12400_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12400/NA12400_DNA_alignment.sort.bam 14:58981402-58982282  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12400/NA12400_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2811_NA12400.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12400/NA12400_DNA_alignment.sort.bam 14:58981402-58982282 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2811_NA12400.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2811.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:58981402-58982282 |  vcf-subset -c NA11930,NA20783,NA18519 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2811.vcf
echo -e chr14'	'58981402'	'58982282 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11930/NA11930_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA11930.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA11930.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11930/NA11930_DNA_alignment.sort.bam 14:58981402-58982282 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA11930.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA11930.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20783/NA20783_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA20783.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA20783.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20783/NA20783_DNA_alignment.sort.bam 14:58981402-58982282  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA20783.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA20783.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18519/NA18519_mapsplice_alignment.sort.bam chr14:58981402-58982282 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA18519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2811_NA18519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18519/NA18519_DNA_alignment.sort.bam 14:58981402-58982282 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA18519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2811_NA18519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2815.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 19:42777054-42778462 |  vcf-subset -c NA12413,NA12413,NA12413 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2815.vcf
echo -e chr19'	'42777054'	'42778462 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12413/NA12413_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12413/NA12413_DNA_alignment.sort.bam 19:42777054-42778462 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12413/NA12413_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12413/NA12413_DNA_alignment.sort.bam 19:42777054-42778462  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12413/NA12413_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2815_NA12413.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12413/NA12413_DNA_alignment.sort.bam 19:42777054-42778462 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2815_NA12413.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2815.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 19:42777054-42778462 |  vcf-subset -c NA18520,HG00349,NA19247 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2815.vcf
echo -e chr19'	'42777054'	'42778462 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18520/NA18520_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_NA18520.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_NA18520.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18520/NA18520_DNA_alignment.sort.bam 19:42777054-42778462 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_NA18520.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_NA18520.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00349/HG00349_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_HG00349.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_HG00349.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00349/HG00349_DNA_alignment.sort.bam 19:42777054-42778462  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_HG00349.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_HG00349.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19247/NA19247_mapsplice_alignment.sort.bam chr19:42777054-42778462 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_NA19247.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2815_NA19247.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19247/NA19247_DNA_alignment.sort.bam 19:42777054-42778462 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_NA19247.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2815_NA19247.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2891.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418082-68420326 |  vcf-subset -c NA12762,NA12762,NA12762 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2891.vcf
echo -e chr9'	'68418082'	'68420326 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12762/NA12762_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12762/NA12762_DNA_alignment.sort.bam 9:68418082-68420326 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12762/NA12762_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12762/NA12762_DNA_alignment.sort.bam 9:68418082-68420326  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12762/NA12762_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2891_NA12762.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12762/NA12762_DNA_alignment.sort.bam 9:68418082-68420326 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2891_NA12762.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2891.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418082-68420326 |  vcf-subset -c HG00282,NA20520,NA12827 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2891.vcf
echo -e chr9'	'68418082'	'68420326 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00282/HG00282_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_HG00282.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_HG00282.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00282/HG00282_DNA_alignment.sort.bam 9:68418082-68420326 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_HG00282.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_HG00282.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20520/NA20520_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_NA20520.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_NA20520.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20520/NA20520_DNA_alignment.sort.bam 9:68418082-68420326  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_NA20520.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_NA20520.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12827/NA12827_mapsplice_alignment.sort.bam chr9:68418082-68420326 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_NA12827.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2891_NA12827.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12827/NA12827_DNA_alignment.sort.bam 9:68418082-68420326 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_NA12827.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2891_NA12827.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2913.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:7244275-7245419 |  vcf-subset -c NA12775,NA12775,NA12775 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2913.vcf
echo -e chr6'	'7244275'	'7245419 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12775/NA12775_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12775/NA12775_DNA_alignment.sort.bam 6:7244275-7245419 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12775/NA12775_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12775/NA12775_DNA_alignment.sort.bam 6:7244275-7245419  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12775/NA12775_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2913_NA12775.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12775/NA12775_DNA_alignment.sort.bam 6:7244275-7245419 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2913_NA12775.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2913.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:7244275-7245419 |  vcf-subset -c HG00121,NA20589,HG00252 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2913.vcf
echo -e chr6'	'7244275'	'7245419 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00121/HG00121_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_HG00121.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_HG00121.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00121/HG00121_DNA_alignment.sort.bam 6:7244275-7245419 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_HG00121.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_HG00121.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20589/NA20589_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_NA20589.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_NA20589.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20589/NA20589_DNA_alignment.sort.bam 6:7244275-7245419  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_NA20589.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_NA20589.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00252/HG00252_mapsplice_alignment.sort.bam chr6:7244275-7245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_HG00252.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2913_HG00252.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00252/HG00252_DNA_alignment.sort.bam 6:7244275-7245419 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_HG00252.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2913_HG00252.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2944.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60934384-60935891 |  vcf-subset -c NA12812,NA12812,NA12812 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2944.vcf
echo -e chr18'	'60934384'	'60935891 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12812/NA12812_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12812/NA12812_DNA_alignment.sort.bam 18:60934384-60935891 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12812/NA12812_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12812/NA12812_DNA_alignment.sort.bam 18:60934384-60935891  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12812/NA12812_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2944_NA12812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12812/NA12812_DNA_alignment.sort.bam 18:60934384-60935891 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2944_NA12812.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2944.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60934384-60935891 |  vcf-subset -c HG00136,NA18520,HG00146 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2944.vcf
echo -e chr18'	'60934384'	'60935891 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00136/HG00136_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_HG00136.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_HG00136.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00136/HG00136_DNA_alignment.sort.bam 18:60934384-60935891 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_HG00136.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_HG00136.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18520/NA18520_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_NA18520.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_NA18520.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18520/NA18520_DNA_alignment.sort.bam 18:60934384-60935891  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_NA18520.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_NA18520.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00146/HG00146_mapsplice_alignment.sort.bam chr18:60934384-60935891 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_HG00146.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2944_HG00146.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00146/HG00146_DNA_alignment.sort.bam 18:60934384-60935891 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_HG00146.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2944_HG00146.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2960.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:112006431-112007278 |  vcf-subset -c NA12814,NA12814,NA12814 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2960.vcf
echo -e chr1'	'112006431'	'112007278 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12814/NA12814_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12814/NA12814_DNA_alignment.sort.bam 1:112006431-112007278 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12814/NA12814_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12814/NA12814_DNA_alignment.sort.bam 1:112006431-112007278  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12814/NA12814_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2960_NA12814.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12814/NA12814_DNA_alignment.sort.bam 1:112006431-112007278 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2960_NA12814.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2960.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:112006431-112007278 |  vcf-subset -c NA20774,NA07347,HG00361 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2960.vcf
echo -e chr1'	'112006431'	'112007278 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20774/NA20774_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_NA20774.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_NA20774.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20774/NA20774_DNA_alignment.sort.bam 1:112006431-112007278 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_NA20774.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_NA20774.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07347/NA07347_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_NA07347.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_NA07347.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07347/NA07347_DNA_alignment.sort.bam 1:112006431-112007278  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_NA07347.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_NA07347.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00361/HG00361_mapsplice_alignment.sort.bam chr1:112006431-112007278 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_HG00361.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2960_HG00361.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00361/HG00361_DNA_alignment.sort.bam 1:112006431-112007278 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_HG00361.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2960_HG00361.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2970.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:88241580-88245419 |  vcf-subset -c NA12815,NA12815,NA12815 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_2970.vcf
echo -e chr5'	'88241580'	'88245419 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12815/NA12815_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12815/NA12815_DNA_alignment.sort.bam 5:88241580-88245419 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12815/NA12815_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12815/NA12815_DNA_alignment.sort.bam 5:88241580-88245419  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12815/NA12815_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_2970_NA12815.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12815/NA12815_DNA_alignment.sort.bam 5:88241580-88245419 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_2970_NA12815.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2970.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:88241580-88245419 |  vcf-subset -c NA12812,HG00121,NA20772 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_2970.vcf
echo -e chr5'	'88241580'	'88245419 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12812/NA12812_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_NA12812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_NA12812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12812/NA12812_DNA_alignment.sort.bam 5:88241580-88245419 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_NA12812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_NA12812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00121/HG00121_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_HG00121.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_HG00121.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00121/HG00121_DNA_alignment.sort.bam 5:88241580-88245419  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_HG00121.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_HG00121.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20772/NA20772_mapsplice_alignment.sort.bam chr5:88241580-88245419 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_NA20772.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_2970_NA20772.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20772/NA20772_DNA_alignment.sort.bam 5:88241580-88245419 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_NA20772.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_2970_NA20772.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3002.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:45127780-45129672 |  vcf-subset -c NA12842,NA12842,NA12842 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3002.vcf
echo -e chr22'	'45127780'	'45129672 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 22:45127780-45129672 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 22:45127780-45129672  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3002_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 22:45127780-45129672 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3002_NA12842.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3002.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:45127780-45129672 |  vcf-subset -c HG00154,NA20518,NA12843 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3002.vcf
echo -e chr22'	'45127780'	'45129672 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00154/HG00154_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_HG00154.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_HG00154.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00154/HG00154_DNA_alignment.sort.bam 22:45127780-45129672 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_HG00154.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_HG00154.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20518/NA20518_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_NA20518.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_NA20518.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20518/NA20518_DNA_alignment.sort.bam 22:45127780-45129672  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_NA20518.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_NA20518.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12843/NA12843_mapsplice_alignment.sort.bam chr22:45127780-45129672 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_NA12843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3002_NA12843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12843/NA12843_DNA_alignment.sort.bam 22:45127780-45129672 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_NA12843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3002_NA12843.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3003.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:22846181-22847061 |  vcf-subset -c NA12842,NA12842,NA12842 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3003.vcf
echo -e chr14'	'22846181'	'22847061 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 14:22846181-22847061 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 14:22846181-22847061  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12842/NA12842_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3003_NA12842.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12842/NA12842_DNA_alignment.sort.bam 14:22846181-22847061 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3003_NA12842.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3003.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:22846181-22847061 |  vcf-subset -c HG00176,NA20516,HG00188 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3003.vcf
echo -e chr14'	'22846181'	'22847061 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00176/HG00176_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_HG00176.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_HG00176.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00176/HG00176_DNA_alignment.sort.bam 14:22846181-22847061 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_HG00176.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_HG00176.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20516/NA20516_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_NA20516.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_NA20516.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20516/NA20516_DNA_alignment.sort.bam 14:22846181-22847061  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_NA20516.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_NA20516.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00188/HG00188_mapsplice_alignment.sort.bam chr14:22846181-22847061 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_HG00188.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3003_HG00188.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00188/HG00188_DNA_alignment.sort.bam 14:22846181-22847061 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_HG00188.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3003_HG00188.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3010.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:213915181-213918921 |  vcf-subset -c NA12872,NA12872,NA12872 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3010.vcf
echo -e chr2'	'213915181'	'213918921 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12872/NA12872_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12872/NA12872_DNA_alignment.sort.bam 2:213915181-213918921 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12872/NA12872_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12872/NA12872_DNA_alignment.sort.bam 2:213915181-213918921  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12872/NA12872_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3010_NA12872.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12872/NA12872_DNA_alignment.sort.bam 2:213915181-213918921 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3010_NA12872.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3010.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:213915181-213918921 |  vcf-subset -c HG00369,HG00331,HG00139 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3010.vcf
echo -e chr2'	'213915181'	'213918921 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00369/HG00369_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00369.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00369.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00369/HG00369_DNA_alignment.sort.bam 2:213915181-213918921 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00369.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00369.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00331/HG00331_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00331.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00331.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00331/HG00331_DNA_alignment.sort.bam 2:213915181-213918921  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00331.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00331.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00139/HG00139_mapsplice_alignment.sort.bam chr2:213915181-213918921 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00139.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3010_HG00139.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00139/HG00139_DNA_alignment.sort.bam 2:213915181-213918921 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00139.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3010_HG00139.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3021.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 8:131369406-131373652 |  vcf-subset -c NA12873,NA12873,NA12873 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3021.vcf
echo -e chr8'	'131369406'	'131373652 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12873/NA12873_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12873/NA12873_DNA_alignment.sort.bam 8:131369406-131373652 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12873/NA12873_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12873/NA12873_DNA_alignment.sort.bam 8:131369406-131373652  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12873/NA12873_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3021_NA12873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12873/NA12873_DNA_alignment.sort.bam 8:131369406-131373652 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3021_NA12873.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3021.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 8:131369406-131373652 |  vcf-subset -c NA12776,NA18908,NA19197 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3021.vcf
echo -e chr8'	'131369406'	'131373652 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12776/NA12776_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA12776.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA12776.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12776/NA12776_DNA_alignment.sort.bam 8:131369406-131373652 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA12776.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA12776.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18908/NA18908_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA18908.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA18908.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18908/NA18908_DNA_alignment.sort.bam 8:131369406-131373652  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA18908.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA18908.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19197/NA19197_mapsplice_alignment.sort.bam chr8:131369406-131373652 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA19197.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3021_NA19197.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19197/NA19197_DNA_alignment.sort.bam 8:131369406-131373652 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA19197.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3021_NA19197.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3026.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:226236285-226237198 |  vcf-subset -c NA12889,NA12889,NA12889 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3026.vcf
echo -e chr1'	'226236285'	'226237198 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12889/NA12889_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12889/NA12889_DNA_alignment.sort.bam 1:226236285-226237198 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12889/NA12889_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12889/NA12889_DNA_alignment.sort.bam 1:226236285-226237198  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12889/NA12889_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3026_NA12889.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12889/NA12889_DNA_alignment.sort.bam 1:226236285-226237198 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3026_NA12889.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3026.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:226236285-226237198 |  vcf-subset -c HG00142,NA20524,HG00272 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3026.vcf
echo -e chr1'	'226236285'	'226237198 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00142/HG00142_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_HG00142.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_HG00142.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00142/HG00142_DNA_alignment.sort.bam 1:226236285-226237198 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_HG00142.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_HG00142.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20524/NA20524_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_NA20524.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_NA20524.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20524/NA20524_DNA_alignment.sort.bam 1:226236285-226237198  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_NA20524.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_NA20524.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00272/HG00272_mapsplice_alignment.sort.bam chr1:226236285-226237198 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_HG00272.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3026_HG00272.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00272/HG00272_DNA_alignment.sort.bam 1:226236285-226237198 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_HG00272.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3026_HG00272.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3035.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:47550167-47551047 |  vcf-subset -c NA18486,NA18486,NA18486 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3035.vcf
echo -e chr4'	'47550167'	'47551047 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 4:47550167-47551047 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 4:47550167-47551047  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3035_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 4:47550167-47551047 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3035_NA18486.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3035.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:47550167-47551047 |  vcf-subset -c NA12004,NA11992,NA20804 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3035.vcf
echo -e chr4'	'47550167'	'47551047 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12004/NA12004_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA12004.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA12004.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12004/NA12004_DNA_alignment.sort.bam 4:47550167-47551047 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA12004.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA12004.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11992/NA11992_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA11992.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA11992.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11992/NA11992_DNA_alignment.sort.bam 4:47550167-47551047  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA11992.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA11992.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20804/NA20804_mapsplice_alignment.sort.bam chr4:47550167-47551047 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA20804.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3035_NA20804.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20804/NA20804_DNA_alignment.sort.bam 4:47550167-47551047 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA20804.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3035_NA20804.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3041.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947194-46952584 |  vcf-subset -c NA18486,NA18486,NA18486 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3041.vcf
echo -e chr21'	'46947194'	'46952584 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 21:46947194-46952584 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 21:46947194-46952584  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3041_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 21:46947194-46952584 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3041_NA18486.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3041.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:46947194-46952584 |  vcf-subset -c HG00278,HG00232,NA12144 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3041.vcf
echo -e chr21'	'46947194'	'46952584 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00278/HG00278_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_HG00278.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_HG00278.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00278/HG00278_DNA_alignment.sort.bam 21:46947194-46952584 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_HG00278.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_HG00278.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 21:46947194-46952584  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12144/NA12144_mapsplice_alignment.sort.bam chr21:46947194-46952584 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_NA12144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3041_NA12144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12144/NA12144_DNA_alignment.sort.bam 21:46947194-46952584 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_NA12144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3041_NA12144.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3044.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:11374581-11375692 |  vcf-subset -c NA18486,NA18486,NA18486 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3044.vcf
echo -e chr6'	'11374581'	'11375692 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 6:11374581-11375692 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 6:11374581-11375692  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18486/NA18486_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3044_NA18486.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18486/NA18486_DNA_alignment.sort.bam 6:11374581-11375692 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3044_NA18486.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3044.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:11374581-11375692 |  vcf-subset -c HG00233,NA19248,NA12762 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3044.vcf
echo -e chr6'	'11374581'	'11375692 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00233/HG00233_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_HG00233.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_HG00233.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00233/HG00233_DNA_alignment.sort.bam 6:11374581-11375692 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_HG00233.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_HG00233.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19248/NA19248_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_NA19248.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_NA19248.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19248/NA19248_DNA_alignment.sort.bam 6:11374581-11375692  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_NA19248.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_NA19248.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12762/NA12762_mapsplice_alignment.sort.bam chr6:11374581-11375692 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_NA12762.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3044_NA12762.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12762/NA12762_DNA_alignment.sort.bam 6:11374581-11375692 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_NA12762.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3044_NA12762.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3062.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:5638441-5641664 |  vcf-subset -c NA18487,NA18487,NA18487 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3062.vcf
echo -e chr11'	'5638441'	'5641664 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18487/NA18487_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18487/NA18487_DNA_alignment.sort.bam 11:5638441-5641664 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18487/NA18487_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18487/NA18487_DNA_alignment.sort.bam 11:5638441-5641664  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18487/NA18487_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3062_NA18487.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18487/NA18487_DNA_alignment.sort.bam 11:5638441-5641664 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3062_NA18487.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3062.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:5638441-5641664 |  vcf-subset -c NA19143,NA18502,NA06986 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3062.vcf
echo -e chr11'	'5638441'	'5641664 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19143/NA19143_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA19143.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA19143.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19143/NA19143_DNA_alignment.sort.bam 11:5638441-5641664 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA19143.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA19143.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18502/NA18502_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA18502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA18502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18502/NA18502_DNA_alignment.sort.bam 11:5638441-5641664  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA18502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA18502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06986/NA06986_mapsplice_alignment.sort.bam chr11:5638441-5641664 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA06986.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3062_NA06986.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06986/NA06986_DNA_alignment.sort.bam 11:5638441-5641664 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA06986.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3062_NA06986.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3086.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:236397018-236397997 |  vcf-subset -c NA18499,NA18499,NA18499 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3086.vcf
echo -e chr1'	'236397018'	'236397997 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18499/NA18499_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18499/NA18499_DNA_alignment.sort.bam 1:236397018-236397997 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18499/NA18499_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18499/NA18499_DNA_alignment.sort.bam 1:236397018-236397997  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18499/NA18499_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3086_NA18499.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18499/NA18499_DNA_alignment.sort.bam 1:236397018-236397997 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3086_NA18499.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3086.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:236397018-236397997 |  vcf-subset -c NA11832,NA18502,NA06986 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3086.vcf
echo -e chr1'	'236397018'	'236397997 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11832/NA11832_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA11832.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA11832.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11832/NA11832_DNA_alignment.sort.bam 1:236397018-236397997 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA11832.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA11832.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18502/NA18502_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA18502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA18502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18502/NA18502_DNA_alignment.sort.bam 1:236397018-236397997  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA18502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA18502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06986/NA06986_mapsplice_alignment.sort.bam chr1:236397018-236397997 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA06986.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3086_NA06986.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06986/NA06986_DNA_alignment.sort.bam 1:236397018-236397997 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA06986.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3086_NA06986.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3096.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:26319339-26320769 |  vcf-subset -c NA18502,NA18502,HG00326 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3096.vcf
echo -e chr4'	'26319339'	'26320769 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18502/NA18502_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_NA18502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_NA18502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18502/NA18502_DNA_alignment.sort.bam 4:26319339-26320769 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_NA18502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_NA18502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18502/NA18502_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_NA18502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_NA18502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18502/NA18502_DNA_alignment.sort.bam 4:26319339-26320769  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_NA18502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_NA18502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00326/HG00326_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_HG00326.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3096_HG00326.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00326/HG00326_DNA_alignment.sort.bam 4:26319339-26320769 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_HG00326.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3096_HG00326.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3096.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:26319339-26320769 |  vcf-subset -c NA19160,NA12813,NA20521 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3096.vcf
echo -e chr4'	'26319339'	'26320769 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19160/NA19160_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA19160.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA19160.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19160/NA19160_DNA_alignment.sort.bam 4:26319339-26320769 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA19160.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA19160.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12813/NA12813_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA12813.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA12813.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12813/NA12813_DNA_alignment.sort.bam 4:26319339-26320769  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA12813.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA12813.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20521/NA20521_mapsplice_alignment.sort.bam chr4:26319339-26320769 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA20521.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3096_NA20521.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20521/NA20521_DNA_alignment.sort.bam 4:26319339-26320769 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA20521.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3096_NA20521.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3114.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:65934289-65935411 |  vcf-subset -c NA18511,NA18511,NA18511 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3114.vcf
echo -e chr17'	'65934289'	'65935411 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 17:65934289-65935411 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 17:65934289-65935411  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3114_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 17:65934289-65935411 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3114_NA18511.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3114.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:65934289-65935411 |  vcf-subset -c NA18498,HG00108,HG00366 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3114.vcf
echo -e chr17'	'65934289'	'65935411 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18498/NA18498_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_NA18498.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_NA18498.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18498/NA18498_DNA_alignment.sort.bam 17:65934289-65935411 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_NA18498.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_NA18498.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00108/HG00108_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_HG00108.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_HG00108.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00108/HG00108_DNA_alignment.sort.bam 17:65934289-65935411  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_HG00108.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_HG00108.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00366/HG00366_mapsplice_alignment.sort.bam chr17:65934289-65935411 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_HG00366.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3114_HG00366.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00366/HG00366_DNA_alignment.sort.bam 17:65934289-65935411 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_HG00366.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3114_HG00366.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3125.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:7029165-7030166 |  vcf-subset -c NA18511,NA18511,NA18511 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3125.vcf
echo -e chr4'	'7029165'	'7030166 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 4:7029165-7030166 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 4:7029165-7030166  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3125_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 4:7029165-7030166 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3125_NA18511.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3125.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:7029165-7030166 |  vcf-subset -c NA20525,NA20542,HG00382 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3125.vcf
echo -e chr4'	'7029165'	'7030166 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20525/NA20525_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_NA20525.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_NA20525.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20525/NA20525_DNA_alignment.sort.bam 4:7029165-7030166 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_NA20525.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_NA20525.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20542/NA20542_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_NA20542.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_NA20542.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20542/NA20542_DNA_alignment.sort.bam 4:7029165-7030166  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_NA20542.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_NA20542.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr4:7029165-7030166 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3125_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 4:7029165-7030166 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3125_HG00382.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3128.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:31325465-31326851 |  vcf-subset -c NA18511,NA18511,NA18511 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3128.vcf
echo -e chr6'	'31325465'	'31326851 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 6:31325465-31326851 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 6:31325465-31326851  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3128_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 6:31325465-31326851 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3128_NA18511.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3128.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:31325465-31326851 |  vcf-subset -c NA11930,HG00118,HG00355 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3128.vcf
echo -e chr6'	'31325465'	'31326851 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11930/NA11930_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_NA11930.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_NA11930.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11930/NA11930_DNA_alignment.sort.bam 6:31325465-31326851 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_NA11930.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_NA11930.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00118/HG00118_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_HG00118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_HG00118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00118/HG00118_DNA_alignment.sort.bam 6:31325465-31326851  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_HG00118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_HG00118.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00355/HG00355_mapsplice_alignment.sort.bam chr6:31325465-31326851 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_HG00355.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3128_HG00355.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00355/HG00355_DNA_alignment.sort.bam 6:31325465-31326851 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_HG00355.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3128_HG00355.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3147.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418124-68420291 |  vcf-subset -c NA18861,NA18861,NA18861 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3147.vcf
echo -e chr9'	'68418124'	'68420291 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 9:68418124-68420291 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 9:68418124-68420291  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3147_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 9:68418124-68420291 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3147_NA18861.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3147.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418124-68420291 |  vcf-subset -c NA11840,HG00096,NA20534 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3147.vcf
echo -e chr9'	'68418124'	'68420291 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11840/NA11840_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_NA11840.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_NA11840.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11840/NA11840_DNA_alignment.sort.bam 9:68418124-68420291 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_NA11840.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_NA11840.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00096/HG00096_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_HG00096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_HG00096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00096/HG00096_DNA_alignment.sort.bam 9:68418124-68420291  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_HG00096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_HG00096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20534/NA20534_mapsplice_alignment.sort.bam chr9:68418124-68420291 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_NA20534.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3147_NA20534.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20534/NA20534_DNA_alignment.sort.bam 9:68418124-68420291 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_NA20534.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3147_NA20534.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3148.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:231118560-231119627 |  vcf-subset -c NA18861,NA18861,NA18861 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3148.vcf
echo -e chr2'	'231118560'	'231119627 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 2:231118560-231119627 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 2:231118560-231119627  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18861/NA18861_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3148_NA18861.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18861/NA18861_DNA_alignment.sort.bam 2:231118560-231119627 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3148_NA18861.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3148.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:231118560-231119627 |  vcf-subset -c NA12287,NA12273,HG00378 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3148.vcf
echo -e chr2'	'231118560'	'231119627 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12287/NA12287_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_NA12287.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_NA12287.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12287/NA12287_DNA_alignment.sort.bam 2:231118560-231119627 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_NA12287.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_NA12287.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12273/NA12273_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_NA12273.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_NA12273.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12273/NA12273_DNA_alignment.sort.bam 2:231118560-231119627  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_NA12273.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_NA12273.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00378/HG00378_mapsplice_alignment.sort.bam chr2:231118560-231119627 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_HG00378.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3148_HG00378.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00378/HG00378_DNA_alignment.sort.bam 2:231118560-231119627 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_HG00378.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3148_HG00378.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3179.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:32500838-32502587 |  vcf-subset -c NA18873,NA18873,NA18873 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3179.vcf
echo -e chr12'	'32500838'	'32502587 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18873/NA18873_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18873/NA18873_DNA_alignment.sort.bam 12:32500838-32502587 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18873/NA18873_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18873/NA18873_DNA_alignment.sort.bam 12:32500838-32502587  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18873/NA18873_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3179_NA18873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18873/NA18873_DNA_alignment.sort.bam 12:32500838-32502587 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3179_NA18873.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3179.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:32500838-32502587 |  vcf-subset -c NA20539,NA20521,NA19189 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3179.vcf
echo -e chr12'	'32500838'	'32502587 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20539/NA20539_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA20539.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA20539.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20539/NA20539_DNA_alignment.sort.bam 12:32500838-32502587 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA20539.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA20539.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20521/NA20521_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA20521.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA20521.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20521/NA20521_DNA_alignment.sort.bam 12:32500838-32502587  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA20521.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA20521.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19189/NA19189_mapsplice_alignment.sort.bam chr12:32500838-32502587 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA19189.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3179_NA19189.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19189/NA19189_DNA_alignment.sort.bam 12:32500838-32502587 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA19189.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3179_NA19189.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3205.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 8:25366953-25367778 |  vcf-subset -c NA18909,NA18909,NA18909 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3205.vcf
echo -e chr8'	'25366953'	'25367778 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18909/NA18909_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18909/NA18909_DNA_alignment.sort.bam 8:25366953-25367778 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18909/NA18909_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18909/NA18909_DNA_alignment.sort.bam 8:25366953-25367778  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18909/NA18909_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3205_NA18909.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18909/NA18909_DNA_alignment.sort.bam 8:25366953-25367778 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3205_NA18909.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3205.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr8.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 8:25366953-25367778 |  vcf-subset -c NA20795,HG00285,HG00335 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3205.vcf
echo -e chr8'	'25366953'	'25367778 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20795/NA20795_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_NA20795.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_NA20795.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20795/NA20795_DNA_alignment.sort.bam 8:25366953-25367778 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_NA20795.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_NA20795.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00285/HG00285_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_HG00285.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_HG00285.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00285/HG00285_DNA_alignment.sort.bam 8:25366953-25367778  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_HG00285.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_HG00285.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00335/HG00335_mapsplice_alignment.sort.bam chr8:25366953-25367778 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_HG00335.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3205_HG00335.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00335/HG00335_DNA_alignment.sort.bam 8:25366953-25367778 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_HG00335.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3205_HG00335.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3252.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:7028386-7031345 |  vcf-subset -c NA18934,NA18934,NA18934 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3252.vcf
echo -e chr4'	'7028386'	'7031345 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 4:7028386-7031345 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 4:7028386-7031345  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3252_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 4:7028386-7031345 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3252_NA18934.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3252.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:7028386-7031345 |  vcf-subset -c HG00344,HG00108,HG00234 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3252.vcf
echo -e chr4'	'7028386'	'7031345 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00344/HG00344_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00344.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00344.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00344/HG00344_DNA_alignment.sort.bam 4:7028386-7031345 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00344.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00344.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00108/HG00108_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00108.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00108.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00108/HG00108_DNA_alignment.sort.bam 4:7028386-7031345  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00108.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00108.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00234/HG00234_mapsplice_alignment.sort.bam chr4:7028386-7031345 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00234.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3252_HG00234.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00234/HG00234_DNA_alignment.sort.bam 4:7028386-7031345 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00234.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3252_HG00234.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3279.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:51711317-51712230 |  vcf-subset -c NA19092,NA19092,NA19092 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3279.vcf
echo -e chr18'	'51711317'	'51712230 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19092/NA19092_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19092/NA19092_DNA_alignment.sort.bam 18:51711317-51712230 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19092/NA19092_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19092/NA19092_DNA_alignment.sort.bam 18:51711317-51712230  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19092/NA19092_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3279_NA19092.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19092/NA19092_DNA_alignment.sort.bam 18:51711317-51712230 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3279_NA19092.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3279.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:51711317-51712230 |  vcf-subset -c HG00158,NA12347,NA12777 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3279.vcf
echo -e chr18'	'51711317'	'51712230 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00158/HG00158_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_HG00158.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_HG00158.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00158/HG00158_DNA_alignment.sort.bam 18:51711317-51712230 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_HG00158.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_HG00158.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12347/NA12347_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_NA12347.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_NA12347.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12347/NA12347_DNA_alignment.sort.bam 18:51711317-51712230  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_NA12347.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_NA12347.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12777/NA12777_mapsplice_alignment.sort.bam chr18:51711317-51712230 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_NA12777.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3279_NA12777.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12777/NA12777_DNA_alignment.sort.bam 18:51711317-51712230 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_NA12777.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3279_NA12777.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3293.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1464804-1465849 |  vcf-subset -c NA19095,NA19095,NA19095 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3293.vcf
echo -e chr5'	'1464804'	'1465849 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 5:1464804-1465849 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 5:1464804-1465849  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3293_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 5:1464804-1465849 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3293_NA19095.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3293.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:1464804-1465849 |  vcf-subset -c HG00233,NA20754,NA11881 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3293.vcf
echo -e chr5'	'1464804'	'1465849 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00233/HG00233_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_HG00233.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_HG00233.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00233/HG00233_DNA_alignment.sort.bam 5:1464804-1465849 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_HG00233.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_HG00233.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20754/NA20754_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_NA20754.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_NA20754.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20754/NA20754_DNA_alignment.sort.bam 5:1464804-1465849  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_NA20754.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_NA20754.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr5:1464804-1465849 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3293_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 5:1464804-1465849 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3293_NA11881.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3296.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:54989470-54994662 |  vcf-subset -c NA19095,NA19095,NA19095 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3296.vcf
echo -e chr17'	'54989470'	'54994662 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 17:54989470-54994662 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 17:54989470-54994662  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3296_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 17:54989470-54994662 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3296_NA19095.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3296.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:54989470-54994662 |  vcf-subset -c NA18867,HG01791,HG00369 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3296.vcf
echo -e chr17'	'54989470'	'54994662 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18867/NA18867_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_NA18867.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_NA18867.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18867/NA18867_DNA_alignment.sort.bam 17:54989470-54994662 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_NA18867.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_NA18867.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01791/HG01791_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_HG01791.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_HG01791.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01791/HG01791_DNA_alignment.sort.bam 17:54989470-54994662  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_HG01791.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_HG01791.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00369/HG00369_mapsplice_alignment.sort.bam chr17:54989470-54994662 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_HG00369.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3296_HG00369.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00369/HG00369_DNA_alignment.sort.bam 17:54989470-54994662 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_HG00369.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3296_HG00369.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3299.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 15:85661711-85662624 |  vcf-subset -c NA19095,NA19095,NA19206 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3299.vcf
echo -e chr15'	'85661711'	'85662624 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 15:85661711-85662624 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19095/NA19095_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19095.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19095.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19095/NA19095_DNA_alignment.sort.bam 15:85661711-85662624  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19095.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19095.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19206/NA19206_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19206.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3299_NA19206.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19206/NA19206_DNA_alignment.sort.bam 15:85661711-85662624 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19206.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3299_NA19206.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3299.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr15.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 15:85661711-85662624 |  vcf-subset -c NA12763,NA06984,HG00109 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3299.vcf
echo -e chr15'	'85661711'	'85662624 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12763/NA12763_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_NA12763.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_NA12763.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12763/NA12763_DNA_alignment.sort.bam 15:85661711-85662624 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_NA12763.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_NA12763.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06984/NA06984_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_NA06984.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_NA06984.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06984/NA06984_DNA_alignment.sort.bam 15:85661711-85662624  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_NA06984.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_NA06984.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00109/HG00109_mapsplice_alignment.sort.bam chr15:85661711-85662624 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_HG00109.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3299_HG00109.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00109/HG00109_DNA_alignment.sort.bam 15:85661711-85662624 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_HG00109.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3299_HG00109.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:14568604-14569847 |  vcf-subset -c NA19096,NA19096,NA19096 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3308.vcf
echo -e chr10'	'14568604'	'14569847 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 10:14568604-14569847 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 10:14568604-14569847  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3308_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 10:14568604-14569847 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3308_NA19096.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:14568604-14569847 |  vcf-subset -c NA18873,NA19108,HG00329 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3308.vcf
echo -e chr10'	'14568604'	'14569847 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18873/NA18873_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_NA18873.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_NA18873.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18873/NA18873_DNA_alignment.sort.bam 10:14568604-14569847 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_NA18873.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_NA18873.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19108/NA19108_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_NA19108.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_NA19108.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19108/NA19108_DNA_alignment.sort.bam 10:14568604-14569847  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_NA19108.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_NA19108.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr10:14568604-14569847 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3308_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 10:14568604-14569847 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3308_HG00329.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3309.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72461098-72462077 |  vcf-subset -c NA19096,NA19096,NA19096 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3309.vcf
echo -e chr17'	'72461098'	'72462077 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 17:72461098-72462077 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 17:72461098-72462077  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19096/NA19096_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3309_NA19096.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19096/NA19096_DNA_alignment.sort.bam 17:72461098-72462077 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3309_NA19096.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3309.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:72461098-72462077 |  vcf-subset -c NA19107,NA19247,NA20544 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3309.vcf
echo -e chr17'	'72461098'	'72462077 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19107/NA19107_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA19107.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA19107.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19107/NA19107_DNA_alignment.sort.bam 17:72461098-72462077 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA19107.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA19107.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19247/NA19247_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA19247.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA19247.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19247/NA19247_DNA_alignment.sort.bam 17:72461098-72462077  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA19247.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA19247.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20544/NA20544_mapsplice_alignment.sort.bam chr17:72461098-72462077 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA20544.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3309_NA20544.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20544/NA20544_DNA_alignment.sort.bam 17:72461098-72462077 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA20544.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3309_NA20544.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3330.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60863528-60869611 |  vcf-subset -c NA19102,NA19102,NA19102 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3330.vcf
echo -e chr18'	'60863528'	'60869611 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19102/NA19102_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19102/NA19102_DNA_alignment.sort.bam 18:60863528-60869611 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19102/NA19102_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19102/NA19102_DNA_alignment.sort.bam 18:60863528-60869611  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19102/NA19102_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3330_NA19102.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19102/NA19102_DNA_alignment.sort.bam 18:60863528-60869611 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3330_NA19102.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3330.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60863528-60869611 |  vcf-subset -c HG00257,NA20807,HG02215 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3330.vcf
echo -e chr18'	'60863528'	'60869611 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 18:60863528-60869611 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20807/NA20807_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_NA20807.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_NA20807.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20807/NA20807_DNA_alignment.sort.bam 18:60863528-60869611  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_NA20807.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_NA20807.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG02215/HG02215_mapsplice_alignment.sort.bam chr18:60863528-60869611 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_HG02215.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3330_HG02215.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG02215/HG02215_DNA_alignment.sort.bam 18:60863528-60869611 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_HG02215.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3330_HG02215.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3342.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418599-68419875 |  vcf-subset -c NA19107,NA19107,NA19107 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3342.vcf
echo -e chr9'	'68418599'	'68419875 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19107/NA19107_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19107/NA19107_DNA_alignment.sort.bam 9:68418599-68419875 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19107/NA19107_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19107/NA19107_DNA_alignment.sort.bam 9:68418599-68419875  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19107/NA19107_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3342_NA19107.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19107/NA19107_DNA_alignment.sort.bam 9:68418599-68419875 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3342_NA19107.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3342.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418599-68419875 |  vcf-subset -c NA20527,NA20518,HG00315 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3342.vcf
echo -e chr9'	'68418599'	'68419875 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20527/NA20527_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_NA20527.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_NA20527.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20527/NA20527_DNA_alignment.sort.bam 9:68418599-68419875 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_NA20527.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_NA20527.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20518/NA20518_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_NA20518.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_NA20518.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20518/NA20518_DNA_alignment.sort.bam 9:68418599-68419875  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_NA20518.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_NA20518.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00315/HG00315_mapsplice_alignment.sort.bam chr9:68418599-68419875 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_HG00315.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3342_HG00315.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00315/HG00315_DNA_alignment.sort.bam 9:68418599-68419875 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_HG00315.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3342_HG00315.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3369.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38789218-38790362 |  vcf-subset -c NA19117,NA19117,NA19117 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3369.vcf
echo -e chr4'	'38789218'	'38790362 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19117/NA19117_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19117/NA19117_DNA_alignment.sort.bam 4:38789218-38790362 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19117/NA19117_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19117/NA19117_DNA_alignment.sort.bam 4:38789218-38790362  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19117/NA19117_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3369_NA19117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19117/NA19117_DNA_alignment.sort.bam 4:38789218-38790362 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3369_NA19117.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3369.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38789218-38790362 |  vcf-subset -c NA20519,NA11892,NA19236 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3369.vcf
echo -e chr4'	'38789218'	'38790362 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 4:38789218-38790362 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11892/NA11892_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA11892.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA11892.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11892/NA11892_DNA_alignment.sort.bam 4:38789218-38790362  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA11892.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA11892.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19236/NA19236_mapsplice_alignment.sort.bam chr4:38789218-38790362 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA19236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3369_NA19236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19236/NA19236_DNA_alignment.sort.bam 4:38789218-38790362 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA19236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3369_NA19236.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3377.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:150129955-150130912 |  vcf-subset -c NA19118,NA19118,NA19118 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3377.vcf
echo -e chr3'	'150129955'	'150130912 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19118/NA19118_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19118/NA19118_DNA_alignment.sort.bam 3:150129955-150130912 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19118/NA19118_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19118/NA19118_DNA_alignment.sort.bam 3:150129955-150130912  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19118/NA19118_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3377_NA19118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19118/NA19118_DNA_alignment.sort.bam 3:150129955-150130912 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3377_NA19118.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3377.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:150129955-150130912 |  vcf-subset -c NA20515,NA06984,HG00118 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3377.vcf
echo -e chr3'	'150129955'	'150130912 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20515/NA20515_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_NA20515.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_NA20515.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20515/NA20515_DNA_alignment.sort.bam 3:150129955-150130912 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_NA20515.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_NA20515.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06984/NA06984_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_NA06984.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_NA06984.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06984/NA06984_DNA_alignment.sort.bam 3:150129955-150130912  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_NA06984.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_NA06984.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00118/HG00118_mapsplice_alignment.sort.bam chr3:150129955-150130912 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_HG00118.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3377_HG00118.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00118/HG00118_DNA_alignment.sort.bam 3:150129955-150130912 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_HG00118.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3377_HG00118.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3403.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:2979861-2982435 |  vcf-subset -c NA19130,NA19130,NA19130 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3403.vcf
echo -e chr7'	'2979861'	'2982435 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19130/NA19130_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19130/NA19130_DNA_alignment.sort.bam 7:2979861-2982435 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19130/NA19130_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19130/NA19130_DNA_alignment.sort.bam 7:2979861-2982435  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19130/NA19130_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3403_NA19130.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19130/NA19130_DNA_alignment.sort.bam 7:2979861-2982435 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3403_NA19130.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3403.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:2979861-2982435 |  vcf-subset -c HG00329,NA11992,HG00383 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3403.vcf
echo -e chr7'	'2979861'	'2982435 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00329/HG00329_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_HG00329.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_HG00329.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00329/HG00329_DNA_alignment.sort.bam 7:2979861-2982435 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_HG00329.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_HG00329.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11992/NA11992_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_NA11992.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_NA11992.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11992/NA11992_DNA_alignment.sort.bam 7:2979861-2982435  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_NA11992.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_NA11992.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00383/HG00383_mapsplice_alignment.sort.bam chr7:2979861-2982435 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_HG00383.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3403_HG00383.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00383/HG00383_DNA_alignment.sort.bam 7:2979861-2982435 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_HG00383.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3403_HG00383.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3421.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 19:1575339-1576890 |  vcf-subset -c NA19137,NA19137,NA19137 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3421.vcf
echo -e chr19'	'1575339'	'1576890 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19137/NA19137_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19137/NA19137_DNA_alignment.sort.bam 19:1575339-1576890 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19137/NA19137_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19137/NA19137_DNA_alignment.sort.bam 19:1575339-1576890  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19137/NA19137_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3421_NA19137.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19137/NA19137_DNA_alignment.sort.bam 19:1575339-1576890 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3421_NA19137.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3421.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr19.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 19:1575339-1576890 |  vcf-subset -c NA19138,HG00382,NA19114 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3421.vcf
echo -e chr19'	'1575339'	'1576890 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 19:1575339-1576890 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_NA19138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 19:1575339-1576890  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_HG00382.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19114/NA19114_mapsplice_alignment.sort.bam chr19:1575339-1576890 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_NA19114.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3421_NA19114.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19114/NA19114_DNA_alignment.sort.bam 19:1575339-1576890 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_NA19114.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3421_NA19114.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3425.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:79504668-79505680 |  vcf-subset -c NA19138,NA19138,NA19138 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3425.vcf
echo -e chr17'	'79504668'	'79505680 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 17:79504668-79505680 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 17:79504668-79505680  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19138/NA19138_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3425_NA19138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19138/NA19138_DNA_alignment.sort.bam 17:79504668-79505680 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3425_NA19138.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3425.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:79504668-79505680 |  vcf-subset -c NA19256,NA20525,HG00127 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3425.vcf
echo -e chr17'	'79504668'	'79505680 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19256/NA19256_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_NA19256.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_NA19256.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19256/NA19256_DNA_alignment.sort.bam 17:79504668-79505680 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_NA19256.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_NA19256.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20525/NA20525_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_NA20525.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_NA20525.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20525/NA20525_DNA_alignment.sort.bam 17:79504668-79505680  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_NA20525.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_NA20525.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00127/HG00127_mapsplice_alignment.sort.bam chr17:79504668-79505680 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_HG00127.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3425_HG00127.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00127/HG00127_DNA_alignment.sort.bam 17:79504668-79505680 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_HG00127.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3425_HG00127.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3440.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418011-68420365 |  vcf-subset -c NA19144,NA19144,NA19144 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3440.vcf
echo -e chr9'	'68418011'	'68420365 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19144/NA19144_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19144/NA19144_DNA_alignment.sort.bam 9:68418011-68420365 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19144/NA19144_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19144/NA19144_DNA_alignment.sort.bam 9:68418011-68420365  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19144/NA19144_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3440_NA19144.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19144/NA19144_DNA_alignment.sort.bam 9:68418011-68420365 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3440_NA19144.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3440.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418011-68420365 |  vcf-subset -c HG00232,HG00119,HG00148 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3440.vcf
echo -e chr9'	'68418011'	'68420365 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00232/HG00232_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00232.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00232.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00232/HG00232_DNA_alignment.sort.bam 9:68418011-68420365 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00232.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00232.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00119/HG00119_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00119.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00119.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00119/HG00119_DNA_alignment.sort.bam 9:68418011-68420365  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00119.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00119.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00148/HG00148_mapsplice_alignment.sort.bam chr9:68418011-68420365 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00148.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3440_HG00148.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00148/HG00148_DNA_alignment.sort.bam 9:68418011-68420365 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00148.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3440_HG00148.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3473.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:37910677-37913108 |  vcf-subset -c NA20517,NA20517,NA20517 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3473.vcf
echo -e chr21'	'37910677'	'37913108 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 21:37910677-37913108 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 21:37910677-37913108  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3473_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 21:37910677-37913108 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3473_NA20517.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3473.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 21:37910677-37913108 |  vcf-subset -c HG00285,NA19098,HG00262 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3473.vcf
echo -e chr21'	'37910677'	'37913108 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00285/HG00285_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_HG00285.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_HG00285.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00285/HG00285_DNA_alignment.sort.bam 21:37910677-37913108 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_HG00285.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_HG00285.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19098/NA19098_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_NA19098.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_NA19098.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19098/NA19098_DNA_alignment.sort.bam 21:37910677-37913108  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_NA19098.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_NA19098.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00262/HG00262_mapsplice_alignment.sort.bam chr21:37910677-37913108 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_HG00262.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3473_HG00262.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00262/HG00262_DNA_alignment.sort.bam 21:37910677-37913108 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_HG00262.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3473_HG00262.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3480.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:137718566-137722471 |  vcf-subset -c NA19150,NA19150,NA19150 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3480.vcf
echo -e chr9'	'137718566'	'137722471 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 9:137718566-137722471 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 9:137718566-137722471  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3480_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 9:137718566-137722471 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3480_NA19150.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3480.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:137718566-137722471 |  vcf-subset -c HG00149,NA20505,NA12004 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3480.vcf
echo -e chr9'	'137718566'	'137722471 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00149/HG00149_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_HG00149.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_HG00149.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00149/HG00149_DNA_alignment.sort.bam 9:137718566-137722471 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_HG00149.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_HG00149.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20505/NA20505_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_NA20505.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_NA20505.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20505/NA20505_DNA_alignment.sort.bam 9:137718566-137722471  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_NA20505.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_NA20505.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12004/NA12004_mapsplice_alignment.sort.bam chr9:137718566-137722471 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_NA12004.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3480_NA12004.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12004/NA12004_DNA_alignment.sort.bam 9:137718566-137722471 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_NA12004.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3480_NA12004.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3486.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:233101645-233102569 |  vcf-subset -c NA19150,NA19150,NA19150 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3486.vcf
echo -e chr1'	'233101645'	'233102569 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 1:233101645-233102569 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 1:233101645-233102569  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19150/NA19150_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3486_NA19150.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19150/NA19150_DNA_alignment.sort.bam 1:233101645-233102569 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3486_NA19150.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3486.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:233101645-233102569 |  vcf-subset -c HG00375,HG00310,NA12775 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3486.vcf
echo -e chr1'	'233101645'	'233102569 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00375/HG00375_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_HG00375.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_HG00375.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00375/HG00375_DNA_alignment.sort.bam 1:233101645-233102569 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_HG00375.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_HG00375.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00310/HG00310_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_HG00310.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_HG00310.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00310/HG00310_DNA_alignment.sort.bam 1:233101645-233102569  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_HG00310.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_HG00310.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12775/NA12775_mapsplice_alignment.sort.bam chr1:233101645-233102569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_NA12775.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3486_NA12775.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12775/NA12775_DNA_alignment.sort.bam 1:233101645-233102569 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_NA12775.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3486_NA12775.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3517.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:121428766-121430878 |  vcf-subset -c HG00382,NA19159,NA19159 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3517.vcf
echo -e chr6'	'121428766'	'121430878 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 6:121428766-121430878 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_HG00382.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19159/NA19159_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_NA19159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_NA19159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19159/NA19159_DNA_alignment.sort.bam 6:121428766-121430878  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_NA19159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_NA19159.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19159/NA19159_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_NA19159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3517_NA19159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19159/NA19159_DNA_alignment.sort.bam 6:121428766-121430878 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_NA19159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3517_NA19159.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3517.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:121428766-121430878 |  vcf-subset -c NA12776,NA19201,HG00182 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3517.vcf
echo -e chr6'	'121428766'	'121430878 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12776/NA12776_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_NA12776.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_NA12776.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12776/NA12776_DNA_alignment.sort.bam 6:121428766-121430878 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_NA12776.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_NA12776.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19201/NA19201_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_NA19201.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_NA19201.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19201/NA19201_DNA_alignment.sort.bam 6:121428766-121430878  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_NA19201.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_NA19201.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00182/HG00182_mapsplice_alignment.sort.bam chr6:121428766-121430878 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_HG00182.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3517_HG00182.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00182/HG00182_DNA_alignment.sort.bam 6:121428766-121430878 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_HG00182.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3517_HG00182.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3524.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:161557946-161559706 |  vcf-subset -c NA19159,NA19159,NA19159 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3524.vcf
echo -e chr6'	'161557946'	'161559706 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19159/NA19159_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19159/NA19159_DNA_alignment.sort.bam 6:161557946-161559706 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19159/NA19159_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19159/NA19159_DNA_alignment.sort.bam 6:161557946-161559706  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19159/NA19159_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3524_NA19159.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19159/NA19159_DNA_alignment.sort.bam 6:161557946-161559706 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3524_NA19159.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3524.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:161557946-161559706 |  vcf-subset -c HG01791,NA12751,NA18519 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3524.vcf
echo -e chr6'	'161557946'	'161559706 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01791/HG01791_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_HG01791.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_HG01791.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01791/HG01791_DNA_alignment.sort.bam 6:161557946-161559706 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_HG01791.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_HG01791.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12751/NA12751_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_NA12751.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_NA12751.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12751/NA12751_DNA_alignment.sort.bam 6:161557946-161559706  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_NA12751.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_NA12751.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18519/NA18519_mapsplice_alignment.sort.bam chr6:161557946-161559706 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_NA18519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3524_NA18519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18519/NA18519_DNA_alignment.sort.bam 6:161557946-161559706 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_NA18519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3524_NA18519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3545.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:11264113-11267468 |  vcf-subset -c NA19172,NA19172,NA19172 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3545.vcf
echo -e chr16'	'11264113'	'11267468 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 16:11264113-11267468 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 16:11264113-11267468  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3545_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 16:11264113-11267468 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3545_NA19172.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3545.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:11264113-11267468 |  vcf-subset -c NA12287,NA20504,NA19117 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3545.vcf
echo -e chr16'	'11264113'	'11267468 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12287/NA12287_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA12287.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA12287.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12287/NA12287_DNA_alignment.sort.bam 16:11264113-11267468 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA12287.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA12287.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 16:11264113-11267468  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA20504.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19117/NA19117_mapsplice_alignment.sort.bam chr16:11264113-11267468 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA19117.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3545_NA19117.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19117/NA19117_DNA_alignment.sort.bam 16:11264113-11267468 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA19117.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3545_NA19117.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3546.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418271-68419569 |  vcf-subset -c NA19172,NA19172,NA19172 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3546.vcf
echo -e chr9'	'68418271'	'68419569 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 9:68418271-68419569 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 9:68418271-68419569  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3546_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam 9:68418271-68419569 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3546_NA19172.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3546.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418271-68419569 |  vcf-subset -c HG00231,NA20538,HG00183 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3546.vcf
echo -e chr9'	'68418271'	'68419569 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00231/HG00231_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_HG00231.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_HG00231.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00231/HG00231_DNA_alignment.sort.bam 9:68418271-68419569 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_HG00231.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_HG00231.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20538/NA20538_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_NA20538.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_NA20538.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20538/NA20538_DNA_alignment.sort.bam 9:68418271-68419569  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_NA20538.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_NA20538.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00183/HG00183_mapsplice_alignment.sort.bam chr9:68418271-68419569 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_HG00183.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3546_HG00183.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00183/HG00183_DNA_alignment.sort.bam 9:68418271-68419569 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_HG00183.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3546_HG00183.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3553.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:88207785-88211448 |  vcf-subset -c NA19175,NA18934,NA18934 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3553.vcf
echo -e chr3'	'88207785'	'88211448 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19175/NA19175_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA19175.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA19175.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19175/NA19175_DNA_alignment.sort.bam 3:88207785-88211448 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA19175.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA19175.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 3:88207785-88211448  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA18934.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18934/NA18934_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA18934.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3553_NA18934.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18934/NA18934_DNA_alignment.sort.bam 3:88207785-88211448 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA18934.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3553_NA18934.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3553.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:88207785-88211448 |  vcf-subset -c HG00282,NA11840,HG00112 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3553.vcf
echo -e chr3'	'88207785'	'88211448 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00282/HG00282_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_HG00282.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_HG00282.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00282/HG00282_DNA_alignment.sort.bam 3:88207785-88211448 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_HG00282.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_HG00282.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11840/NA11840_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_NA11840.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_NA11840.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11840/NA11840_DNA_alignment.sort.bam 3:88207785-88211448  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_NA11840.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_NA11840.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00112/HG00112_mapsplice_alignment.sort.bam chr3:88207785-88211448 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_HG00112.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3553_HG00112.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00112/HG00112_DNA_alignment.sort.bam 3:88207785-88211448 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_HG00112.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3553_HG00112.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3609.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:56382970-56383982 |  vcf-subset -c NA19213,NA19213,NA19213 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3609.vcf
echo -e chr18'	'56382970'	'56383982 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 18:56382970-56383982 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 18:56382970-56383982  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3609_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 18:56382970-56383982 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3609_NA19213.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3609.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:56382970-56383982 |  vcf-subset -c NA20502,NA20541,NA20792 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3609.vcf
echo -e chr18'	'56382970'	'56383982 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20502/NA20502_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20502.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20502.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20502/NA20502_DNA_alignment.sort.bam 18:56382970-56383982 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20502.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20502.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20541/NA20541_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20541.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20541.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20541/NA20541_DNA_alignment.sort.bam 18:56382970-56383982  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20541.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20541.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20792/NA20792_mapsplice_alignment.sort.bam chr18:56382970-56383982 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20792.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3609_NA20792.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20792/NA20792_DNA_alignment.sort.bam 18:56382970-56383982 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20792.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3609_NA20792.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3612.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:8423315-8424459 |  vcf-subset -c NA19213,NA19213,NA19213 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3612.vcf
echo -e chr6'	'8423315'	'8424459 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 6:8423315-8424459 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 6:8423315-8424459  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19213/NA19213_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3612_NA19213.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19213/NA19213_DNA_alignment.sort.bam 6:8423315-8424459 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3612_NA19213.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3612.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:8423315-8424459 |  vcf-subset -c HG00273,HG00236,HG00346 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3612.vcf
echo -e chr6'	'8423315'	'8424459 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00273/HG00273_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00273.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00273.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00273/HG00273_DNA_alignment.sort.bam 6:8423315-8424459 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00273.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00273.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00236/HG00236_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00236/HG00236_DNA_alignment.sort.bam 6:8423315-8424459  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00236.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00346/HG00346_mapsplice_alignment.sort.bam chr6:8423315-8424459 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00346.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3612_HG00346.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00346/HG00346_DNA_alignment.sort.bam 6:8423315-8424459 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00346.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3612_HG00346.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3671.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:31447129-31447976 |  vcf-subset -c NA19236,NA19236,NA19236 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3671.vcf
echo -e chr6'	'31447129'	'31447976 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19236/NA19236_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19236/NA19236_DNA_alignment.sort.bam 6:31447129-31447976 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19236/NA19236_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19236/NA19236_DNA_alignment.sort.bam 6:31447129-31447976  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19236/NA19236_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3671_NA19236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19236/NA19236_DNA_alignment.sort.bam 6:31447129-31447976 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3671_NA19236.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3671.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:31447129-31447976 |  vcf-subset -c HG00382,NA20797,HG00115 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3671.vcf
echo -e chr6'	'31447129'	'31447976 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 6:31447129-31447976 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_HG00382.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20797/NA20797_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_NA20797.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_NA20797.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20797/NA20797_DNA_alignment.sort.bam 6:31447129-31447976  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_NA20797.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_NA20797.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00115/HG00115_mapsplice_alignment.sort.bam chr6:31447129-31447976 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_HG00115.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3671_HG00115.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00115/HG00115_DNA_alignment.sort.bam 6:31447129-31447976 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_HG00115.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3671_HG00115.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3720.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:89963995-89964974 |  vcf-subset -c NA20508,NA20508,NA20508 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3720.vcf
echo -e chr6'	'89963995'	'89964974 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20508/NA20508_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20508/NA20508_DNA_alignment.sort.bam 6:89963995-89964974 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20508/NA20508_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20508/NA20508_DNA_alignment.sort.bam 6:89963995-89964974  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20508/NA20508_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3720_NA20508.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20508/NA20508_DNA_alignment.sort.bam 6:89963995-89964974 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3720_NA20508.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3720.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:89963995-89964974 |  vcf-subset -c HG00176,NA12413,NA20507 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3720.vcf
echo -e chr6'	'89963995'	'89964974 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00176/HG00176_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_HG00176.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_HG00176.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00176/HG00176_DNA_alignment.sort.bam 6:89963995-89964974 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_HG00176.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_HG00176.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12413/NA12413_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_NA12413.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_NA12413.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12413/NA12413_DNA_alignment.sort.bam 6:89963995-89964974  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_NA12413.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_NA12413.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20507/NA20507_mapsplice_alignment.sort.bam chr6:89963995-89964974 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_NA20507.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3720_NA20507.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20507/NA20507_DNA_alignment.sort.bam 6:89963995-89964974 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_NA20507.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3720_NA20507.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3733.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:95658971-95659818 |  vcf-subset -c NA20509,NA20509,NA20509 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3733.vcf
echo -e chr12'	'95658971'	'95659818 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20509/NA20509_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20509/NA20509_DNA_alignment.sort.bam 12:95658971-95659818 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20509/NA20509_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20509/NA20509_DNA_alignment.sort.bam 12:95658971-95659818  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20509/NA20509_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3733_NA20509.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20509/NA20509_DNA_alignment.sort.bam 12:95658971-95659818 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3733_NA20509.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3733.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:95658971-95659818 |  vcf-subset -c NA20785,HG00285,HG00238 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3733.vcf
echo -e chr12'	'95658971'	'95659818 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20785/NA20785_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_NA20785.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_NA20785.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20785/NA20785_DNA_alignment.sort.bam 12:95658971-95659818 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_NA20785.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_NA20785.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00285/HG00285_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_HG00285.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_HG00285.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00285/HG00285_DNA_alignment.sort.bam 12:95658971-95659818  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_HG00285.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_HG00285.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00238/HG00238_mapsplice_alignment.sort.bam chr12:95658971-95659818 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_HG00238.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3733_HG00238.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00238/HG00238_DNA_alignment.sort.bam 12:95658971-95659818 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_HG00238.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3733_HG00238.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3804.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:187078053-187084686 |  vcf-subset -c NA20513,NA20513,NA20513 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3804.vcf
echo -e chr4'	'187078053'	'187084686 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20513/NA20513_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20513/NA20513_DNA_alignment.sort.bam 4:187078053-187084686 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20513/NA20513_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20513/NA20513_DNA_alignment.sort.bam 4:187078053-187084686  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20513/NA20513_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3804_NA20513.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20513/NA20513_DNA_alignment.sort.bam 4:187078053-187084686 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3804_NA20513.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3804.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:187078053-187084686 |  vcf-subset -c HG00350,NA20773,HG00259 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3804.vcf
echo -e chr4'	'187078053'	'187084686 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00350/HG00350_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_HG00350.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_HG00350.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00350/HG00350_DNA_alignment.sort.bam 4:187078053-187084686 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_HG00350.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_HG00350.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20773/NA20773_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_NA20773.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_NA20773.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20773/NA20773_DNA_alignment.sort.bam 4:187078053-187084686  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_NA20773.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_NA20773.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00259/HG00259_mapsplice_alignment.sort.bam chr4:187078053-187084686 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_HG00259.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3804_HG00259.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00259/HG00259_DNA_alignment.sort.bam 4:187078053-187084686 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_HG00259.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3804_HG00259.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3821.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:207095444-207099899 |  vcf-subset -c NA20515,NA20515,NA20515 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3821.vcf
echo -e chr1'	'207095444'	'207099899 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20515/NA20515_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20515/NA20515_DNA_alignment.sort.bam 1:207095444-207099899 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20515/NA20515_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20515/NA20515_DNA_alignment.sort.bam 1:207095444-207099899  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20515/NA20515_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3821_NA20515.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20515/NA20515_DNA_alignment.sort.bam 1:207095444-207099899 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3821_NA20515.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3821.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:207095444-207099899 |  vcf-subset -c HG00257,NA11894,HG00349 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3821.vcf
echo -e chr1'	'207095444'	'207099899 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00257/HG00257_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_HG00257.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_HG00257.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00257/HG00257_DNA_alignment.sort.bam 1:207095444-207099899 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_HG00257.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_HG00257.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11894/NA11894_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_NA11894.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_NA11894.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11894/NA11894_DNA_alignment.sort.bam 1:207095444-207099899  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_NA11894.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_NA11894.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00349/HG00349_mapsplice_alignment.sort.bam chr1:207095444-207099899 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_HG00349.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3821_HG00349.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00349/HG00349_DNA_alignment.sort.bam 1:207095444-207099899 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_HG00349.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3821_HG00349.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3833.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:98747494-98748374 |  vcf-subset -c NA20517,NA20517,NA20517 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3833.vcf
echo -e chr10'	'98747494'	'98748374 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 10:98747494-98748374 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 10:98747494-98748374  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3833_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 10:98747494-98748374 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3833_NA20517.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3833.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr10.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 10:98747494-98748374 |  vcf-subset -c HG00127,NA20520,HG00277 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3833.vcf
echo -e chr10'	'98747494'	'98748374 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00127/HG00127_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_HG00127.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_HG00127.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00127/HG00127_DNA_alignment.sort.bam 10:98747494-98748374 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_HG00127.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_HG00127.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20520/NA20520_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_NA20520.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_NA20520.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20520/NA20520_DNA_alignment.sort.bam 10:98747494-98748374  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_NA20520.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_NA20520.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00277/HG00277_mapsplice_alignment.sort.bam chr10:98747494-98748374 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_HG00277.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3833_HG00277.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00277/HG00277_DNA_alignment.sort.bam 10:98747494-98748374 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_HG00277.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3833_HG00277.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3837.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:879155-882543 |  vcf-subset -c NA20517,NA20517,NA12872 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3837.vcf
echo -e chr4'	'879155'	'882543 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 4:879155-882543 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20517/NA20517_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA20517.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA20517.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20517/NA20517_DNA_alignment.sort.bam 4:879155-882543  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA20517.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA20517.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12872/NA12872_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA12872.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3837_NA12872.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12872/NA12872_DNA_alignment.sort.bam 4:879155-882543 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA12872.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3837_NA12872.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3837.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:879155-882543 |  vcf-subset -c NA20803,NA20815,NA20508 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3837.vcf
echo -e chr4'	'879155'	'882543 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 4:879155-882543 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20803.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20815/NA20815_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20815.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20815.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20815/NA20815_DNA_alignment.sort.bam 4:879155-882543  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20815.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20815.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20508/NA20508_mapsplice_alignment.sort.bam chr4:879155-882543 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20508.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3837_NA20508.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20508/NA20508_DNA_alignment.sort.bam 4:879155-882543 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20508.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3837_NA20508.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3851.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:84968079-84968959 |  vcf-subset -c NA20519,NA20519,NA20519 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3851.vcf
echo -e chr1'	'84968079'	'84968959 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 1:84968079-84968959 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 1:84968079-84968959  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3851_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 1:84968079-84968959 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3851_NA20519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3851.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:84968079-84968959 |  vcf-subset -c HG00182,NA20504,NA11931 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3851.vcf
echo -e chr1'	'84968079'	'84968959 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00182/HG00182_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_HG00182.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_HG00182.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00182/HG00182_DNA_alignment.sort.bam 1:84968079-84968959 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_HG00182.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_HG00182.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20504/NA20504_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_NA20504.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_NA20504.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20504/NA20504_DNA_alignment.sort.bam 1:84968079-84968959  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_NA20504.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_NA20504.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11931/NA11931_mapsplice_alignment.sort.bam chr1:84968079-84968959 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_NA11931.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3851_NA11931.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11931/NA11931_DNA_alignment.sort.bam 1:84968079-84968959 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_NA11931.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3851_NA11931.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3853.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:133268113-133268960 |  vcf-subset -c NA20519,NA20519,NA20519 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3853.vcf
echo -e chr12'	'133268113'	'133268960 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 12:133268113-133268960 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 12:133268113-133268960  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3853_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 12:133268113-133268960 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3853_NA20519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3853.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr12.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 12:133268113-133268960 |  vcf-subset -c HG00177,HG00138,NA19201 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3853.vcf
echo -e chr12'	'133268113'	'133268960 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00177/HG00177_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_HG00177.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_HG00177.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00177/HG00177_DNA_alignment.sort.bam 12:133268113-133268960 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_HG00177.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_HG00177.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00138/HG00138_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_HG00138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_HG00138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00138/HG00138_DNA_alignment.sort.bam 12:133268113-133268960  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_HG00138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_HG00138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19201/NA19201_mapsplice_alignment.sort.bam chr12:133268113-133268960 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_NA19201.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3853_NA19201.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19201/NA19201_DNA_alignment.sort.bam 12:133268113-133268960 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_NA19201.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3853_NA19201.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3855.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:74977247-74978732 |  vcf-subset -c NA20519,NA20519,NA20519 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3855.vcf
echo -e chr9'	'74977247'	'74978732 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 9:74977247-74978732 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 9:74977247-74978732  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3855_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 9:74977247-74978732 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3855_NA20519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3855.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:74977247-74978732 |  vcf-subset -c HG00138,NA12348,NA12829 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3855.vcf
echo -e chr9'	'74977247'	'74978732 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00138/HG00138_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_HG00138.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_HG00138.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00138/HG00138_DNA_alignment.sort.bam 9:74977247-74978732 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_HG00138.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_HG00138.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12348/NA12348_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_NA12348.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_NA12348.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12348/NA12348_DNA_alignment.sort.bam 9:74977247-74978732  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_NA12348.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_NA12348.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12829/NA12829_mapsplice_alignment.sort.bam chr9:74977247-74978732 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_NA12829.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3855_NA12829.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12829/NA12829_DNA_alignment.sort.bam 9:74977247-74978732 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_NA12829.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3855_NA12829.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3857.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:170155057-170156696 |  vcf-subset -c NA20519,NA20519,NA20519 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3857.vcf
echo -e chr6'	'170155057'	'170156696 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 6:170155057-170156696 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 6:170155057-170156696  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20519/NA20519_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3857_NA20519.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20519/NA20519_DNA_alignment.sort.bam 6:170155057-170156696 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3857_NA20519.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3857.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr6.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 6:170155057-170156696 |  vcf-subset -c NA12872,NA12777,HG00097 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3857.vcf
echo -e chr6'	'170155057'	'170156696 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12872/NA12872_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_NA12872.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_NA12872.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12872/NA12872_DNA_alignment.sort.bam 6:170155057-170156696 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_NA12872.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_NA12872.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12777/NA12777_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_NA12777.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_NA12777.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12777/NA12777_DNA_alignment.sort.bam 6:170155057-170156696  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_NA12777.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_NA12777.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00097/HG00097_mapsplice_alignment.sort.bam chr6:170155057-170156696 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_HG00097.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3857_HG00097.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00097/HG00097_DNA_alignment.sort.bam 6:170155057-170156696 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_HG00097.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3857_HG00097.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3873.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:44548914-44552742 |  vcf-subset -c NA20521,NA20521,NA20521 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3873.vcf
echo -e chr22'	'44548914'	'44552742 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20521/NA20521_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20521/NA20521_DNA_alignment.sort.bam 22:44548914-44552742 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20521/NA20521_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20521/NA20521_DNA_alignment.sort.bam 22:44548914-44552742  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20521/NA20521_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3873_NA20521.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20521/NA20521_DNA_alignment.sort.bam 22:44548914-44552742 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3873_NA20521.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3873.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:44548914-44552742 |  vcf-subset -c HG00373,NA12829,HG00350 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3873.vcf
echo -e chr22'	'44548914'	'44552742 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00373/HG00373_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_HG00373.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_HG00373.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00373/HG00373_DNA_alignment.sort.bam 22:44548914-44552742 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_HG00373.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_HG00373.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12829/NA12829_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_NA12829.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_NA12829.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12829/NA12829_DNA_alignment.sort.bam 22:44548914-44552742  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_NA12829.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_NA12829.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00350/HG00350_mapsplice_alignment.sort.bam chr22:44548914-44552742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_HG00350.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3873_HG00350.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00350/HG00350_DNA_alignment.sort.bam 22:44548914-44552742 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_HG00350.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3873_HG00350.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3944.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60884606-60887235 |  vcf-subset -c NA20534,NA20534,NA20534 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3944.vcf
echo -e chr18'	'60884606'	'60887235 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20534/NA20534_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20534/NA20534_DNA_alignment.sort.bam 18:60884606-60887235 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20534/NA20534_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20534/NA20534_DNA_alignment.sort.bam 18:60884606-60887235  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20534/NA20534_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3944_NA20534.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20534/NA20534_DNA_alignment.sort.bam 18:60884606-60887235 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3944_NA20534.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3944.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr18.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 18:60884606-60887235 |  vcf-subset -c NA20785,NA19099,NA19190 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3944.vcf
echo -e chr18'	'60884606'	'60887235 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20785/NA20785_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA20785.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA20785.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20785/NA20785_DNA_alignment.sort.bam 18:60884606-60887235 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA20785.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA20785.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19099/NA19099_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA19099.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA19099.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19099/NA19099_DNA_alignment.sort.bam 18:60884606-60887235  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA19099.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA19099.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19190/NA19190_mapsplice_alignment.sort.bam chr18:60884606-60887235 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA19190.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3944_NA19190.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19190/NA19190_DNA_alignment.sort.bam 18:60884606-60887235 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA19190.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3944_NA19190.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3957.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:158733776-158734667 |  vcf-subset -c NA20535,NA20535,NA20535 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3957.vcf
echo -e chr7'	'158733776'	'158734667 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20535/NA20535_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20535/NA20535_DNA_alignment.sort.bam 7:158733776-158734667 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20535/NA20535_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20535/NA20535_DNA_alignment.sort.bam 7:158733776-158734667  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20535/NA20535_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3957_NA20535.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20535/NA20535_DNA_alignment.sort.bam 7:158733776-158734667 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3957_NA20535.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3957.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr7.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 7:158733776-158734667 |  vcf-subset -c NA20811,NA11843,NA12156 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3957.vcf
echo -e chr7'	'158733776'	'158734667 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20811/NA20811_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA20811.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA20811.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20811/NA20811_DNA_alignment.sort.bam 7:158733776-158734667 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA20811.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA20811.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11843/NA11843_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA11843.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA11843.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11843/NA11843_DNA_alignment.sort.bam 7:158733776-158734667  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA11843.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA11843.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12156/NA12156_mapsplice_alignment.sort.bam chr7:158733776-158734667 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA12156.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3957_NA12156.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12156/NA12156_DNA_alignment.sort.bam 7:158733776-158734667 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA12156.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3957_NA12156.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3981.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38787858-38791752 |  vcf-subset -c NA20539,NA20539,NA20539 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_3981.vcf
echo -e chr4'	'38787858'	'38791752 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20539/NA20539_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20539/NA20539_DNA_alignment.sort.bam 4:38787858-38791752 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20539/NA20539_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20539/NA20539_DNA_alignment.sort.bam 4:38787858-38791752  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20539/NA20539_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_3981_NA20539.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20539/NA20539_DNA_alignment.sort.bam 4:38787858-38791752 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_3981_NA20539.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3981.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr4.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 4:38787858-38791752 |  vcf-subset -c HG00382,HG00128,NA20524 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_3981.vcf
echo -e chr4'	'38787858'	'38791752 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00382/HG00382_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_HG00382.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_HG00382.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00382/HG00382_DNA_alignment.sort.bam 4:38787858-38791752 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_HG00382.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_HG00382.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00128/HG00128_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_HG00128.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_HG00128.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00128/HG00128_DNA_alignment.sort.bam 4:38787858-38791752  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_HG00128.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_HG00128.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20524/NA20524_mapsplice_alignment.sort.bam chr4:38787858-38791752 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_NA20524.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_3981_NA20524.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20524/NA20524_DNA_alignment.sort.bam 4:38787858-38791752 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_NA20524.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_3981_NA20524.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4039.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:132042650-132044025 |  vcf-subset -c NA20589,NA20589,NA20589 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4039.vcf
echo -e chr5'	'132042650'	'132044025 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20589/NA20589_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20589/NA20589_DNA_alignment.sort.bam 5:132042650-132044025 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20589/NA20589_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20589/NA20589_DNA_alignment.sort.bam 5:132042650-132044025  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20589/NA20589_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4039_NA20589.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20589/NA20589_DNA_alignment.sort.bam 5:132042650-132044025 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4039_NA20589.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4039.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:132042650-132044025 |  vcf-subset -c NA12827,NA20790,NA07037 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4039.vcf
echo -e chr5'	'132042650'	'132044025 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12827/NA12827_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA12827.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA12827.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12827/NA12827_DNA_alignment.sort.bam 5:132042650-132044025 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA12827.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA12827.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20790/NA20790_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA20790.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA20790.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20790/NA20790_DNA_alignment.sort.bam 5:132042650-132044025  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA20790.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA20790.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07037/NA07037_mapsplice_alignment.sort.bam chr5:132042650-132044025 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA07037.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4039_NA07037.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07037/NA07037_DNA_alignment.sort.bam 5:132042650-132044025 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA07037.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4039_NA07037.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4041.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:43101058-43102268 |  vcf-subset -c NA20752,NA20752,NA20752 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4041.vcf
echo -e chr5'	'43101058'	'43102268 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 5:43101058-43102268 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 5:43101058-43102268  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20752/NA20752_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4041_NA20752.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20752/NA20752_DNA_alignment.sort.bam 5:43101058-43102268 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4041_NA20752.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4041.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:43101058-43102268 |  vcf-subset -c HG01790,NA07056,HG00246 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4041.vcf
echo -e chr5'	'43101058'	'43102268 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01790/HG01790_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_HG01790.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_HG01790.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01790/HG01790_DNA_alignment.sort.bam 5:43101058-43102268 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_HG01790.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_HG01790.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA07056/NA07056_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_NA07056.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_NA07056.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA07056/NA07056_DNA_alignment.sort.bam 5:43101058-43102268  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_NA07056.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_NA07056.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00246/HG00246_mapsplice_alignment.sort.bam chr5:43101058-43102268 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_HG00246.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4041_HG00246.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00246/HG00246_DNA_alignment.sort.bam 5:43101058-43102268 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_HG00246.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4041_HG00246.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4057.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:143755117-143756250 |  vcf-subset -c NA20756,NA20756,NA20756 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4057.vcf
echo -e chr2'	'143755117'	'143756250 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20756/NA20756_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20756/NA20756_DNA_alignment.sort.bam 2:143755117-143756250 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20756/NA20756_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20756/NA20756_DNA_alignment.sort.bam 2:143755117-143756250  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20756/NA20756_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4057_NA20756.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20756/NA20756_DNA_alignment.sort.bam 2:143755117-143756250 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4057_NA20756.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4057.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr2.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 2:143755117-143756250 |  vcf-subset -c NA11894,NA20772,HG00351 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4057.vcf
echo -e chr2'	'143755117'	'143756250 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11894/NA11894_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_NA11894.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_NA11894.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11894/NA11894_DNA_alignment.sort.bam 2:143755117-143756250 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_NA11894.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_NA11894.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20772/NA20772_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_NA20772.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_NA20772.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20772/NA20772_DNA_alignment.sort.bam 2:143755117-143756250  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_NA20772.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_NA20772.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00351/HG00351_mapsplice_alignment.sort.bam chr2:143755117-143756250 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_HG00351.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4057_HG00351.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00351/HG00351_DNA_alignment.sort.bam 2:143755117-143756250 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_HG00351.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4057_HG00351.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4093.vcf
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz  X:135991190-135993357 |  vcf-subset -c NA20765,NA20765,NA20765 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4093.vcf 
echo -e chrX'	'135991190'	'135993357 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20765/NA20765_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20765/NA20765_DNA_alignment.sort.bam X:135991190-135993357 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20765/NA20765_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20765/NA20765_DNA_alignment.sort.bam X:135991190-135993357  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20765/NA20765_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4093_NA20765.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20765/NA20765_DNA_alignment.sort.bam X:135991190-135993357 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4093_NA20765.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4093.vcf
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chrX.phase3_shapeit2_mvncall_integrated_v1a.20130502.genotypes.vcf.gz  X:135991190-135993357 |  vcf-subset -c NA20503,NA20542,NA19172 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4093.vcf 
echo -e chrX'	'135991190'	'135993357 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20503/NA20503_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA20503.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA20503.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20503/NA20503_DNA_alignment.sort.bam X:135991190-135993357 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA20503.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA20503.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20542/NA20542_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA20542.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA20542.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20542/NA20542_DNA_alignment.sort.bam X:135991190-135993357  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA20542.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA20542.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19172/NA19172_mapsplice_alignment.sort.bam chrX:135991190-135993357 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA19172.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4093_NA19172.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19172/NA19172_DNA_alignment.sort.bam X:135991190-135993357 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA19172.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4093_NA19172.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4111.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:105992953-105993987 |  vcf-subset -c NA20768,NA20768,NA20768 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4111.vcf
echo -e chr3'	'105992953'	'105993987 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20768/NA20768_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20768/NA20768_DNA_alignment.sort.bam 3:105992953-105993987 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20768/NA20768_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20768/NA20768_DNA_alignment.sort.bam 3:105992953-105993987  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20768/NA20768_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4111_NA20768.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20768/NA20768_DNA_alignment.sort.bam 3:105992953-105993987 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4111_NA20768.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4111.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr3.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 3:105992953-105993987 |  vcf-subset -c NA18868,NA20588,NA19152 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4111.vcf
echo -e chr3'	'105992953'	'105993987 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18868/NA18868_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA18868.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA18868.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18868/NA18868_DNA_alignment.sort.bam 3:105992953-105993987 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA18868.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA18868.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20588/NA20588_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA20588.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA20588.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20588/NA20588_DNA_alignment.sort.bam 3:105992953-105993987  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA20588.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA20588.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA19152/NA19152_mapsplice_alignment.sort.bam chr3:105992953-105993987 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA19152.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4111_NA19152.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA19152/NA19152_DNA_alignment.sort.bam 3:105992953-105993987 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA19152.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4111_NA19152.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4116.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418112-68420301 |  vcf-subset -c NA20769,NA20769,NA20769 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4116.vcf
echo -e chr9'	'68418112'	'68420301 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20769/NA20769_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20769/NA20769_DNA_alignment.sort.bam 9:68418112-68420301 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20769/NA20769_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20769/NA20769_DNA_alignment.sort.bam 9:68418112-68420301  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20769/NA20769_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4116_NA20769.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20769/NA20769_DNA_alignment.sort.bam 9:68418112-68420301 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4116_NA20769.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4116.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:68418112-68420301 |  vcf-subset -c NA18511,NA12874,NA12717 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4116.vcf
echo -e chr9'	'68418112'	'68420301 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18511/NA18511_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA18511.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA18511.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18511/NA18511_DNA_alignment.sort.bam 9:68418112-68420301 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA18511.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA18511.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12874/NA12874_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA12874.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA12874.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12874/NA12874_DNA_alignment.sort.bam 9:68418112-68420301  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA12874.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA12874.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12717/NA12717_mapsplice_alignment.sort.bam chr9:68418112-68420301 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA12717.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4116_NA12717.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12717/NA12717_DNA_alignment.sort.bam 9:68418112-68420301 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA12717.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4116_NA12717.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4165.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:77299698-77300930 |  vcf-subset -c NA20795,NA20795,NA20795 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4165.vcf
echo -e chr5'	'77299698'	'77300930 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20795/NA20795_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20795/NA20795_DNA_alignment.sort.bam 5:77299698-77300930 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20795/NA20795_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20795/NA20795_DNA_alignment.sort.bam 5:77299698-77300930  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20795/NA20795_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4165_NA20795.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20795/NA20795_DNA_alignment.sort.bam 5:77299698-77300930 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4165_NA20795.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4165.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr5.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 5:77299698-77300930 |  vcf-subset -c HG00330,HG00132,NA12778 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4165.vcf
echo -e chr5'	'77299698'	'77300930 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00330/HG00330_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_HG00330.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_HG00330.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00330/HG00330_DNA_alignment.sort.bam 5:77299698-77300930 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_HG00330.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_HG00330.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00132/HG00132_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_HG00132.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_HG00132.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00132/HG00132_DNA_alignment.sort.bam 5:77299698-77300930  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_HG00132.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_HG00132.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12778/NA12778_mapsplice_alignment.sort.bam chr5:77299698-77300930 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_NA12778.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4165_NA12778.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12778/NA12778_DNA_alignment.sort.bam 5:77299698-77300930 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_NA12778.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4165_NA12778.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4179.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:30537413-30539613 |  vcf-subset -c NA20796,NA20796,NA20796 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4179.vcf
echo -e chr16'	'30537413'	'30539613 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20796/NA20796_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20796/NA20796_DNA_alignment.sort.bam 16:30537413-30539613 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20796/NA20796_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20796/NA20796_DNA_alignment.sort.bam 16:30537413-30539613  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20796/NA20796_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4179_NA20796.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20796/NA20796_DNA_alignment.sort.bam 16:30537413-30539613 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4179_NA20796.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4179.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:30537413-30539613 |  vcf-subset -c NA20778,NA18912,HG00236 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4179.vcf
echo -e chr16'	'30537413'	'30539613 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20778/NA20778_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_NA20778.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_NA20778.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20778/NA20778_DNA_alignment.sort.bam 16:30537413-30539613 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_NA20778.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_NA20778.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA18912/NA18912_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_NA18912.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_NA18912.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA18912/NA18912_DNA_alignment.sort.bam 16:30537413-30539613  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_NA18912.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_NA18912.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00236/HG00236_mapsplice_alignment.sort.bam chr16:30537413-30539613 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_HG00236.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4179_HG00236.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00236/HG00236_DNA_alignment.sort.bam 16:30537413-30539613 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_HG00236.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4179_HG00236.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4195.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:30550213-30551962 |  vcf-subset -c NA20799,NA20799,NA20799 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4195.vcf
echo -e chr17'	'30550213'	'30551962 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20799/NA20799_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20799/NA20799_DNA_alignment.sort.bam 17:30550213-30551962 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20799/NA20799_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20799/NA20799_DNA_alignment.sort.bam 17:30550213-30551962  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20799/NA20799_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4195_NA20799.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20799/NA20799_DNA_alignment.sort.bam 17:30550213-30551962 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4195_NA20799.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4195.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr17.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 17:30550213-30551962 |  vcf-subset -c HG00125,NA11992,HG00179 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4195.vcf
echo -e chr17'	'30550213'	'30551962 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00125/HG00125_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_HG00125.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_HG00125.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00125/HG00125_DNA_alignment.sort.bam 17:30550213-30551962 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_HG00125.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_HG00125.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11992/NA11992_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_NA11992.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_NA11992.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11992/NA11992_DNA_alignment.sort.bam 17:30550213-30551962  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_NA11992.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_NA11992.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00179/HG00179_mapsplice_alignment.sort.bam chr17:30550213-30551962 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_HG00179.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4195_HG00179.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00179/HG00179_DNA_alignment.sort.bam 17:30550213-30551962 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_HG00179.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4195_HG00179.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4214.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:110139614-110140626 |  vcf-subset -c NA20803,NA20803,NA20803 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4214.vcf
echo -e chr1'	'110139614'	'110140626 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 1:110139614-110140626 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 1:110139614-110140626  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4214_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 1:110139614-110140626 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4214_NA20803.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4214.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 1:110139614-110140626 |  vcf-subset -c NA11881,NA10851,NA12762 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4214.vcf
echo -e chr1'	'110139614'	'110140626 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11881/NA11881_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA11881.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA11881.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11881/NA11881_DNA_alignment.sort.bam 1:110139614-110140626 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA11881.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA11881.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10851/NA10851_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA10851.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA10851.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10851/NA10851_DNA_alignment.sort.bam 1:110139614-110140626  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA10851.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA10851.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA12762/NA12762_mapsplice_alignment.sort.bam chr1:110139614-110140626 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA12762.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4214_NA12762.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA12762/NA12762_DNA_alignment.sort.bam 1:110139614-110140626 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA12762.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4214_NA12762.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4215.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:9056575-9058742 |  vcf-subset -c NA20803,NA20803,NA20803 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4215.vcf
echo -e chr16'	'9056575'	'9058742 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 16:9056575-9058742 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 16:9056575-9058742  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20803/NA20803_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4215_NA20803.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20803/NA20803_DNA_alignment.sort.bam 16:9056575-9058742 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4215_NA20803.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4215.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 16:9056575-9058742 |  vcf-subset -c HG00179,HG00350,HG00285 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4215.vcf
echo -e chr16'	'9056575'	'9058742 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00179/HG00179_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00179.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00179.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00179/HG00179_DNA_alignment.sort.bam 16:9056575-9058742 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00179.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00179.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00350/HG00350_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00350.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00350.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00350/HG00350_DNA_alignment.sort.bam 16:9056575-9058742  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00350.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00350.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00285/HG00285_mapsplice_alignment.sort.bam chr16:9056575-9058742 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00285.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4215_HG00285.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00285/HG00285_DNA_alignment.sort.bam 16:9056575-9058742 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00285.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4215_HG00285.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4227.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:47376603-47379848 |  vcf-subset -c NA20805,NA20805,NA20805 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4227.vcf
echo -e chr11'	'47376603'	'47379848 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20805/NA20805_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20805/NA20805_DNA_alignment.sort.bam 11:47376603-47379848 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20805/NA20805_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20805/NA20805_DNA_alignment.sort.bam 11:47376603-47379848  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20805/NA20805_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4227_NA20805.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20805/NA20805_DNA_alignment.sort.bam 11:47376603-47379848 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4227_NA20805.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4227.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr11.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 11:47376603-47379848 |  vcf-subset -c HG00253,NA06989,NA10851 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4227.vcf
echo -e chr11'	'47376603'	'47379848 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00253/HG00253_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_HG00253.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_HG00253.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00253/HG00253_DNA_alignment.sort.bam 11:47376603-47379848 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_HG00253.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_HG00253.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06989/NA06989_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_NA06989.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_NA06989.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06989/NA06989_DNA_alignment.sort.bam 11:47376603-47379848  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_NA06989.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_NA06989.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA10851/NA10851_mapsplice_alignment.sort.bam chr11:47376603-47379848 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_NA10851.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4227_NA10851.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA10851/NA10851_DNA_alignment.sort.bam 11:47376603-47379848 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_NA10851.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4227_NA10851.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4257.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:49972637-49976366 |  vcf-subset -c NA20810,NA20810,NA20810 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4257.vcf
echo -e chr22'	'49972637'	'49976366 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20810/NA20810_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20810/NA20810_DNA_alignment.sort.bam 22:49972637-49976366 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20810/NA20810_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20810/NA20810_DNA_alignment.sort.bam 22:49972637-49976366  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20810/NA20810_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4257_NA20810.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20810/NA20810_DNA_alignment.sort.bam 22:49972637-49976366 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4257_NA20810.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4257.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 22:49972637-49976366 |  vcf-subset -c NA20543,HG00346,HG00137 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4257.vcf
echo -e chr22'	'49972637'	'49976366 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20543/NA20543_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_NA20543.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_NA20543.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20543/NA20543_DNA_alignment.sort.bam 22:49972637-49976366 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_NA20543.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_NA20543.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00346/HG00346_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_HG00346.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_HG00346.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00346/HG00346_DNA_alignment.sort.bam 22:49972637-49976366  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_HG00346.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_HG00346.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00137/HG00137_mapsplice_alignment.sort.bam chr22:49972637-49976366 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_HG00137.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4257_HG00137.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00137/HG00137_DNA_alignment.sort.bam 22:49972637-49976366 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_HG00137.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4257_HG00137.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4274.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:114679110-114679957 |  vcf-subset -c NA20812,NA20812,NA20812 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4274.vcf
echo -e chr9'	'114679110'	'114679957 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20812/NA20812_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20812/NA20812_DNA_alignment.sort.bam 9:114679110-114679957 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20812/NA20812_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20812/NA20812_DNA_alignment.sort.bam 9:114679110-114679957  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20812/NA20812_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4274_NA20812.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20812/NA20812_DNA_alignment.sort.bam 9:114679110-114679957 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4274_NA20812.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4274.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr9.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 9:114679110-114679957 |  vcf-subset -c NA20544,NA11920,NA06989 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4274.vcf
echo -e chr9'	'114679110'	'114679957 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20544/NA20544_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA20544.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA20544.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20544/NA20544_DNA_alignment.sort.bam 9:114679110-114679957 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA20544.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA20544.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA11920/NA11920_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA11920.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA11920.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA11920/NA11920_DNA_alignment.sort.bam 9:114679110-114679957  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA11920.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA11920.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA06989/NA06989_mapsplice_alignment.sort.bam chr9:114679110-114679957 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA06989.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4274_NA06989.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA06989/NA06989_DNA_alignment.sort.bam 9:114679110-114679957 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA06989.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4274_NA06989.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:50114444-50115621 |  vcf-subset -c NA20828,NA20828,NA20828 >> /netscr/csoeder/1kGen/VCFpath_meh/Expressers_4308.vcf
echo -e chr14'	'50114444'	'50115621 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20828/NA20828_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20828/NA20828_DNA_alignment.sort.bam 14:50114444-50115621 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20828/NA20828_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20828/NA20828_DNA_alignment.sort.bam 14:50114444-50115621  > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/NA20828/NA20828_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/Expressers_4308_NA20828.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//NA20828/NA20828_DNA_alignment.sort.bam 14:50114444-50115621 > /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/Expressers_4308_NA20828.bam 
tabix -H /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz > /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4308.vcf
tabix -h /proj/cdjones_lab/csoeder/1kGen_variation/ALL.chr14.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz 14:50114444-50115621 |  vcf-subset -c HG00362,HG01334,HG00320 >> /netscr/csoeder/1kGen/VCFpath_meh/NonExpressers_4308.vcf
echo -e chr14'	'50114444'	'50115621 > test.bed
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00362/HG00362_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG00362.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG00362.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00362/HG00362_DNA_alignment.sort.bam 14:50114444-50115621 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG00362.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG00362.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG01334/HG01334_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG01334.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG01334.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG01334/HG01334_DNA_alignment.sort.bam 14:50114444-50115621  > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG01334.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG01334.bam 
samtools view -bh /netscr/csoeder/1kGen/individuals/HG00320/HG00320_mapsplice_alignment.sort.bam chr14:50114444-50115621 | bedtools intersect -split -a - -b test.bed > /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG00320.bam 
samtools index /netscr/csoeder/1kGen/RNApath_meh/NonExpressers_4308_HG00320.bam 
samtools view -bh /lustre/scr/c/s/csoeder/DNA-Seq/alignments//HG00320/HG00320_DNA_alignment.sort.bam 14:50114444-50115621 > /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG00320.bam 
samtools index /netscr/csoeder/1kGen/DNApath_meh/NonExpressers_4308_HG00320.bam 
