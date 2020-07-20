configfile: 'config.yaml'
#	module load trinity bedtools samtools blat sratoolkit/2.9.6 python/3.6.6 bowtie2 fastx_toolkit ##bedops r/3.6.0 rstudio/1.1.453 bowtie sratoolkit subread blast
#	module load blast
#	module unload perl
#
#rstudio/1.2.1335 

#from itertools import combinations

sample_by_name = {c['name'] : c for c in config['data_sets']}
ref_genome_by_name = { g['name'] : g for g in config['reference_genomes']}
annotation_by_name = { a['name'] : a for a in config['annotations']}


annotation_by_operation = {}
for anne in annotation_by_name:
	gen = annotation_by_name[anne]['genome']
	if gen not in annotation_by_operation.keys():
		annotation_by_operation[gen] = {}
	for op in annotation_by_name[anne]["operations"]:
		if op in annotation_by_operation[gen].keys():
			annotation_by_operation[gen][op].append(anne)
		else:
			annotation_by_operation[gen][op] = [anne]


sra_by_name = {}
sra_by_path = {}

for s in sample_by_name.keys():
	if "SRA" in sample_by_name[s].keys():
		sra_by_name[s] = sample_by_name[s]["SRA"]
		sra_by_path[sample_by_name[s]["path"]] = sample_by_name[s]["SRA"]

sampname_by_group = {}
for s in sample_by_name.keys():
	subgroup_lst = sample_by_name[s]['subgroups']
	for g in subgroup_lst:
		if g in sampname_by_group.keys():
			sampname_by_group[g].append(s)
		else:
			sampname_by_group[g] = [s]


def return_filename_by_sampname(sampname):
	filenames = []
	if sample_by_name[sampname]['paired']:
		filenames.append(sample_by_name[sampname]['readsfile1'])
		filenames.append(sample_by_name[sampname]['readsfile2'])
	else:
		filenames.append(sample_by_name[sampname]['readsfile'])
	return filenames


def return_file_relpath_by_sampname(wildcards):
	sampname = wildcards.samplename
	pathprefix = sample_by_name[sampname]["path"]
	filesin = return_filename_by_sampname(sampname)
	pathsout = ["".join([pathprefix, fq]) for fq in filesin]
	return pathsout




rule all:
	input: 
		pdf_out="results/1kGenHumanDenovoProjectOfDoom.pdf",
	params:
		runmem_gb=1,
		runtime="0:01:00",
		cores=1,
	run:
		shell(""" mkdir -p results/figures/; touch results/figures/null.png; for fig in results/figures/*png; do mv $fig $(echo $fig| rev | cut -f 2- -d . | rev ).$(date +%d_%b_%Y).png; done;  rm results/figures/null.*.png; """)
		shell(""" mkdir -p results/figures/supp/ ; touch results/figures/supp/null.png; for fig in results/figures/supp/*png; do mv $fig $(echo $fig| rev | cut -f 2- -d . | rev ).$(date +%d_%b_%Y).png; done; rm results/figures/supp/null.*.png; """)

		shell(""" mkdir -p results/tables/ ; touch results/tables/null.tmp ; for phial in $(ls -p results/tables/ | grep -v /); do pre=$(echo $phial | rev | cut -f 2- -d . | rev ); suff=$(echo $phial | rev | cut -f 1 -d . | rev ); mv results/tables/$phial results/tables/$pre.$(date +%d_%b_%Y).$suff; done ; rm results/tables/null.*.tmp; """)
		shell(""" mkdir -p results/tables/supp/ ; touch results/tables/supp/null.tmp ; for phial in $(ls -p results/tables/supp/ | grep -v /); do pre=$(echo $phial | rev | cut -f 2- -d . | rev ); suff=$(echo $phial | rev | cut -f 1 -d . | rev ); mv results/tables/supp/$phial results/tables/supp/$pre.$(date +%d_%b_%Y).$suff; done ; rm results/tables/supp/null.*.tmp; """)

		shell(""" mv results/1kGenHumanDenovoProjectOfDoom.pdf results/1kGenHumanDenovoProjectOfDoom.$(date +%d_%b_%Y).pdf """)
		shell(""" tar cf results.$(date +%d_%b_%Y).tar results/ """)




		

##########################	SUMMARIZE INPUT DATA 	###########################

rule reference_genome_reporter:
	input:
		fai_in = lambda wildcards: ref_genome_by_name[wildcards.ref_gen]['fai'],
	output:
		report_out = "summaries/reference_genomes/{ref_gen}.fai.report"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	shell:
		"""
		mkdir -p summaries/reference_genomes/
		cat {input.fai_in} | awk '{{sum+=$2}} END {{ print "number_contigs\t",NR; print "number_bases\t",sum}}' | sed -e 's/^/{wildcards.ref_gen}\t/g' > {output.report_out};
		"""

rule summon_reference_genome_summary:
	input:
		refgen_reports = lambda wildcards: expand("summaries/reference_genomes/{ref_gen}.fai.report", ref_gen=ref_genome_by_name.keys())
	output:
		refgen_summary = "summaries/reference_genomes.summary"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	shell:
		"cat {input.refgen_reports} > {output.refgen_summary}"


rule annotation_reporter:
	input:
		annot = lambda wildcards: annotation_by_name[wildcards.annot_name]["bed_path"]
	output:
		report_out = "summaries/annotations/{annot_name}.stats"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	run:
		shell(""" mkdir -p summaries/annotations/ """)
		shell(""" rm -f {output.report_out} """)
		shell(""" cat {input.annot} | cut -f 1 | grep -v "chr2110000222\|chrmitochondrion\|Un\|rand\|chrrDNA" | sort | uniq -c | tr -s " " | tr " " "\t" | awk '{{print"count\t"$2"\t"$1}}' >> {output.report_out} """)
		shell(""" cat {input.annot} | wc -l | awk '{{print"count\ttotal\t"$0}}' >> {output.report_out} """)
		shell(""" cat {input.annot} | awk '{{print$3-$2;}}' | awk '{{sum+=$1; sumsq+=$1*$1}} END {{ print "size\ttotal\t",sum; print "size\tavg\t",sum/NR; print "size\tstd\t",sqrt(sumsq/NR - (sum/NR)**2)}}'  >> {output.report_out} """)


rule summon_annotation_summaries:
	input:
		refgen_reports = lambda wildcards: expand("summaries/annotations/{ref_ann}.stats", ref_ann= [a["name"] for a in config['annotations']  ] ) # annotation_by_name.keys())
	output:
		refann_summary = "summaries/reference_annotations.summary"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	run:
		print([a["name"] for a in config['annotations'] ])
		shell(""" rm -f {output.refann_summary} """)
		for anne in [a["name"] for a in config['annotations']  ]:
			shell(""" cat summaries/annotations/{anne}.stats | awk '{{print"{anne}\t"$0}}' >> {output.refann_summary}""")


##########################	GATHER SEQUENCED READS 	###########################

rule summon_reads_SRA:
	output: 
		reads1='FASTQ/{path}/{prefix}_1.fastq',
		reads2='FASTQ/{path}/{prefix}_2.fastq',
	params:
		runmem_gb=8,
		runtime="3:00:00",
		cores=1,
	run:
		try:
			sra = sra_by_path[ "FASTQ/%s/" % tuple([wildcards.path]) ]
			shell(""" mkdir -p FASTQ/{wildcards.path}/ """)
#			shell("""
#				fasterq-dump --progress --split-3 --outdir FASTQ/{wildcards.path}/ --outfile {wildcards.prefix} {sra}
#			""")
			shell("""
				fastq-dump --defline-seq '@$sn[_$rn]/$ri' --outdir FASTQ/{wildcards.path}/ --split-3 {sra} 
			""")
		except KeyError:
			raise KeyError("Sample is listed as empirical but no reads found and no SRA to download!" )

rule fastp_clean_sample_pe:
	input:
		fileIn = lambda wildcards: return_file_relpath_by_sampname(wildcards)
	output:
		fileOut = ["{pathprefix}/{samplename}.clean.R1.fastq","{pathprefix}/{samplename}.clean.R2.fastq"],
		jason = "{pathprefix}/{samplename}.json"
	params:
		runmem_gb=8,
		runtime="6:00:00",
		cores=1,
		#--trim_front1 and -t, --trim_tail1
		#--trim_front2 and -T, --trim_tail2. 
		common_params = "--json {pathprefix}/{samplename}.json",# --html meta/FASTP/{samplename}.html", 
		pe_params = "--detect_adapter_for_pe --correction",
	message:
		"FASTP QA/QC on paired-ended reads ({wildcards.samplename}) in progress.... "
	shell:
		"/nas/longleaf/home/csoeder/modules/fastp/fastp {params.common_params} {params.pe_params} --in1 {input.fileIn[0]} --out1 {output.fileOut[0]} --in2 {input.fileIn[1]} --out2 {output.fileOut[1]}"



rule FASTP_summarizer:
	input: 
		jason = lambda wildcards: expand("{path}{samp}.json", path=sample_by_name[wildcards.samplename]['path'], samp = wildcards.samplename, )
	output:
		jason_pruned = "summaries/FASTP/{samplename}.json.pruned"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	message:
		"Summarizing reads for sample ({wildcards.samplename}) .... "	
	shell:
		"""
		cp {input.jason} summaries/FASTP/{wildcards.samplename}.json
		python3 scripts/fastp_reporter.py {input.jason} {output.jason_pruned} -t {wildcards.samplename}
		"""

rule summon_FASTQ_analytics:	#forces a FASTP clean
	input:
		jasons_in = expand("summaries/FASTP/{samplename}.json.pruned", samplename=sampname_by_group['all'])
	output:
		summary = "summaries/sequenced_reads.dat"
	params:
		runmem_gb=1,
		runtime="1:00",
		cores=1,
	message:
		"Collecting read summaries for all samples ...."
	shell:
		"cat {input.jasons_in} > {output.summary}"

##########################	READ MAPPING 	###########################

rule mapsplice_builder:
	output:
		windowed='utils/scripts/MapSplice-v2.1.8/mapsplice.py.bak'
	params:
		runmem_gb=8,
		runtime="30:00",
		cores=1,
	run:
		shell("mkdir -p utils/scripts")
		shell(
			""" 
			cd utils/scripts;
			wget http://protocols.netlab.uky.edu/~zeng/MapSplice-v2.1.8.zip ;
			unzip MapSplice-v2.1.8.zip;
			2to3 -w MapSplice-v2.1.8/;
			cd MapSplice-v2.1.8/;
			make;
			cd ..;
			rm MapSplice-v2.1.8.zip;
			"""
		)

rule mapsplice2_align_raw:
	input:
		mapsplice = "utils/scripts/MapSplice-v2.1.8/mapsplice.py.bak",
		reads_in = lambda wildcards: expand("{path}{sample}.clean.R{pair}.fastq", path=sample_by_name[wildcards.sample]['path'], sample=wildcards.sample, pair = [1,2]),
	output:
		raw_bam = "mapped_reads/mapspliceRaw/{sample}/{sample}.vs_{ref_genome}.mapspliceRaw.sort.bam",
	params:
		runmem_gb=16,
		runtime="72:00:00",
		cores=8,
	message:
		"aligning reads from {wildcards.sample} to reference_genome {wildcards.ref_genome} using MapSplice2 .... "
	run:
		ref_genome_split = ref_genome_by_name[wildcards.ref_genome]['split'],
		ref_genome_bwt = ref_genome_by_name[wildcards.ref_genome]['bowtie'],
		shell(""" mkdir -p mapped_reads/mapspliceRaw/{wildcards.sample}/ summaries/BAMs/""")
		shell(""" 
			python utils/scripts/MapSplice-v2.1.8/mapsplice.py -p {params.cores} -c {ref_genome_split} -x {ref_genome_bwt} -1 {input.reads_in[0]} -2 {input.reads_in[1]} -o mapped_reads/mapspliceRaw/{wildcards.sample} 
			""")
		shell(""" 
			samtools view -Sbh mapped_reads/mapspliceRaw/{wildcards.sample}/alignments.sam | samtools sort - > mapped_reads/mapspliceRaw/{wildcards.sample}/{wildcards.sample}.vs_{wildcards.ref_genome}.mapspliceRaw.sort.bam;
			samtools index {output.raw_bam};
			rm mapped_reads/mapspliceRaw/{wildcards.sample}/alignments.sam;
			""")

rule mapsplice2_align_multi:
	input:
		raw_bam = "mapped_reads/mapspliceRaw/{sample}/{sample}.vs_{ref_genome}.mapspliceRaw.sort.bam",
	output:
		multi_bam = "mapped_reads/mapspliceMulti/{sample}/{sample}.vs_{ref_genome}.mapspliceMulti.sort.bam",
#		bam_out = "mapped_reads/mapsplice/{sample}/{sample}.vs_{ref_genome}.mapsplice.sort.bam",
#		splutflg = "utils/mapsplut.{sample}.vs_{ref_genome}.flg"
	params:
		runmem_gb=36,
		runtime="6:00:00",
		cores=8,
		dup_flg = "-rS ",#remove marked duplicates; remove secondary alignments of marked duplicates
		quality="-q 20 -F 0x0200 -F 0x04 -f 0x0002", # no QC fails, no duplicates, proper pairs only, mapping qual >20
	message:
		"filtering raw MapSplice2 alignment of {wildcards.sample} to {wildcards.ref_genome} for quality, duplication.... "
	run:
		shell(""" mkdir -p mapped_reads/mapspliceMulti/{wildcards.sample}/ summaries/BAMs/""")
		shell(""" 
			samtools sort -n {input.raw_bam} | samtools fixmate -m - - | samtools sort - | samtools markdup {params.dup_flg} - - | samtools view -bh {params.quality} > {output.multi_bam} ;
			samtools index {output.multi_bam} 
			""")

rule mapsplice2_align_uniq:
	input:
		multi_bam = "mapped_reads/mapspliceMulti/{sample}/{sample}.vs_{ref_genome}.mapspliceMulti.sort.bam",
	output:
		uniq_bam = "mapped_reads/mapspliceUniq/{sample}/{sample}.vs_{ref_genome}.mapspliceUniq.sort.bam",
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
	message:
		"filtering MapSplice2 alignment of {wildcards.sample} to {wildcards.ref_genome} to remove multimappers entirely.... "
	run:
		shell(""" mkdir -p mapped_reads/mapspliceUniq/{wildcards.sample}/ summaries/BAMs/""")
		shell(""" 
			samtools view {input.multi_bam} | grep -w "IH:i:1" | cat <( samtools view -H {input.multi_bam} ) - | samtools view -Sbh > {output.uniq_bam};
			samtools index {output.uniq_bam}
			""")
### filtering on uniqueness: MapSplice2 uses the IH:i:1 flag in the SAM specs. 

rule mapsplice2_align_rando:
	input:
		multi_bam = "mapped_reads/mapspliceMulti/{sample}/{sample}.vs_{ref_genome}.mapspliceMulti.sort.bam",
		uniq_bam = "mapped_reads/mapspliceUniq/{sample}/{sample}.vs_{ref_genome}.mapspliceUniq.sort.bam",
	output:
		rando_bam = "mapped_reads/mapspliceRando/{sample}/{sample}.vs_{ref_genome}.mapspliceRando.sort.bam",
	params:
		runmem_gb=16,
		runtime="64:00:00",
		cores=8,
	message:
		"Downsampling multimappers from MapSplice2 alignment of {wildcards.sample} to {wildcards.ref_genome}..."
	run:
		shell(""" mkdir -p mapped_reads/mapspliceRando/{wildcards.sample}/ summaries/BAMs/""")
		shell(""" 

			samtools sort -n {input.multi_bam} | samtools view | grep -v "IH:i:[01]" > {output.rando_bam}.multi.unsampled

			rm -f {output.rando_bam}.multi.sampled
			for idx in $(cut -f 1 {output.rando_bam}.multi.unsampled | sort | uniq); do 
				grep -w $idx {output.rando_bam}.multi.unsampled | sort  --random-sort | head -n 1 >> {output.rando_bam}.multi.sampled
			done;

			cat <( samtools view -h {input.uniq_bam} ) {output.rando_bam}.multi.sampled | samtools view -Sbh | samtools sort - > {output.rando_bam};
			samtools index {output.rando_bam}
			rm {output.rando_bam}.multi.unsampled {output.rando_bam}.multi.sampled
			""")

rule spliced_alignment_reporter:
	input:
		bam_in = "mapped_reads/{aligner}/{sample}/{sample}.vs_{ref_genome}.{aligner}.sort.bam",
	output:
		report_out = "summaries/BAMs/{sample}.vs_{ref_genome}.{aligner}.summary",
		bed_out = "mapped_reads/{aligner}/{sample}/{sample}.vs_{ref_genome}.{aligner}.reads.bed",
	params:
		runmem_gb=32,
		runtime="16:00:00",
		cores=1,
	message:
		"Collecting metadata for the {wildcards.aligner} alignment of {wildcards.sample} to {wildcards.ref_genome}.... "
	run:
 		ref_genome_idx=ref_genome_by_name[wildcards.ref_genome]['fai']
 		shell(""" which samtools """)
 		shell("samtools idxstats {input.bam_in} > {input.bam_in}.idxstats")
		shell("samtools flagstat {input.bam_in} > {input.bam_in}.flagstat")
		shell("bedtools genomecov -max 1 -i <( bedtools bamtobed -i {input.bam_in} | cut -f 1-3 ) -g {ref_genome_idx} > {input.bam_in}.span.genomcov")
		shell("bedtools genomecov -max 1 -i <( bedtools bamtobed -split -i {input.bam_in} | cut -f 1-3 ) -g {ref_genome_idx} > {input.bam_in}.split.genomcov")
# 		#change the -max flag as needed to set 
		shell(""" samtools depth -a {input.bam_in} | awk '{{sum+=$3; sumsq+=$3*$3}} END {{ print "average_depth\t",sum/NR; print "std_depth\t",sqrt(sumsq/NR - (sum/NR)**2)}}' > {input.bam_in}.dpthStats """)
# 		#https://www.biostars.org/p/5165/
# 		#save the depth file and offload the statistics to the bam_summarizer script?? 
		### filtering on uniqueness: MapSplice2 uses the IH:i:1 flag in the SAM specs. 
		shell("""samtools view -F 4 {input.bam_in} | cut -f 13  | cut -f 3 -d ":" | sort | uniq -c | tr -s " " | awk -F " " '{{print$2"\t"$1}}' > {input.bam_in}.mapmult""")
		shell(""" samtools view -F 0x4 {input.bam_in} | cut -f 1 | sort | uniq | wc -l > {input.bam_in}.maptCount """)
		shell(""" samtools sort -n {input.bam_in} | samtools fixmate -m - -  | samtools sort - | samtools markdup -sS - - 1> /dev/null 2> {input.bam_in}.dupe """)# /dev/null 2> {input.bam_in}.dupe;""")
		shell("python3 scripts/bam_summarizer.mapspliced.py -f {input.bam_in}.flagstat --mapped_count {input.bam_in}.maptCount -i {input.bam_in}.idxstats -g {input.bam_in}.split.genomcov -G {input.bam_in}.span.genomcov -d {input.bam_in}.dpthStats -D {input.bam_in}.dupe -m {input.bam_in}.mapmult -o {output.report_out} -t {wildcards.sample}")
		shell(""" bedtools bamtobed -bed12 -i {input.bam_in} > {output.bed_out}""")

#bedtools genomecov -bga -split -ibam mapped_reads/mapspliceMulti/HG00096/HG00096.vs_hg38.mapspliceMulti.sort.bam -g /proj/cdjones_lab/Genomics_Data_Commons/genomes/homo_sapiens/hg38/hg38.fa.fai > mapped_reads/mapspliceMulti/HG00096/HG00096.vs_hg38.mapspliceMulti.cov.bedgraph


rule summon_BAM_analytics:
	input:
		bam_reports = lambda wildcards: expand("summaries/BAMs/{sample}.vs_{ref_genome}.{aligner}.summary", sample=sampname_by_group['1kGen'], ref_genome=wildcards.ref_genome, aligner=wildcards.aligner)
	output:
		full_report = "summaries/alignments.vs_{ref_genome}.{aligner}.summary"
	params:
		runmem_gb=1,
		runtime="1:00",
		cores=1,
	message:
		"collecting all {wildcards.aligner} alignment metadata.... "
	shell:
		"""cat {input.bam_reports} | awk '{{print "{wildcards.ref_genome}\t{wildcards.aligner}\t"$0}}'> {output.full_report}"""

###################################################################################
##########################	TRANSCRIPTOME ASSEMBLY 	###########################
###################################################################################
# trinity...... HALP!!!
rule trinityHALP:
	input:
		reads_in = lambda wildcards: expand("{path}{sample}.clean.R{pair}.fastq", path=sample_by_name[wildcards.sample]['path'], sample=wildcards.sample, pair = [1,2]),
	output:
		transcriptome_out = "assembled_transcripts/{sample}/trinity/{sample}.trinity.fasta",
	params:
		runmem_gb=64,
		runtime="56:00:00",
		cores=8,
		trin_params=" --seqType fq ",
	message:
		"Trinity is assembling {wildcards.sample} .... "
	run:
		shell(""" mkdir -p assembled_transcripts/{wildcards.sample}/trinity/ """)
		r1=input.reads_in[0]
		r2=input.reads_in[1]
		trin_params = params.trin_params
		try:
			if sample_by_name[wildcards.sample]["stranded"]:
				trin_params = " %s %s " %tuple([trin_params, " --SS_lib_type RF "])
				#https://github.com/trinityrnaseq/trinityrnaseq/wiki/Running-Trinity#strand_specific_assembly
		except KeyError:
			pass
		shell(""" 
			Trinity {trin_params}  --max_memory 50G --left {r1}  --right {r2} --include_supertranscripts --output assembled_transcripts/{wildcards.sample}/trinity/
			""")
		shell(""" 
			mv assembled_transcripts/{wildcards.sample}/trinity/Trinity.fasta {output.transcriptome_out};
			samtools faidx {output.transcriptome_out};
		 """)

rule trinity_reporter:
	input:
		transcriptome_in = "assembled_transcripts/{sample}/trinity/{sample}.trinity.fasta",
	output:
		report_out = "summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.stat",
		remap = "assembled_transcripts/{sample}/trinity/{sample}.backMap.bowtie2.sort.bam",
		cov_hist = "summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.cov.hist",
		genom_cov = "assembled_transcripts/{sample}/trinity/{sample}.backMap.bowtie2.genomeCov",
	params:
		runmem_gb=16,
		runtime="12:00:00",
		cores=8,
	message:
		"gathering statistics on {wildcards.sample} transcriptome assembly .... "
	run:
		#n50: https://github.com/trinityrnaseq/trinityrnaseq/wiki/Transcriptome-Contig-Nx-and-ExN50-stats
		shell(""" mkdir -p summaries/assembled_transcripts/trinity/{wildcards.sample}/ """)
		shell("""
			bass=$(which Trinity | rev | cut -f 2- -d "/" | rev);
			perl $bass/util/TrinityStats.pl {input.transcriptome_in} > {input.transcriptome_in}.stat;
			paste <(echo -e "\ntotal_genes\ntotal_transcripts\npercent_GC\n\nfull_N10\nfull_N20\nfull_N30\nfull_N40\nfull_N50\nfull_med_len\nfull_avg_len\nfull_total_bp_ass\nlongest_N10\nlongest_N20\nlongest_N30\nlongest_N40\nlongest_N50\nlongest_med_len\nlongest_avg_len\nlongest_total_bp_ass") <( cat {input.transcriptome_in}.stat | grep -v "#" | tr -s "\n" | rev | cut -f 1 -d ":" | cut -f 1 -d " " | cut -f 1 | rev )  | grep "_" > {output.report_out};
		""")

		#read coverage: https://github.com/trinityrnaseq/trinityrnaseq/wiki/RNA-Seq-Read-Representation-by-Trinity-Assembly
		shell(""" mkdir -p assembled_transcripts/{wildcards.sample}/trinity/bowtie2/ """)
		shell(""" bowtie2-build assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.fasta assembled_transcripts/{wildcards.sample}/trinity/bowtie2/trinity.{wildcards.sample} """)
		readpath=sample_by_name[wildcards.sample]['path']
		shell(""" bowtie2 -p 10 -q --no-unal -k 20 -x assembled_transcripts/{wildcards.sample}/trinity/bowtie2/trinity.{wildcards.sample} -1 {readpath}{wildcards.sample}.clean.R1.fastq -2 {readpath}{wildcards.sample}.clean.R2.fastq 2> assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt| samtools view -Sb | samtools sort -o assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.backMap.bowtie2.sort.bam """)
		shell(""" paste <(echo -e "aligned_discord\naligned_concord_uniq\naligned_concord_multi") <(cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt | sed -n '3,5p' | cut -f 2 -d '(' | cut -f 1 -d '%' ) >> {output.report_out} """)
		shell(""" paste <(echo -e "total_aligned") <(cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt | grep overall | cut -f 1 -d '%' ) >> {output.report_out} """)

		shell(""" bedtools genomecov -max 1 -ibam assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.backMap.bowtie2.sort.bam > {output.genom_cov} """ )
#		cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.backMap.bowtie2.genomeCov | grep -w "genome" | awk '{{if($2==0)print "uncovered_fraction\t"$5;}}' >> {output.report_out}
		#https://stackoverflow.com/questions/39614454/creating-histograms-in-bash
		shell("""cat {output.genom_cov} | grep -v -w genome | awk '{{if($2==1)print;}}' | cut -f 5  | awk -f utils/scripts/hist.awk -v bin_width=0.01 | sort -g -k 1 | awk '{{print"{wildcards.sample}\t"$0}}' > {output.cov_hist} """) 



rule summon_trinity_analytics:
	input:
		bam_reports = lambda wildcards: expand("summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.stat", sample=list(set(sampname_by_group['1kGen']).union(sampname_by_group['NHPRTR']))),
		cov_hists = lambda wildcards: expand("summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.cov.hist", sample=list(set(sampname_by_group['1kGen']).union(sampname_by_group['NHPRTR']))),
#		bam_reports = lambda wildcards: expand("summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.stat", sample=sampname_by_group['1kGen']),
#		cov_hists = lambda wildcards: expand("summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.cov.hist", sample=sampname_by_group['1kGen']),
	output:
		full_report = "summaries/assembled_transcripts/trinity_assemblies.summary",
		full_cov_hist = "summaries/assembled_transcripts/trinity_assemblies.coverage.hist",
	params:
		runmem_gb=1,
		runtime="1:00",
		cores=1,
	message:
		"collecting all alignment metadata.... "
	run:
		shell(""" rm -f {output.full_report} {output.full_cov_hist} """)
		for sample in sampname_by_group['1kGen']:
			shell("""cat summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.stat | awk '{{print "1kGen\t{sample}\t"$0}}' >> {output.full_report}""")
		for sample in sampname_by_group['NHPRTR']:
			shell("""cat summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.stat | awk '{{print "NHPRTR\t{sample}\t"$0}}' >> {output.full_report}""")

		shell("""cat {input.cov_hists} > {output.full_cov_hist} """)
### note the category of transcript!!

rule trinityBlatterUp:
	input:
		transcriptome_in = "assembled_transcripts/{sample}/trinity/{sample}.trinity.fasta",
	output:
		raw_transcriptome_blat = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.blat.mapt.psl",
		filtered_transcriptome_blat = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.blat.mapt.filt.psl",
		transcriptome_bed = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.blat.mapt.filt.bed",
		mappable_seqs = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.blat.mapt.fa",
		filtered_mappable_seqs = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.blat.mapt.filt.fa",
	params:
		runmem_gb=16,
		runtime="24:00:00",
		cores=8,
		match_thresh = 75,#75 bases must match
		match_frac = 0.75,#75% of query must align
	message:
		"blatting transcripts from {wildcards.sample} against reference_genome {wildcards.ref_gen} .... "
	run:
		ref_gen = ref_genome_by_name[wildcards.ref_gen]["path"]
		shell(""" blat -noHead {ref_gen} {input.transcriptome_in} assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.vs_{wildcards.ref_gen}.blat.mapt.psl; """)
		shell(""" cat {output.raw_transcriptome_blat}| awk '{{if(($1)>{params.match_thresh})print;}}' | awk '{{if(($13-$12)/$11>{params.match_frac})print;}}' | grep -v "random\|alt\|Un"  >> {output.filtered_transcriptome_blat} """)
		shell(""" ~/modules/UCSC_utils/pslToBed {output.filtered_transcriptome_blat} {output.transcriptome_bed} """)
		shell(""" cat {input.transcriptome_in} | fasta_formatter -t | grep -wFf <( cat {output.raw_transcriptome_blat} | cut -f 10 | sort | uniq ) | awk '{{print">"$0}}' | tr "\t" "\n" > {output.mappable_seqs}; """)
		shell(""" cat {input.transcriptome_in} | fasta_formatter -t | grep -wFf <( cat {output.filtered_transcriptome_blat} | cut -f 10 | sort | uniq ) | awk '{{print">"$0}}' | tr "\t" "\n" > {output.filtered_mappable_seqs}; """)

###################################################################################
##########################	TRANSCRIPTOME FILTRATION 	###########################
###################################################################################

rule find_direct_ILS_anomalies:
	input:
		transcriptome_bed = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.{aligner}.mapt.filt.bed",
	output:
		transcriptome_ilsanom = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.{aligner}.mapt.noForbiddenAnnot.bed",
		ilsanom_fa = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.{aligner}.mapt.noForbiddenAnnot.fa",
		ilsanom_psl = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_gen}.{aligner}.mapt.noForbiddenAnnot.psl",
		forbidden_roster =  "summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.vs_{ref_gen}.{aligner}.mapt.forbidden.roster",
	params:
		runmem_gb=16,
		runtime="8:00:00",
		cores=8,
		intersect_params = " -split ",
		weirdos = "random\|alt\|Un\|fix",
		slop_thresh =75,
	message:
		"excluding aligned  {wildcards.sample} transcripts from annotated genes, etc .... "
	run:
		shell(""" mkdir -p assembled_transcripts/{wildcards.sample}/trinity/intersects/ """)
		shell(""" rm -f {output} """)
		#exclude_list
		excld = annotation_by_operation["hg38"]["exclude"]#["GENCODE32", "NCBIrefSeq", "cmplxRepeat", "retro9", "yalePseudo"]
		listList = " "
		fai = ref_genome_by_name[wildcards.ref_gen]["fai"]
		for ex in excld:
			path2gtf = annotation_by_name[ex]["gtf_path"]
			nuList = "%s%s%s%s%s" % tuple(["assembled_transcripts/", wildcards.sample ,"/trinity/intersects/",ex,".list"])  
			shell(""" bedtools intersect {params.intersect_params} -a {input.transcriptome_bed} -b <( cat {path2gtf} | grep -v "{params.weirdos}" | bedtools slop -b {params.slop_thresh} -i - -g {fai}  ) | cut -f 4 | sort | uniq > assembled_transcripts/{wildcards.sample}/trinity/intersects/{ex}.list """)
			shell(""" cat {nuList} | wc -l | awk '{{print "{ex}\t"$1}}' >> {output.forbidden_roster} """)
			listList = "%s %s "%tuple([ listList, nuList])

		shell(""" grep -v -wFf <( cat {listList} | sort | uniq ) {input.transcriptome_bed} > {output.transcriptome_ilsanom} """)
		shell(""" grep -v -wFf <( cat {listList} | sort | uniq ) assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.vs_{wildcards.ref_gen}.blat.mapt.filt.psl > {output.ilsanom_psl} """)
		shell(""" cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.fasta | cut -f 1 -d " " |  fasta_formatter -t  | grep -wFf <( cat {output.transcriptome_ilsanom} | cut -f 4 | sort | uniq ) | awk '{{print ">"$1;print $2}}' > {output.ilsanom_fa} """)




rule merge_ILS:
	output:
		merged_forbidden = "utils/NotAPlaceOfHonor/hg38.forbiddenAnnotations.bed",
		merged_forbidden_stats = "summaries/annotations/hg38.forbiddenAnnotations.stats",
	params:
		runmem_gb=16,
		runtime="8:00:00",
		cores=8,
		weirdos = "random\|alt\|Un\|fix",
	message:
		"merging the forbidden annotations .... "
	run:
		shell(""" mkdir -p utils/NotAPlaceOfHonor/ """)
		#exclude_list
		excld = annotation_by_operation["hg38"]["exclude"]#["GENCODE32", "NCBIrefSeq", "cmplxRepeat", "retro9", "yalePseudo"]
		lust = " "
		excld_str = " "
		for ex in excld:
			path2gtf = annotation_by_name[ex]["gtf_path"]
			lust = "%s %s "%tuple([ lust, path2gtf])
			excld_str = "%s %s "%tuple([ excld_str, ex])
	
		shell(""" cat {lust} | bedtools bed12tobed6 -i - | grep exon | sort -k 1,1 -k2,2n | bedtools merge -i - > {output.merged_forbidden}.tmp """)
		shell(""" bedtools annotate -both -names {excld_str} -i utils/NotAPlaceOfHonor/vs_hg38.mapspliceRaw.forbiddenAccumulation.populationWide.bed -files {lust} > {output.merged_forbidden} """)
		shell(""" rm {output.merged_forbidden}.tmp """)

		shell(""" cat {output.merged_forbidden} | wc -l | awk '{{print "total_intervals\t"$1}}' > {output.merged_forbidden_stats} """)
		shell(""" cat {output.merged_forbidden} | grep -v {params.weirdos} | wc -l | awk '{{print "mainstream_intervals\t"$1}}' >> {output.merged_forbidden_stats} """)
		shell(""" cat {output.merged_forbidden} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "total_length\t"$1}}' >> {output.merged_forbidden_stats} """)
		shell(""" cat {output.merged_forbidden} | grep -v {params.weirdos} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "mainstream_length\t"$1}}' >> {output.merged_forbidden_stats} """)

		fai = ref_genome_by_name["hg38"]["fai"]
		shell(""" cat {output.merged_forbidden} | bedtools genomecov -max 1 -i - -g <(cat {fai} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "total_coverage\t"$5;}}' >> {output.merged_forbidden_stats} """)
		shell(""" cat {output.merged_forbidden} | bedtools genomecov -max 1 -i - -g <(cat {fai} | grep -v {params.weirdos} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "mainstream_coverage\t"$5;}}' >> {output.merged_forbidden_stats} """)



rule transcriptome_accumulator:
	input:
		mapped_reads = "mapped_reads/{aligner}/{sample}/{sample}.vs_hg38.{aligner}.sort.bam",
	output:
		forbidden_accumulation = "mapped_reads/{aligner}/{sample}/forbidden_accumulations/{sample}.vs_hg38.{aligner}.forbiddenAccumulation.bed",
	params:
		runmem_gb=72,
		runtime="96:00:00",
		cores=8,
		merge_thresh = 100,#threshold to merge intervals
	message:
		"accumulating {wildcards.aligner}-aligned {wildcards.sample} reads , finding individual forbidden accumulation .... "
	run:
		ref_genome_idx = ref_genome_by_name["hg38"]["fai"]
		#collapse into intervals
		print("collapsing into intervals....")
		shell(""" bedtools bamtobed -bed12 -i {input.mapped_reads} | bedtools bed12tobed6 -i  | bedtools slop -i - -g {ref_genome_idx} -b {params.merge_thresh} | sort -k 1,1 -k2,2n | bedtools merge -i -  | nl | tr -s " "| cut -f 2 -d " " | awk '{{print $2"\t"$3"\t"$4"\tinterval_"$1}}' > mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprints.bed """) 
		print("collapsing into intervals.... DONE!")
		#collect mated reads
		#keep weirdass contigs?
		print("collecting mate pairs....")
		shell(""" samtools view -bh -f 3 {input.mapped_reads} | samtools sort -n - | bedtools bamtobed -bed12 -i -  > mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.mates.bed """ )
		print("collecting mate pairs.... DONE!")

		print("associating reads with intervals....")
		shell("""bedtools intersect -split -wa -wb -a mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.mates.bed -b mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprints.bed | cut -f 4,16 | sed -e 's/\/[12]//g' | sort | uniq >  mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.list """)
		print("associating reads with intervals.... DONE!")
		print("finding reads with more than one interval assigned....")
		#https://stackoverflow.com/questions/39001743/find-and-print-lines-that-have-duplicate-column-value
#		shell(""" awk 'cnt[$1]++{{if (cnt[$1]==2) print prev[$1]; print}} {{prev[$1]=$0}}' mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.list > mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.informative.list """)
# rev | uniq -d -f 1 | rev  might have been useful?
		shell(""" cat mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.list | rev  | uniq -D -f 1 | rev > mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.informative.list """)
		print("finding reads with more than one interval assigned.... DONE!")
		shell(""" python3 scripts/accumulation_clumper.py --verbosity 2 -b mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprints.bed --unclumped mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.footprint2read.informative.list --bedout mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.accumulation.bed """)
		print("merging intervals with shared reads.... DONE!")

		shell(""" mkdir -p mapped_reads/{wildcards.aligner}/{wildcards.sample}/forbidden_accumulations/ """)
		excld = annotation_by_operation["hg38"]["exclude"]#["GENCODE32", "NCBIrefSeq", "cmplxRepeat", "retro9", "yalePseudo"]
		listList = " "
		for ex in excld:
			path2gtf = annotation_by_name[ex]["gtf_path"]
			nuList = "mapped_reads/%s/%s/forbidden_accumulations/%s.list" % tuple([wildcards.aligner, wildcards.sample ,ex])  
			shell(""" bedtools intersect -split -a mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.accumulation.bed -b {path2gtf} | cut -f 4 | sort | uniq > mapped_reads/{wildcards.aligner}/{wildcards.sample}/forbidden_accumulations/{ex}.list """)
			listList = "%s %s "%tuple([ listList, nuList])
		shell(""" grep -wFf <( cat {listList} | sort | uniq ) mapped_reads/{wildcards.aligner}/{wildcards.sample}/{wildcards.sample}.vs_hg38.{wildcards.aligner}.accumulation.bed > {output.forbidden_accumulation} """)
 #https://stackoverflow.com/questions/39001743/find-and-print-lines-that-have-duplicate-column-value
 #runs in ~45 min

rule accumulation_stats:
	input:
		indiv_forbid = "mapped_reads/{aligner}/{sample}/forbidden_accumulations/{sample}.vs_{ref_genome}.{aligner}.forbiddenAccumulation.bed",
	output:
		indiv_forbid_stats = "summaries/accumulations/{sample}/{sample}.vs_{ref_genome}.{aligner}.forbiddenAccumulation.stats",
	params:
		runmem_gb=8,
		runtime="30:00",
		cores=1,
		weirdos = "random\|alt\|Un\|fix",
	message:
		"collecting stats on the {wildcards.sample} {wildcards.aligner} alignment.... "
	run:
		shell(""" mkdir -p summaries/accumulations/{wildcards.sample}/ """)
		shell(""" cat {input.indiv_forbid} | wc -l | awk '{{print "total_intervals\t"$1}}' > {output.indiv_forbid_stats} """)
		shell(""" cat {input.indiv_forbid} | grep -v {params.weirdos} | wc -l | awk '{{print "mainstream_intervals\t"$1}}' >> {output.indiv_forbid_stats} """)
		shell(""" cat {input.indiv_forbid} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "total_length\t"$1}}' >> {output.indiv_forbid_stats} """)
		shell(""" cat {input.indiv_forbid} | grep -v {params.weirdos} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "mainstream_length\t"$1}}' >> {output.indiv_forbid_stats} """)

		fai = ref_genome_by_name["hg38"]["fai"]
		shell(""" cat {input.indiv_forbid} | bedtools genomecov -max 1 -i - -g <(cat {fai} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "total_coverage\t"$5;}}' >> {output.indiv_forbid_stats} """)
		shell(""" cat {input.indiv_forbid} | bedtools genomecov -max 1 -i - -g <(cat {fai} | grep -v {params.weirdos} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "mainstream_coverage\t"$5;}}' >> {output.indiv_forbid_stats} """)


rule summon_indiv_accum_analytics:
	input:
		accum_stats = lambda wildcards: expand("summaries/accumulations/{sample}/{sample}.vs_hg38.{aligner}.forbiddenAccumulation.stats", sample=sampname_by_group['all'], aligner=["mapspliceRaw", "mapspliceMulti"])
	output:
		all_accum_stats = "summaries/accumulations.summary"
	params:
		runmem_gb=1,
		runtime="1:00",
		cores=1,
	message:
		"collecting all individual accumulation metadata.... "
	run:
		shell(""" rm -f {output.all_accum_stats} """)
		for sample in sampname_by_group['all']:
			for aligner in ["mapspliceRaw"]:
				shell("""cat summaries/accumulations/{sample}/{sample}.vs_hg38.{aligner}.forbiddenAccumulation.stats | awk '{{print "{aligner}\t{sample}\t"$0}}' >> {output.all_accum_stats}""")


rule merge_accumulants:
	input:
		indiv_forbid = lambda wildcards: expand("mapped_reads/{aligner}/{sample}/forbidden_accumulations/{sample}.vs_hg38.{aligner}.forbiddenAccumulation.bed", sample=sampname_by_group['all'], aligner=wildcards.aligner)
	output:
		full_forbid = "utils/NotAPlaceOfHonor/vs_hg38.{aligner}.forbiddenAccumulation.populationWide.bed",
		full_forbidden_stats = "summaries/annotations/vs_hg38.{aligner}.forbiddenAccumulation.populationWide.stats",
	params:
		runmem_gb=16,
		runtime="30:00",
		cores=1,
		merge_thresh = 100,
		weirdos = "random\|alt\|Un\|fix",
	message:
		"merging all individual forbidden accumulations into a population wide consensus.... "
	run:
		shell(""" mkdir -p utils/NotAPlaceOfHonor/ """)
		shell(""" rm -f {output.full_forbid} """)
#		shell(""" cat {input.indiv_forbid} | sort  -k 1,1 -k2,2n  | bedtools merge -d {params.merge_thresh} -i - > {output.full_forbid}.tmp """) 
		shell(""" cat {input.indiv_forbid} | sort  -k 1,1 -k2,2n > {output.full_forbid}.tmp """) # removed the 2nd merge thresh - remember, these intervals have already been slopped by this ammount!

		excld = annotation_by_operation["hg38"]["exclude"]
		lust = " "
		excld_str = " "
		for ex in excld:
			path2gtf = annotation_by_name[ex]["gtf_path"]
			lust = "%s %s "%tuple([ lust, path2gtf])
			excld_str = "%s %s "%tuple([ excld_str, ex])
	

		shell(""" bedtools annotate -both -names {excld_str} -i {output.full_forbid}.tmp -files {lust} > {output.full_forbid} """)
		shell(""" rm {output.full_forbid}.tmp """)

		shell(""" cat {output.full_forbid} | wc -l | awk '{{print "total_intervals\t"$1}}' > {output.full_forbidden_stats} """)
		shell(""" cat {output.full_forbid} | grep -v {params.weirdos} | wc -l | awk '{{print "mainstream_intervals\t"$1}}' >> {output.full_forbidden_stats} """)
		shell(""" cat {output.full_forbid} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "total_length\t"$1}}' >> {output.full_forbidden_stats} """)
		shell(""" cat {output.full_forbid} | grep -v {params.weirdos} | awk -F'\t' 'BEGIN{{SUM=0}}{{ SUM+=$3-$2 }}END{{print SUM}}'  | awk '{{print "mainstream_length\t"$1}}' >> {output.full_forbidden_stats} """)

		fai = ref_genome_by_name["hg38"]["fai"]
		shell(""" cat {output.full_forbid} | bedtools genomecov -max 1 -i - -g <(cat {fai} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "total_coverage\t"$5;}}' >> {output.full_forbidden_stats} """)
		shell(""" cat {output.full_forbid} | bedtools genomecov -max 1 -i - -g <(cat {fai} | grep -v {params.weirdos} | cut -f 1,2 ) | grep -w "genome" | awk '{{if($2==1)print "mainstream_coverage\t"$5;}}' >> {output.full_forbidden_stats} """)



# rule exclude_forbidden_accumulations:
# 	input:
# 		anom_transcripts = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.bed",
# 		anom_seqs = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.fa",
# 		anom_psl = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.psl",
# 		transcriptome_accumulation = "utils/NotAPlaceOfHonor/vs_{ref_genome}.{read_aligner}.forbiddenAccumulation.populationWide.bed",
# 	output:
# #		no_forbidden_accum_bed = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.bed",
# 		no_forbidden_accum_psl = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.psl",
# 		no_forbidden_accum_fa = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.fa",

# 	params:
# 		runmem_gb=16,
# 		runtime="8:00:00",
# 		cores=8,
# 	message:
# 		"excluding  {wildcards.sample}'s {wildcards.trans_aligner}-aligned transcripts from population-wide {wildcards.read_aligner}-accumulation .... "
# 	run:
# 		#exclude by transcript and by location ... I think this is redundant
# 		shell(""" bedtools intersect -split -wa -a {input.anom_transcripts} -b {input.transcriptome_accumulation} | cut -f 4 | sort | uniq > assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.vs_{wildcards.ref_genome}.{wildcards.trans_aligner}.mapt.{wildcards.read_aligner}.ILSAnom.list """)
# #		shell(""" cat {input.anom_transcripts} | grep -v -wFf <(cat {listList} | sort | uniq ) | bedtools intersect -v -split -wa -a {input.anom_transcripts} -b {input.transcriptome_accumulation} > {output.no_forbidden_accum} """)
# 		shell(""" grep -v -wFf assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.vs_{wildcards.ref_genome}.{wildcards.trans_aligner}.mapt.{wildcards.read_aligner}.ILSAnom.list {input.anom_psl} > {output.no_forbidden_accum_psl} || true """)
# 		shell(""" cat {input.anom_seqs} | cut -f 1 -d " " |  fasta_formatter -t  | grep -v -wFf assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.vs_{wildcards.ref_genome}.{wildcards.trans_aligner}.mapt.{wildcards.read_aligner}.ILSAnom.list | awk '{{print ">"$1;print $2}}' > {output.no_forbidden_accum_fa} || true """)





rule greedy_accumulator_indv:
	input:
		anom_transcripts = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.bed",
		mapped_reads = "mapped_reads/{read_aligner}/{sample}/{sample}.vs_{ref_genome}.{read_aligner}.reads.bed",
#		anom_seqs = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.fa",
		anom_psl = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.noForbiddenAnnot.psl",
#		transcriptome_accumulation = "utils/NotAPlaceOfHonor/vs_{ref_genome}.{read_aligner}.forbiddenAccumulation.populationWide.bed",
	output:
		no_forbidden_accum_bed = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.bed",
		no_forbidden_accum_psl = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.psl",
		no_forbidden_accum_fa = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.fa",

	params:
		runmem_gb=32,
		runtime="36:00:00",
		cores=8,
		sloppy=75,#how many bp to slop by
	message:
#		"excluding  {wildcards.sample}'s {wildcards.trans_aligner}-aligned transcripts from population-wide {wildcards.read_aligner}-accumulation .... "
		"accumulating {wildcards.sample}'s {wildcards.trans_aligner}-aligned transcripts with {wildcards.read_aligner} aligned reads "
	run:
		fai = ref_genome_by_name["hg38"]["fai"]
		shell(""" mkdir -p accumulations/{wildcards.read_aligner}/{wildcards.sample}/ meta/accumulations/""")
		# convert bam to bed12
#		shell(""" bedtools bamtobed -bed12 -i {input.mapped_reads} > mapped_reads/{wildcards.read_aligner}/{wildcards.sample}/accumulation/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.reads.bed""")

		#split transcript mappings into exons and slop them
		shell(""" cat {input.anom_transcripts} | bedtools bed12tobed6 -i | sort -k 1,1 -k2,2n | bedtools slop -b {params.sloppy} -g {fai} -i -  > accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.noForbiddenAnnot.sloptExons.bed """)
#		cp mapped_reads/{wildcards.read_aligner}/{wildcards.sample}/accumulation/{wildcards.sample}.{wildcards.trans_aligner}.noForbiddenAnnot.sloptExons.bed mapped_reads/{wildcards.read_aligner}/{wildcards.sample}/accumulation/{wildcards.sample}.{wildcards.trans_aligner}.noForbiddenAnnot.footprints.bed
		#merge the slopped transcript footprints to initialize the accumulator
		shell(""" cat accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.noForbiddenAnnot.sloptExons.bed | bedtools merge -c 4 -o distinct -i - > accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.noForbiddenAnnot.footprints.iter.bed """)
		shell(""" echo > accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.noForbiddenAnnot.footprints.init.bed """)
			#for annot in forbidden:
		annot_str = ""
		annot = annotation_by_operation['hg38']["exclude"]
		for egg in annot:
			path2gtf = annotation_by_name[egg]["gtf_path"]
			annot_str = "%s%s,%s;"%tuple([ annot_str, egg, path2gtf])

		shell("""  bash scripts/gathering_moss.sh accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner} {input.mapped_reads} '{annot_str}' {fai} > meta/accumulations/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.performance """)
		#sh scripts/gathering_moss.sh  mapped_reads/mapspliceMulti/HG00099/accumulation/HG00099.blat.mapspliceMulti mapped_reads/mapspliceMulti/HG00099/HG00099.mapspliceMulti.reads.bed "NCBIrefSeq,/proj/cdjones_lab/Genomics_Data_Commons/annotations/homo_sapiens/ncbiRefSeq.hg38.gtf;cmplxRepeat,/proj/cdjones_lab/Genomics_Data_Commons/annotations/homo_sapiens/repeatMasker.complex.hg38.gtf" /proj/cdjones_lab/Genomics_Data_Commons/genomes/homo_sapiens/hg38/hg38.fa.fai

		shell(""" cat accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.badboiz.*.list | cut -f 1 | sort | uniq > accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.badboiz.list """)

		shell(""" grep -v -wFf accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.badboiz.list {input.anom_transcripts} > {output.no_forbidden_accum_bed} """)

		shell(""" grep -v -wFf accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.badboiz.list {input.anom_psl} > {output.no_forbidden_accum_psl} """)
		shell(""" cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.fasta | cut -f 1 -d " " |  fasta_formatter -t  | grep -wFf accumulations/{wildcards.read_aligner}/{wildcards.sample}/{wildcards.sample}.{wildcards.trans_aligner}.{wildcards.read_aligner}.badboiz.list | awk '{{print ">"$1;print $2}}' > {output.no_forbidden_accum_fa} """)



rule summarize_transcriptome_subset_psl:#will be used to summarize the ~~~alignments~~~ of the subsets rawBlat, filtBlat, noForbiddenAnnot, ILSAnom
	input:
		psl_in = "assembled_transcripts/{prefix}.psl",
	output:
		stats_out = "assembled_transcripts/{prefix}.loc.stats",
		maptFrac_hist = "assembled_transcripts/{prefix}.fractionMapt.hist"

	params:
		runmem_gb=8,
		runtime="15:00",
		cores=8,
	run:
		shell(""" cat {input.psl_in} | cut -f 10 | sort | uniq | wc -l | awk '{{print"distinct_transcripts\t"$1}}' > {output.stats_out} """)
		shell(""" cat {input.psl_in} | cut -f 9,14,16,17 | sort | uniq | wc -l | awk '{{print"distinct_locii\t"$1}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk '{{locusLength_sum+=$17-$16; locusLength_sumsq+=(($17-$16)*($17-$16)) ; blkCount_sum+=$18; blkCount_sumsq+=($18*$18); qPct_sum+=($13-$12)/$11; qPct_sumsq+=(($13-$12)/$11)*(($13-$12)/$11);match_sum+=$1; match_sumsq+=$1*$1; misMtchRate_sum += ($2/$11); misMtchRate_sumsq += ($2/$11)*($2/$11); }} END {{ print "avg_locusLength\t"locusLength_sum/NR; print "std_locusLength\t"sqrt(locusLength_sumsq/NR - (locusLength_sum/NR)**2); print "avg_blockCount\t"blkCount_sum/NR; print "std_blockCount\t"sqrt(blkCount_sumsq/NR - (blkCount_sum/NR)**2); print "avg_fracMapped\t"qPct_sum/NR; print "std_fracMapped\t"sqrt(qPct_sumsq/NR - (qPct_sum/NR)**2);print "avg_matchCount\t"match_sum/NR; print "std_matchCount\t"sqrt(match_sumsq/NR - (match_sum/NR)**2); print "avg_mismatchRate\t"misMtchRate_sum/NR;print"std_mismatchRate\t"sqrt(misMtchRate_sumsq/NR - (misMtchRate_sum/NR)**2);}}' >>  {output.stats_out} """)
#		shell(""" cat {input.psl_in} | awk 'NR==1{{locusLength_max = $17-$16; locusLength_min = $17-$16 ; blk_max = $18 + 0; blk_min = $18 + 0 ; qPct_max = ($13-$12)/$11 + 0 ; match_min = $1 + 0 ; match_max = $1 + 0 ; qPct_min = ($13-$12)/$11 + 0 ; mismtch_min = $2/$11; mismtch_max = $2/$11; next}} {{if ($17-$16 > locusLength_max) locusLength_max = $17-$16; if ($17-$16 < locusLength_min) locusLength_min=$17-$16 ; if ($1 > match_max) match_max = $1; if ($1 < match_min) match_min=$1 ; if ($18 > blk_max) blk_max = $18; if ($18 < blk_min) blk_min=$18 ; if (qPct_max < ($13-$12)/$11 ) qPct_max = ($13-$12)/$11 ;  if (qPct_min > ($13-$12)/$11 ) qPct_min = ($13-$12)/$11 ; if ($2/$11 > mismtch_max) mismtch_max = $2/$11; if ($2/$11 < mismtch_min) mismtch_min=$2/$11 ;}} END {{print "max_blockCount",blk_max; print"min_blockCount",blk_min;print"max_fracMapped,"qPct_max";print"min_fracMapped",qPct_min; print"max_basesMatched",match_max";print"min_basesMatched",match_min;print"min_mismatchRate",mismtch_min";print"max_mismatchRate",mismtch_max";print"min_locusLength",locusLength_min";print"max_locusLength",locusLength_max;}}' >>  {output.stats_out} """)
#		shell(""" cat {input.psl_in} | awk 'NR==1{{locusLength_max = $17-$16; locusLength_min = $17-$16 ; blk_max = $18 + 0; blk_min = $18 + 0 ; qPct_max = ($13-$12)/$11 + 0 ; match_min = $1 + 0 ; match_max = $1 + 0 ; qPct_min = ($13-$12)/$11 + 0 ; mismtch_min = $2/$11; mismtch_max = $2/$11; next}} {{if ($17-$16 > locusLength_max) locusLength_max = $17-$16; if ($17-$16 < locusLength_min) locusLength_min=$17-$16 ; if ($1 > match_max) match_max = $1; if ($1 < match_min) match_min=$1 ; if ($18 > blk_max) blk_max = $18; if ($18 < blk_min) blk_min=$18 ; if (qPct_max < ($13-$12)/$11 ) qPct_max = ($13-$12)/$11 ;  if (qPct_min > ($13-$12)/$11 ) qPct_min = ($13-$12)/$11 ; if ($2/$11 > mismtch_max) mismtch_max = $2/$11; if ($2/$11 < mismtch_min) mismtch_min=$2/$11 ;}} END {{print "max_blockCount\t"blk_max"\nmin_blockCount\t"blk_min"\nmax_fracMapped\t"qPct_max"\nmin_fracMapped\t"qPct_min"\nmax_basesMatched\t"match_max"\nmin_basesMatched\t"match_min"\nmin_mismatchRate\t"mismtch_min"\nmax_mismatchRate\t"mismtch_max"\nmin_locusLength\t"locusLength_min"\nmax_locusLength\t"locusLength_max}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk 'NR==1{{blk_max = $18 + 0; blk_min = $18 + 0 ; next}} {{if ($18 > blk_max) blk_max = $18; if ($18 < blk_min) blk_min=$18 ; }} END {{print "max_blockCount\t"blk_max;print "min_blockCount\t"blk_min;}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk 'NR==1{{locusLength_max = $17-$16; locusLength_min = $17-$16 ; next}} {{if ($17-$16 > locusLength_max) locusLength_max = $17-$16; if ($17-$16 < locusLength_min) locusLength_min=$17-$16 ; }} END {{print "min_locusLength\t"locusLength_min; print"max_locusLength\t"locusLength_max;}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk 'NR==1{{qPct_max = ($13-$12)/$11 + 0 ;qPct_min = ($13-$12)/$11 + 0 ; next}} {{  if (qPct_max < ($13-$12)/$11 ) qPct_max = ($13-$12)/$11 ;  if (qPct_min > ($13-$12)/$11 ) qPct_min = ($13-$12)/$11 ;}} END {{print "max_fracMapped\t"qPct_max; print "min_fracMapped\t"qPct_min}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk 'NR==1{{match_min = $1 + 0 ; match_max = $1 + 0 ; next}} {{ if ($1 > match_max) match_max = $1; if ($1 < match_min) match_min=$1 ; }} END {{print "max_basesMatched\t"match_max; print"min_basesMatched\t"match_min;}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk 'NR==1{{mismtch_min = $2/$11; mismtch_max = $2/$11; next}} {{ if ($2/$11 > mismtch_max) mismtch_max = $2/$11; if ($2/$11 < mismtch_min) mismtch_min=$2/$11 ;}} END {{print "min_mismatchRate\t"mismtch_min;print "max_mismatchRate\t"mismtch_max}}' >>  {output.stats_out} """)

#		shell(""" cat {input.psl_in} | awk 'NR==1{{blk_max = $18 + 0; blk_min = $18 + 0 ; next}} {{if ($18 > blk_max) blk_max = $18; if ($18 < blk_min) blk_min=$18 ; }} END {{print "max_blockCount\t"blk_max"\nmin_blockCount\t"blk_min}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | cut -f 1 | sort -g | awk -f utils/scripts/median.awk | awk '{{print"median_basesMatched\t"$1}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | cut -f 18 | sort -g | awk -f utils/scripts/median.awk | awk '{{print"median_blockCount\t"$1}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk '{{print($13-$12)/$11}}' | sort -g | awk -f utils/scripts/median.awk | awk '{{print"median_fracMapped\t"$1}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk '{{print($2/$11)}}' | sort -g | awk -f utils/scripts/median.awk | awk '{{print"median_mismatchRate\t"$1}}' >>  {output.stats_out} """)
		shell(""" cat {input.psl_in} | awk '{{print($17-$16)}}' | sort -g | awk -f utils/scripts/median.awk | awk '{{print"median_locusLength\t"$1}}' >>  {output.stats_out} """)

		shell(""" cat {input.psl_in} | awk '{{print($13-$12)/$11;}}' | awk -f utils/scripts/hist.awk -v bin_width=0.01 | sort -g -k 1 > {output.maptFrac_hist}""")


rule summarize_transcriptome_subset_FASTA:#will be used to summarize the ~~~sequences~~~ of the subsets rawBlat, filtBlat, noForbiddenAnnot, ILSAnom
	input:
		seq_in = "assembled_transcripts/{sample}/trinity/{prefix}.fa",
		backMap = "assembled_transcripts/{sample}/trinity/{sample}.backMap.bowtie2.genomeCov"
	output:
		stats_out = "assembled_transcripts/{sample}/trinity/{prefix}.seq.stats",
		cov_hist = "assembled_transcripts/{sample}/trinity/{prefix}.seq.hist",
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
	run:
	###	this is largely the same routine as the original Trinity stats ...... merge that with this?

		#n50: https://github.com/trinityrnaseq/trinityrnaseq/wiki/Transcriptome-Contig-Nx-and-ExN50-stats
#		shell(""" mkdir -p summaries/assembled_transcripts/trinity/{wildcards.sample}/ """)
		shell("""
			bass=$(which Trinity | rev | cut -f 2- -d "/" | rev);
			perl $bass/util/TrinityStats.pl {input.seq_in} > {input.seq_in}.stat;
			paste <(echo -e "\ntotal_genes\ntotal_transcripts\npercent_GC\n\nfull_N10\nfull_N20\nfull_N30\nfull_N40\nfull_N50\nfull_med_len\nfull_avg_len\nfull_total_bp_ass\nlongest_N10\nlongest_N20\nlongest_N30\nlongest_N40\nlongest_N50\nlongest_med_len\nlongest_avg_len\nlongest_total_bp_ass") <( cat {input.seq_in}.stat | grep -v "#" | tr -s "\n" | rev | cut -f 1 -d ":" | cut -f 1 -d " " | cut -f 1 | rev )  | grep "_" > {output.stats_out};
		""")

		#read coverage: https://github.com/trinityrnaseq/trinityrnaseq/wiki/RNA-Seq-Read-Representation-by-Trinity-Assembly
		# shell(""" mkdir -p assembled_transcripts/{wildcards.sample}/trinity/bowtie2/ """)
		# shell(""" bowtie2-build assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.trinity.fasta assembled_transcripts/{wildcards.sample}/trinity/bowtie2/trinity.{wildcards.sample} """)
		# readpath=sample_by_name[wildcards.sample]['path']
		# shell(""" bowtie2 -p 10 -q --no-unal -k 20 -x assembled_transcripts/{wildcards.sample}/trinity/bowtie2/trinity.{wildcards.sample} -1 {readpath}{wildcards.sample}.clean.R1.fastq -2 {readpath}{wildcards.sample}.clean.R2.fastq 2> assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt| samtools view -Sb | samtools sort -o assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.backMap.bowtie2.sort.bam """)
		# shell(""" paste <(echo -e "aligned_discord\naligned_concord_uniq\naligned_concord_multi") <(cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt | sed -n '3,5p' | cut -f 2 -d '(' | cut -f 1 -d '%' ) >> {output.report_out} """)
		# shell(""" paste <(echo -e "total_aligned") <(cat assembled_transcripts/{wildcards.sample}/trinity/{wildcards.sample}.align_stats.txt | grep overall | cut -f 1 -d '%' ) >> {output.report_out} """)

		#https://stackoverflow.com/questions/39614454/creating-histograms-in-bash
		shell("""cat {input.backMap} | grep -wFf <( cat {input.seq_in} | fasta_formatter -t | cut -f 1 -d " " | sort | uniq | cut -f 1 )| grep -v -w genome | awk '{{if($2==1)print;}}' | cut -f 5  | awk -f utils/scripts/hist.awk -v bin_width=0.01 | sort -g -k 1 |awk '{{print"{wildcards.sample}\t"$0}}' > {output.cov_hist} """) 

rule summon_transcriptome_subset_analytics:
	input:
#		accum_stats = lambda wildcards: expand("summaries/accumulations/{sample}/{sample}.vs_hg38.{aligner}.forbiddenAccumulation.stats", sample=sampname_by_group['all'], aligner=["mapspliceRaw"])
		seq_stats = lambda wildcards: expand("assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.{affix}.seq.stats", sample=sampname_by_group['1kGen'], affix=["mapt", "mapt.filt", "mapt.noForbiddenAnnot", "mapt.mapspliceMulti.ILSAnom","mapt.mapspliceUniq.ILSAnom", ]),
		loc_stats = lambda wildcards: expand("assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.{affix}.loc.stats", sample=sampname_by_group['1kGen'], affix=["mapt", "mapt.filt","mapt.noForbiddenAnnot", "mapt.mapspliceMulti.ILSAnom","mapt.mapspliceUniq.ILSAnom", ]),
		direct_forbidden_rosters = lambda wildcards: expand("summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.vs_hg38.blat.mapt.forbidden.roster", sample=sampname_by_group['1kGen']),
	output:
		all_transcript_filt_stats = "summaries/assembled_transcripts/transcript_filtration.stats",
		direct_forbidden_roster = "summaries/assembled_transcripts/direct_forbidden_overlaps.roster"
	params:
		runmem_gb=1,
		runtime="1:00",
		cores=1,
	message:
		"collecting all individual accumulation metadata.... "
	run:
		shell(""" rm -f {output} """)
		for sample in sampname_by_group['1kGen']:
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.seq.stats | awk '{{print "mapped\tsequence\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.loc.stats | awk '{{print "mapped\tlocus\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.filt.seq.stats | awk '{{print "filtered\tsequence\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.filt.loc.stats | awk '{{print "filtered\tlocus\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.noForbiddenAnnot.seq.stats | awk '{{print "noForbiddenAnnot\tsequence\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
			shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.noForbiddenAnnot.loc.stats | awk '{{print "noForbiddenAnnot\tlocus\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")

			for read_mapper in ["mapspliceMulti",]:
				shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.{read_mapper}.ILSAnom.seq.stats | awk '{{print "ILSAnom_{read_mapper}\tsequence\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")
				shell("""cat assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_hg38.blat.mapt.{read_mapper}.ILSAnom.loc.stats | awk '{{print "ILSAnom_{read_mapper}\tlocus\tblat\t{sample}\t"$0}}' >> {output.all_transcript_filt_stats}""")


			shell(""" cat summaries/assembled_transcripts/trinity/{sample}/{sample}.trinity.vs_hg38.blat.mapt.forbidden.roster | awk '{{print "{sample}\t"$0; }}' >> {output.direct_forbidden_roster} """)




##########################	ORF EXTRACTION 	###########################


rule extract_transcriptionally_anomalous_orfs:
	input:
		transcripts_in = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.fa",
	output:
		orfs_out = "ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.fa"
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
		length_cutoff=75,
		other_params = "--reverse_complement "
	run:
		shell(""" mkdir -p  ORFs/precandidates/transcriptionally_anomalous/{wildcards.sample}/ """)
		shell(""" python scripts/ORF_extractor.py {params.other_params} --length_cutoff {params.length_cutoff} --fasta_in {input.transcripts_in} --output_file {output.orfs_out}.list  """)
		shell(""" samtools faidx --mark-strand sign {input.transcripts_in} --region-file  <(cat {output.orfs_out}.list | grep "(+)" | cut -f 1 -d "(" ) > {output.orfs_out} """)
		shell(""" samtools faidx --reverse-complement --mark-strand sign {input.transcripts_in} --region-file  <(cat {output.orfs_out}.list | grep "(-)" | cut -f 1 -d "(" ) >> {output.orfs_out} """)




rule blastORF_vsPDB:
	input:
#		orfs_in = "ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.fa",
		orfs_in = "ORFs/{prefix}.fa",
	output:
		blast_out = "ORFs/{prefix}.vs_PDB.blastx",
		no_pdb_fa = "ORFs/{prefix}.vs_PDB.absent.fa",
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
		evalue=10,
	run:
		shell(""" blastx -evalue {params.evalue} -outfmt 6 -db /nas/longleaf/data/blast/pdbaa -query {input.orfs_in} -out {output.blast_out} """)
		shell(""" cat {input.orfs_in} | fasta_formatter -t | grep -v -wFf <( cut -f 1 {output.blast_out} | sort | uniq ) | awk '{{print">"$1; print $2;}}'  > {output.no_pdb_fa} """ )		

rule blat_ORF_to_genome:
	input:
		orfs_in = "ORFs/{prefix}.fa",
	output:
#		orfs_out = "ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.fa"
		orfBlat_psl = "ORFs/{prefix}.blat_to_{ref_gen}.psl",
		orfBlat_bed = "ORFs/{prefix}.blat_to_{ref_gen}.bed",
	params:		
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
		match_thresh = 50,#50 bases must match
		match_frac = 0.5,#50% of query must align
#		weirdos = "random\|alt\|Un\|fix",
	wildcard_constraints:
		ref_gen = "[0-9A-Za-z_]*"
	run:
		ref_gen_path = ref_genome_by_name[wildcards.ref_gen]["path"]
		weirdos = ref_genome_by_name[wildcards.ref_gen]["scrubString"]
		shell(""" blat -noHead {ref_gen_path} {input.orfs_in} {output.orfBlat_psl}.noFilt; """)
		shell(""" cat {output.orfBlat_psl}.noFilt | awk '{{if(($1)>{params.match_thresh})print;}}' | awk '{{if(($13-$12)/$11>{params.match_frac})print;}}' | grep -v "{weirdos}" >  {output.orfBlat_psl} """)
		shell(""" ~/modules/UCSC_utils/pslToBed {output.orfBlat_psl} {output.orfBlat_bed} """)


rule findDupes:
	input:
#		orfs_in = "assembled_transcripts/{sample}/trinity/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.mapt.{read_aligner}.ILSAnom.fa",
		orfBlat_in = "ORFs/{prefix}.blat_to_hg38.psl",
	output:
#		orfs_out = "ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.fa"
		noDupeOrfs = "ORFs/{prefix}.noDupes.fa",
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=8,
		weirdos = "random\|alt\|Un\|fix",
	wildcard_constraints:
		ref_gen = "[0-9A-Za-z_]*"
	run:
		#currently accepting any mainstream blat of an ORF as valid - maybe overconservative; filter a little?
		shell(""" cat {input.orfBlat_in} | grep -v {params.weirdos} | cut -f 10 | sort | uniq -c | tr -s " " | tr " " "\t" | cut -f 2,3 > ORFs/{wildcards.prefix}.blattings.list""" )
		shell(""" cat ORFs/{wildcards.prefix}.fa | fasta_formatter -t | grep -v -wFf <( cat ORFs/{wildcards.prefix}.blattings.list | awk '{{if($1>1)print;}}' | cut -f 2) | awk '{{print">"$1; print$2}}' > {output.noDupeOrfs} """ )
		try:
			shell(""" cat ORFs/{wildcards.prefix}.fa | fasta_formatter -t | grep -v -wFf <( cat ORFs/{wildcards.prefix}.blattings.list | cut -f 2 ) | awk '{{print">"$1;print$2}}' > ORFs/{wildcards.prefix}.blat.cantFind """ )
		except:
			shell(""" touch ORFs/{wildcards.prefix}.blat.cantFind """)


rule check_orfs_vs_A_genome:
	input:
		orfBlat_in = "ORFs/{prefix}.blat_to_{ref_gen}.bed", #ref_gen for pan, gor, leu, etc
#		outside_ORFs = "utils/ORFomes/{ref_gen}.orfome.bed"
	output:
		badmaps_ORFs = "ORFs/{prefix}.blat_to_{ref_gen}.badmaps.list", #ORFs which map but not well
		unseen_ORFs = "ORFs/{prefix}.blat_to_{ref_gen}.unseen.list", #ORFs which don't map at all
		no_corresponding_ORF = "ORFs/{prefix}.blat_to_{ref_gen}.noCorrespondingORF.bed",
		ILSanom_ORF = "ORFs/{prefix}.blat_to_{ref_gen}.ilsAnom.bed",
		compPrim_clean = "ORFs/{prefix}.blat_to_{ref_gen}.compPrim_cleanGenome.list",
	params:
		runmem_gb=64,
		runtime="1:00:00",
		cores=8,
		other_params = "--reverse_complement",
		length_cutoff = 50,
		overlap_frac = 0.5, #how much of the query ORF must be overlapped
		intersect_params = "-split",
		slop_thresh =75,
		annot_filt = "XM_\|XR_",#(ignore predicted, curated-only 
	run:
		trunc_pref =  "/".join(wildcards.prefix.split("/")[:-1])
		shell(""" mkdir -p utils/ORFomes/tmp/{trunc_pref} """)
		#	accepts a blatting to a ref genome

		#	goes back and collects ORFs which BLAT but not well
		shell(""" cat ORFs/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.psl.noFilt | cut -f 10 | sort | uniq | grep -v -wFf <(cat {input.orfBlat_in} | cut -f 4 | sort | uniq) > {output.badmaps_ORFs} || true """)
		shell(""" touch {output.badmaps_ORFs} """)

		#	collect ORFs which don't BLAT at all
		shell("""cat ORFs/{wildcards.prefix}.fa | grep ">" | cut -f 2 -d ">" | grep -v -wFf <( cat ORFs/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.psl.noFilt | cut -f 10 | sort | uniq ) > {output.unseen_ORFs} """)

		#	collect window around the blatting; calculate a local ORFome
		ref_gen_fai = ref_genome_by_name[wildcards.ref_gen]["fai"]
		ref_gen_path = ref_genome_by_name[wildcards.ref_gen]["path"]
		shell(""" cat {input.orfBlat_in} | cut -f 1,2,3 | sort | uniq | bedtools slop -b 10000 -i - -g {ref_gen_fai} > utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regions.bed """)
		shell(""" bedtools getfasta -fi {ref_gen_path} -fo utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regions.fa -bed utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regions.bed """)

		shell(""" python scripts/ORF_extractor.py {params.other_params} --length_cutoff {params.length_cutoff} --fasta_in utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regions.fa --output_file utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regionalORFs.prebed""")

		shell(""" cat utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regionalORFs.prebed |  sort| uniq | sed -e 's/(-)/(~)/g' | tr ':' '\t' | tr  '-' '\t' | tr '~' '-' | tr '(' '\t' | tr -d ')' | awk '{{print$1,$2+$4-1,$2+$5,"potato",0,$6}}'  | tr " " "\t" > utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regionalORFs.bed""")

		# 	compares to same-strand ORF database
		shell(""" bedtools intersect -f {params.overlap_frac} -split -s -wa -a {input.orfBlat_in} -b utils/ORFomes/tmp/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.regionalORFs.bed | cut -f 4 | sort | uniq > ORFs/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.ORFoverlappers.list """)
		shell(""" grep -v -wFf ORFs/{wildcards.prefix}.blat_to_{wildcards.ref_gen}.ORFoverlappers.list  {input.orfBlat_in} > {output.no_corresponding_ORF} """)
		# # 	compare to excludes annotation_by_operation[{wildcards.ref_gen}]["exclude"]
		excld = annotation_by_operation[wildcards.ref_gen]["exclude"]#["GENCODE32", "NCBIrefSeq", "cmplxRepeat", "retro9", "yalePseudo"]

		weirdos = ref_genome_by_name[wildcards.ref_gen]["scrubString"]
		listList = " "
		fai = ref_genome_by_name[wildcards.ref_gen]["fai"]
		for ex in excld:
			path2gtf = annotation_by_name[ex]["gtf_path"]
			nuList = "ORFs/%s.blat_to_%s.intersects_%s.list" % tuple([wildcards.prefix, wildcards.ref_gen, ex])  
			shell(""" bedtools intersect {params.intersect_params} -a {input.orfBlat_in} -b <( cat {path2gtf} | grep -v "{weirdos}" | grep -v "{params.annot_filt}" | bedtools slop -b {params.slop_thresh} -i - -g {fai}  ) | cut -f 4 | sort | uniq > {nuList} """)
		# 	shell(""" cat {nuList} | wc -l | awk '{{print "{ex}\t"$1}}' >> {output.forbidden_roster} """)
			listList = "%s %s "%tuple([ listList, nuList])
		shell(""" grep -v -wFf <( cat {listList} | sort | uniq ) {input.orfBlat_in} > {output.ILSanom_ORF} """)

		shell(""" cat {output.no_corresponding_ORF} | cut -f 4 | sort | uniq | grep -wFf <( cat {output.ILSanom_ORF} | cut -f 4 | sort | uniq )  > {output.compPrim_clean} """)
		shell("""cat {output.badmaps_ORFs} >> {output.compPrim_clean} """)
		shell("""cat {output.unseen_ORFs} >> {output.compPrim_clean} """)
#		shell("""cat ORFs/{prefix}.fa | fasta_formatter -t | grep -wFf {output.compPrim_clean}.list > {output.compPrim_clean}""")



rule check_orfs_vs_ALL_genomeS:
	input:
		compPrim_clean_in =  lambda wildcards: expand("ORFs/{prefix}.blat_to_{ref_gen}.compPrim_cleanGenome.list", ref_gen = ["panTro6","gorGor5","nomLeu3","ponAbe3"], prefix = wildcards.prefix),
	output:
		compPrim_clean_out = "ORFs/{prefix}.compPrim_cleanGenome.fa",
	params:
		runmem_gb=8,
		runtime="15:00",
		cores=8,
	run:
		shell("""cat ORFs/{wildcards.prefix}.fa | fasta_formatter -t | grep -wFf <( cat ORFs/{wildcards.prefix}.blat_to_panTro6.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_gorGor5.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_nomLeu3.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_ponAbe3.compPrim_cleanGenome.list ) | awk '{{print">"$1;print$2}}' > {output.compPrim_clean_out}""")





rule nuclBlastDBbuilder:
	input:
		fasta_in = "{path2fasta}.f{asta}",
	output:
		blastDBindicator = "{path2fasta}.f{asta}.ndb",
	params:
		runmem_gb=8,
		runtime="15:00",
		cores=8,
	run:
		shell(""" makeblastdb -in {input.fasta_in} -dbtype nucl  """)



rule check_A_outgroup_transcriptome:
	input:
		db_in = "assembled_transcripts/{primate}/trinity/{primate}.trinity.fasta.ndb",
		orfs_in = "ORFs/{prefix}.fa",
	output:
		blastHits = "ORFs/{prefix}.{primate}_hits.out",
#		blastORFs = "ORFs/{prefix}.{primate}_ORFs.out",
	params:
		runmem_gb=8,
		runtime="15:00",
		cores=8,
		evalue = 2,
	run:
		shell(""" blastn -db assembled_transcripts/{primate}/trinity/{primate}.trinity.fasta -query {input.orfs_in} -evalue {params.evalue} -out {output.blastHits} """)



rule individual_transcriptome_lookback:
	input:
		db_in = "assembled_transcripts/{target_indv}/trinity/{target_indv}.trinity.fasta.ndb",
		orfs_in = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/{query_indv}.trinity.vs_hg38.blat.{read_aligner}.anomORFs.fa",
	output:
		blastHits = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.{read_aligner}.blastOut",
		noBlasts = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.{read_aligner}.noBlast",
#		noORF = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.{read_aligner}.noORF",
#		badScripts = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.{read_aligner}.badScripts",
#		rediscovered = "ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.{read_aligner}.rediscovered",
	params:
		runmem_gb=8,
		runtime="15:00",
		cores=8,
		evalue = 10,
		other_params = "--reverse_complement",
		length_cutoff = 50,
	run:
		shell(""" mkdir -p ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv} """)
		shell(""" blastn -db assembled_transcripts/{wildcards.target_indv}/trinity/{wildcards.target_indv}.trinity.fasta -query {input.orfs_in} -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore sstrand" -evalue {params.evalue} -out {output.blastHits} """)
		#check the blasts ... are they ORFs?
		#	#for orf o in orfs_in...

		#	#	#is o missing from blast? if so, mark that in .noBlast
		shell(""" cat  {input.orfs_in} | grep ">" | cut -f 2 -d ">" | grep -v -wFf <( cat {output.blastHits} | cut -f 1 | sort | uniq ) > {output.noBlasts} """)

		#	#	#blast quality filter??

		shell(""" samtools faidx --region-file <( cat {output.blastHits} | cut -f 2 | sort | uniq ) assembled_transcripts/{wildcards.target_indv}/trinity/{wildcards.target_indv}.trinity.fasta > {output.blastHits}.fa """)
		shell(""" python scripts/ORF_extractor.py {params.other_params} --length_cutoff {params.length_cutoff} --fasta_in {output.blastHits}.fa --output_file ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv}/{wildcards.target_indv}.{wildcards.read_aligner}.blastHitTranscriptORFs.list """)
		shell(""" cat ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv}/{wildcards.target_indv}.{wildcards.read_aligner}.blastHitTranscriptORFs.list | grep "(+)" | tr ":" "\t" | tr "-" "\t" | tr "(" "\t" | tr -d ")" | awk '{{print$1,$2,$3,"potato",0,$4}}' | tr " " "\t" >  ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv}/{wildcards.target_indv}.{wildcards.read_aligner}.blastHitTranscriptORFs.bed """)
		shell(""" cat ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv}/{wildcards.target_indv}.{wildcards.read_aligner}.blastHitTranscriptORFs.list |grep "(-)" | tr ":" "\t" | tr "(" "\t" | sed -e 's/-)/~/g' | tr "-" "\t" | tr "~" "-" | awk '{{print$1,$2,$3,"potato",0,$4}}' | tr " " "\t" >>  ORFs/precandidates/transcriptionally_anomalous/{wildcards.query_indv}/lookback/{wildcards.target_indv}/{wildcards.target_indv}.{wildcards.read_aligner}.blastHitTranscriptORFs.bed """)

 
		shell(""" cat {output.blastHits} |  cut -f 1,2,9,10,12,13 | sed -e 's/plus/+/g' | sed -e 's/minus/-/g' | awk '{{print$2,$3<$4?$3:$4,$3<$4?$4:$3,"|"$1"|",$5,$6}}' | tr " " "\t" | tr '|' '"' >  {output.blastHits}.bed""")

		#	#	#is any hit an ORF? if no, mark that in .noORF
		#	#	#for the ORF hits... is the transcript bad? if so, mark that in .badScripts
		#	#	#finally, an ORF hit to a clean transcript is marked in .rediscovered


#		shell(""" samtools faidx --mark-strand sign {input.transcripts_in} --region-file  <(cat {output.orfs_out}.list | grep "(+)" | cut -f 1 -d "(" ) > {output.orfs_out} """)
#		shell(""" samtools faidx --reverse-complement --mark-strand sign {input.transcripts_in} --region-file  <(cat {output.orfs_out}.list | grep "(-)" | cut -f 1 -d "(" ) >> {output.orfs_out} """)


# rule all_indv_lookbacks:
# 	input:
# 		lookbacks =  lambda wildcards: expand("ORFs/precandidates/transcriptionally_anomalous/{query_indv}/lookback/{target_indv}/{target_indv}.badScripts", query_indv = wildcards.query_indv, target_indv =sampname_by_group['1kGen']),
# 	output:
# 		compPrim_clean_out = "ORFs/{prefix}.compPrim_cleanGenome.fa",
# 	params:
# 		runmem_gb=8,
# 		runtime="15:00",
# 		cores=8,
# 	run:
# 		shell("""cat ORFs/{wildcards.prefix}.fa | fasta_formatter -t | grep -wFf <( cat ORFs/{wildcards.prefix}.blat_to_panTro6.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_gorGor5.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_nomLeu3.compPrim_cleanGenome.list | grep -wFf ORFs/{wildcards.prefix}.blat_to_ponAbe3.compPrim_cleanGenome.list ) | awk '{{print">"$1;print$2}}' > {output.compPrim_clean_out}""")





# rule check_compPrime_ortho:
# 	input:
# 		orfBlat_in = "ORFs/{prefix}.blat_to_hg38.bed", #ref_gen for pan, gor, leu, etc
# #		outside_ORFs = "utils/ORFomes/{ref_gen}.orfome.bed"
# 	output:
# 		# unseen_ORFs = "ORFs/{prefix}.blat_to_{ref_gen}.unseen.list", 
# 		# no_corresponding_ORF = "ORFs/{prefix}.blat_to_{ref_gen}.noCorrespondingORF.bed",
# 		# ILSanom_ORF = "ORFs/{prefix}.blat_to_{ref_gen}.ilsAnom.bed",
# 	params:
# 		runmem_gb=16,
# 		runtime="1:00:00",
# 		cores=8,
# 		primates = "hg38,panTro5,gorGor5,ponAbe3,nomLeu3",
# 		# other_params = "--reverse_complement",
# 		# length_cutoff = 75,
# 		# overlap_frac = 0.75, #how much of the query ORF must be overlapped
# 		# intersect_params = "-split",
# 		# slop_thresh =75,
# 	run:
# 		trunc_pref =  "/".join(wildcards.prefix.split("/")[:-1])
# 		shell(""" mkdir -p ORFs/{trunc_pref}/orthology/ """)



# 		for contig in chr 1..22, x, y, m:
# 			~/modules/phast/bin/maf_parse --seqs {params.primates} --features <( grep -w chr$contig {input.orfBlat_in} ) /proj/cdjones_lab/Genomics_Data_Commons/orthology/multiz30way/hg38/chr$contig.maf > ORFs/{trunc_pref}/orthology/chr$contig.raw.maf
# 			python Is_this_an_ORF.py -i  ORFs/{trunc_pref}/orthology/chr$contig.raw.maf --yes  ORFs/{trunc_pref}/orthology/chr$contig.ortho_ORFs.maf --no ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.maf
# 			python what_sort_of_nonORF_is_it.py -i  ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.maf --trunc ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.earlyTerm.maf --frameshift ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.frameshift.maf --nostart ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.startCodonWipeout.maf --mangled ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.mangled.maf --missing ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.missing.maf
# 			#upstream rescue routine: is there an in-frame start codon upstream, before a stop? is there an anystream?
# 				#ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.startCodonWipeout.maf ---   ---> ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.startCodonWipeout.rescue.maf and ORFs/{trunc_pref}/orthology/chr$contig.no_ortho_ORFs.startCodonWipeout.noRescue.maf
# 				# maf header (needed for UCSC) ##maf version=1 scoring=tba.v8
# 				~/modules/UCSC_utils/mafRanges out.maf gorGor5 maf.bed
# 				bedtools flank -l 1000 -s -i maf.bed -g gorGor5.fa.fai > upstreams.bed
# 				bedtools getfasta -bed upstreams.bed -fi gorGor5.fa > upstreams.fa
# 				python starts_and_stops.py --fasta_in upstreams.fa --bed_out starts_and_stops.bed
# 				#coord transform to absolute genomic from relative-to-flank 
# 				bedtools closest -id -s -a maf.bed -b  <(cat starts_and_stops | awk if $2 mod 3 == stop_codon_pos mod 3 print;) | grep STOP > no_rescue.inFrame
# 				## do other mod-3's for no_rescue.anyFrame

### also check the frame shifts, make sure it isn't just extending the ORF




# reporter script for anomORFs?
rule trivial_ORF_facts:
	input:
		orfs_in = "ORFs/{prefix}.fa",
	output:
		report_out = "summaries/ORFs/{prefix}.basics.summary"
	params:
		runmem_gb=8,
		runtime="10:00",
		cores=8,
	run:
		trunc_pref =  "/".join(wildcards.prefix.split("/")[:-1])
		shell(""" mkdir -p summaries/ORFs/{trunc_pref} """)
		shell(""" cat {input.orfs_in} | fasta_formatter  -t | wc -l | awk '{{print"total_count\t"$1;}}' > {output.report_out} """) 
		shell(""" cat {input.orfs_in} | fasta_formatter  -t | tr -d ")"  | tr "(" "\t" | awk '{{if($2=="+")print;}}' | wc -l | awk '{{print "sense_count\t"$1}}' >> {output.report_out} """) 
		shell(""" cat {input.orfs_in} | fasta_formatter  -t | tr -d ")"  | tr "(" "\t" | awk '{{if($2=="-")print;}}' | wc -l | awk '{{print "antisense_count\t"$1}}' >> {output.report_out} """)
		shell(""" cat {input.orfs_in} | fasta_formatter  -t | tr -d ")"  | tr "(" "\t" 	| wc -l | awk '{{print "unique_transcripts\t"$1}}' >> {output.report_out} """)

# reporter script for anomORFs?
rule summon_all_basic_ORF_facts:
	input:
		ilsAnom_ORFs = lambda wildcards: expand("summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.basics.summary", ref_genome="hg38",trans_aligner="blat",read_aligner=["mapspliceMulti",  ],sample=sampname_by_group['1kGen']),
		noDupe_ORFs = lambda wildcards: expand("summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.noDupes.basics.summary", ref_genome="hg38",trans_aligner="blat",read_aligner=["mapspliceMulti",  ],sample=sampname_by_group['1kGen']),
		noPDB_ORFs = lambda wildcards: expand("summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.vs_PDB.absent.basics.summary", ref_genome="hg38",trans_aligner="blat",read_aligner=["mapspliceMulti",  ],sample=sampname_by_group['1kGen']),
		compPrimGen_ORFs = lambda wildcards: expand("summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.compPrim_cleanGenome.basics.summary", ref_genome="hg38",trans_aligner="blat",read_aligner=["mapspliceMulti",  ],sample=sampname_by_group['1kGen']),
		badMap_ORFs = lambda wildcards: expand("ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.blat_to_{ref_gen}.{degreeMissing}.list", ref_genome="hg38", ref_gen=["gorGor5","panTro6","ponAbe3","nomLeu3"],trans_aligner="blat",read_aligner=["mapspliceMulti",  ],sample=sampname_by_group['1kGen'], degreeMissing=["badmaps","unseen"]),
	output:
		report_out = "summaries/basic_ORF_facts.summary"
	params:
		runmem_gb=8,
		runtime="10:00",
		cores=8,
	run:
		shell(""" rm -rf {output.report_out} """)
		ref_genome="hg38"
		trans_aligner="blat"
		for read_aligner in ["mapspliceMulti"]:#, "mapspliceUniq"]:
			for sample in sampname_by_group['1kGen']:
				shell( """ cat summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.basics.summary | awk '{{print "ilsAnom\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)
				shell( """ cat summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.noDupes.basics.summary | awk '{{print "noDupe\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)
				shell( """ cat summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.vs_PDB.absent.basics.summary | awk '{{print "noPDB\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)
				shell( """ cat summaries/ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.compPrim_cleanGenome.basics.summary | awk '{{print "cleanGenome\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)

				for refGen in ["gorGor5","panTro6","ponAbe3","nomLeu3"]:
					shell( """ cat ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.blat_to_{refGen}.badmaps.list | wc -l | awk '{{print "badmap_{refGen}\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)
					shell( """ cat ORFs/precandidates/transcriptionally_anomalous/{sample}/{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}.anomORFs.blat_to_{refGen}.unseen.list | wc -l | awk '{{print "unseen_{refGen}\t{sample}.trinity.vs_{ref_genome}.{trans_aligner}.{read_aligner}\t"$0}}' >> {output.report_out} """)









##########################	BACKGROUND DATA 	###########################

rule extract_referenceGenome_ORFome:
	output:
		orfome_bed = "utils/ORFomes/{ref_gen}.orfome.bed"
	params:
		runmem_gb=16,
		runtime="12:00:00",
		cores=8,
		other_params = "--reverse_complement",
		length_cutoff = 75,
	run:
		ref_gen_path = ref_genome_by_name[wildcards.ref_gen]["path"]
		ref_gen_fai = ref_genome_by_name[wildcards.ref_gen]["fai"]
		shell(""" mkdir -p utils/ORFomes/tmp/ """)
		shell(""" bedtools makewindows -w 100000 -s 50000 -g {ref_gen_fai} | bedtools getfasta -fi {ref_gen_path} -bed - > utils/ORFomes/tmp/{wildcards.ref_gen}.fragmented.fa """)
		# shell(""" 
		# 	for contig in $(grep ">" {ref_gen_path} | tr -d ">" ); do 
		# 		samtools faidx {ref_gen_path} $contig > utils/ORFomes/tmp/{wildcards.ref_gen}.tmp.fa
		shell(""" python scripts/ORF_extractor.py {params.other_params} --length_cutoff {params.length_cutoff} --fasta_in utils/ORFomes/tmp/{wildcards.ref_gen}.fragmented.fa --output_file {output.orfome_bed}.list """)
		# 		cat {output.orfome_bed}.list.tmp > {output.orfome_bed}.list;
		# 		rm utils/ORFomes/tmp/{wildcards.ref_gen}.tmp.fa {output.orfome_bed}.list.tmp
		# 		done;""")
		shell(""" cat {output.orfome_bed}.list | sort| uniq | sed -e 's/(-)/(~)/g' | tr ':' '\t' | tr  '-' '\t' | tr '~' '-' | tr '(' '\t' | tr -d ')'  | awk '{print$1,$2+$4,$2+$5,"potato",0,$6}'  | tr " " "\t" > {output.orfome_bed}""")
		shell(""" rm {output.orfome_bed}.list utils/ORFomes/tmp/{wildcards.ref_gen}.fragmented.fa """)

##########################	WRITE RESULTS 	###########################

rule write_report:
	input:
		reference_genome_summary = ["summaries/reference_genomes.summary"],
		reference_annotation_summary = ["summaries/reference_annotations.summary"],
		sequenced_reads_summary=["summaries/sequenced_reads.dat"],
		aligned_reads_summary = expand("summaries/alignments.vs_hg38.{aligner}.summary", aligner=["mapspliceRaw","mapspliceMulti","mapspliceUniq","mapspliceRando"]),#"mapspliceUniq","mapspliceRando"]),
		trinity_summary = "summaries/assembled_transcripts/trinity_assemblies.summary",
		merged_forbidden_stats = "summaries/annotations/hg38.forbiddenAnnotations.stats",
		all_accum_indiv_stats = "summaries/accumulations.summary",
		forbidden_accumulation_stats = expand("summaries/annotations/vs_hg38.{aligner}.forbiddenAccumulation.populationWide.stats", aligner=["mapspliceRaw","mapspliceMulti", "mapspliceRando"]),
		transcriptome_filtration = "summaries/assembled_transcripts/transcript_filtration.stats",
	output:
		pdf_out="results/1kGenHumanDenovoProjectOfDoom.pdf",
	params:
		runmem_gb=8,
		runtime="1:00:00",
		cores=2,
	message:
		"writing up the results.... "
	run:
		pandoc_path="/nas/longleaf/apps/rstudio/1.0.136/bin/pandoc"
		pwd = subprocess.check_output("pwd",shell=True).decode().rstrip()+"/"
		shell("""mkdir -p results/figures/supp/ results/tables/supp/""")
		shell(""" R -e "setwd('{pwd}');Sys.setenv(RSTUDIO_PANDOC='{pandoc_path}')" -e  "peaDubDee='{pwd}'; rmarkdown::render('scripts/RNAseq_results.Rmd',output_file='{pwd}{output.pdf_out}')"  """)
#		shell(""" tar cf results.tar results/ """)




