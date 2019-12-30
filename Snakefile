configfile: 'config.yaml'
#	module load python/3.6.6 bedtools bedops samtools r/3.6.0 rstudio/1.1.453 bowtie sratoolkit subread
#rstudio/1.2.1335 

#from itertools import combinations

sample_by_name = {c['name'] : c for c in config['data_sets']}
ref_genome_by_name = { g['name'] : g for g in config['reference_genomes']}
annotation_by_name = { a['name'] : a for a in config['annotations']}


rule summon_reads_SRA:
	output: 
		reads1='FASTQ/{path}/{prefix}_1.fastq',
		reads2='FASTQ/{path}/{prefix}_2.fastq',
	params:
		runmem_gb=8,
		runtime="3:00:00",
		cores=1,
	run:
		print("%s%s" % tuple(["FASTQ/", wildcards.path]))
		try:
			sra = sra_by_fqpath["%s%s/" % tuple(["FASTQ/", wildcards.path])]
			shell(""" mkdir -p FASTQ/{wildcards.path}/ """)
			shell("""
				fasterq-dump  --split-3 --outdir FASTQ/{wildcards.path}/ {sra}
			""")
		except KeyError:
			raise KeyError("Sample is listed as empirical but no reads found and no SRA to download!" )


rule mapsplice_builder:
	output:
		windowed='utils/MapSplice-v2.1.8/mapsplice.py.bak'
	params:
		runmem_gb=8,
		runtime="30:00",
		cores=1,
	run:
		shell("mkdir -p utils/")
		shell(
			""" 
			cd utils;
			wget http://protocols.netlab.uky.edu/~zeng/MapSplice-v2.1.8.zip ;
			unzip MapSplice-v2.1.8.zip;
			2to3 -w MapSplice-v2.1.8/;
			cd MapSplice-v2.1.8/;
			make;
			cd ..;
			rm MapSplice-v2.1.8.zip;
			"""
		)		

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

rule demand_reference_genome_summary:
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


rule demand_annotation_summaries:
	input:
		refgen_reports = lambda wildcards: expand("summaries/annotations/{ref_ann}.stats", ref_ann= [a["name"] for a in config['annotations'] if not a["derived"] ] ) # annotation_by_name.keys())
	output:
		refann_summary = "summaries/reference_annotations.summary"
	params:
		runmem_gb=1,
		runtime="5:00",
		cores=1,
	run:
		print([a["name"] for a in config['annotations'] if not a["derived"] ])
		shell(""" rm -f {output.refann_summary} """)
		for anne in [a["name"] for a in config['annotations'] if not a["derived"] ]:
			shell(""" cat summaries/annotations/{anne}.stats | awk '{{print"{anne}\t"$0}}' >> {output.refann_summary}""")


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

rule demand_FASTQ_analytics:	#forces a FASTP clean
	input:
		jasons_in = expand("summaries/FASTP/{samplename}.json.pruned", samplename = sample_by_name.keys())
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



rule mapsplice2_align_raw:
	input:
		mapsplice = "utils/MapSplice-v2.1.8/mapsplice.py.bak",
		reads_in = lambda wildcards: expand("{path}{sample}.clean.R{pair}.fastq", path=sample_by_name[wildcards.sample]['path'], sample=wildcards.sample, pair = [1,2]),
	output:
		raw_bam = "mapped_reads/mapspliceRaw/{sample}/{sample}.vs_{ref_genome}.mapspliceRaw.sort.bam",
	params:
		runmem_gb=16,
		runtime="16:00:00",
		cores=8,
	message:
		"aligning reads from {wildcards.sample} to reference_genome {wildcards.ref_genome} .... "
	run:
		ref_genome_split = ref_genome_by_name[wildcards.ref_genome]['split'],
		ref_genome_bwt = ref_genome_by_name[wildcards.ref_genome]['bowtie'],
		shell(""" mkdir -p mapped_reads/mapspliceRaw/{wildcards.sample}/ summaries/BAMs/""")
		shell(""" 
			python utils/MapSplice-v2.1.8/mapsplice.py -c {ref_genome_split} -x {ref_genome_bwt} -1 {input.reads_in[0]} -2 {input.reads_in[1]} -o mapped_reads/mapspliceRaw/{wildcards.sample} 
			""")
		shell(""" 
			samtools view -Sbh mapped_reads/mapspliceRaw/{wildcards.sample}/alignments.sam | samtools sort - > mapped_reads/mapspliceRaw/{wildcards.sample}/{wildcards.sample}.vs_{wildcards.ref_genome}.mapspliceRaw.sort.bam;
			samtools index {output.raw_bam};
			rm mapped_reads/mapspliceRaw/{wildcards.sample}/alignments.sam;
			""")























