#!/bin/sh

peekay=$1
session_name=$2
nonxpressr1=$3
nonxpressr2=$4
nonxpressr3=$5
xpressr1=$6
xpressr2=$7
xpressr3=$8


#DNApath=/lustre/scr/c/s/csoeder/DNA-Seq/alignments/
RNApath=/netscr/csoeder/1kGen/RNApath_v4_up
DNApath=/netscr/csoeder/1kGen/DNApath_v4_up
VCFpath=/netscr/csoeder/1kGen/VCFpath_v4_up


#   sh igv_xml_writer.sh $peekay $nonxpressr1 $nonxpressr2 $nonxpressr3 



echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>'


#echo "<Session genome="/netscr/csoeder/1kGen/data/hg19.fa" hasGeneTrack="false" hasSequenceTrack="true" locus="chr15:59615957-59616520" path="/netscr/csoeder/igv_session_test.xml" version="8">"
echo "<Session genome="'"/netscr/csoeder/1kGen/data/hg19.fa"'" hasGeneTrack="'"false"'" hasSequenceTrack="'"true"'" path="'"/netscr/csoeder/'$session_name'.xml"'" version="'"8"'">"


echo "  <Resources>"
#   All candidates
echo "      <Resource path="'"/netscr/csoeder/1kGen/candidates.thumbsUp.sorted.bed"'"/>"

#   Three non-expressors
#       psl
echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr1'/'$nonxpressr1'_blatAlign.sort.psl"'"/>"
echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr2'/'$nonxpressr2'_blatAlign.sort.psl"'"/>"
echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr3'/'$nonxpressr3'_blatAlign.sort.psl"'"/>"
#       DNA
echo "      <Resource path="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr1'.bam"'"/>"
echo "      <Resource path="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr2'.bam"'"/>"
echo "      <Resource path="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr3'.bam"'"/>"
#       RNA
echo "      <Resource path="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr1'.bam"'"/>"
echo "      <Resource path="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr2'.bam"'"/>"
echo "      <Resource path="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr3'.bam"'"/>"
#       vcf
echo "      <Resource path="'"'$VCFpath'/NonExpressers_'$peekay'.vcf"'"/>"



#   At Most Three expressors

echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$xpressr1'/'$xpressr1'_blatAlign.sort.psl"'"/>"
echo "      <Resource path="'"'$RNApath'/Expressers_'$peekay'_'$xpressr1'.bam"'"/>"
echo "      <Resource path="'"'$DNApath'/Expressers_'$peekay'_'$xpressr1'.bam"'"/>"


if [[ "$xpressr2" -ne "" ]]; then 
    echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$xpressr2'/'$xpressr2'_blatAlign.sort.psl"'"/>"
    echo "      <Resource path="'"'$RNApath'/Expressers_'$peekay'_'$xpressr2'.bam"'"/>"
    echo "      <Resource path="'"'$DNApath'/Expressers_'$peekay'_'$xpressr2'.bam"'"/>"
fi

if [[ "$xpressr3" -ne "" ]]; then 
    echo "      <Resource path="'"/netscr/csoeder/1kGen/individuals/'$xpressr3'/'$xpressr3'_blatAlign.sort.psl"'"/>"
    echo "      <Resource path="'"'$RNApath'/Expressers_'$peekay'_'$xpressr3'.bam"'"/>"
    echo "      <Resource path="'"'$DNApath'/Expressers_'$peekay'_'$xpressr3'.bam"'"/>"
fi
#       vcf
echo "      <Resource path="'"'$VCFpath'/Expressers_'$peekay'.vcf"'"/>"
echo "      <Resource path="'"/netscr/csoeder/1kGen/candidates.sort.bed"'"/>"
echo "      <Resource path="'"/netscr/csoeder/1kGen/data/refSeq_genes.bed"'"/>"
#echo "      <Resource path="'"/netscr/csoeder/1kGen/data/repeatmasker.bed"'"/>"
echo "  </Resources>"






###     PSL of expressers
echo "  <Panel height="'"500"'" name="'"Expresser Transcript Alignments"'" width="'"1111"'">"

echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$xpressr1'/'$xpressr1'_blatAlign.sort.psl"'" name="'"expresser '$xpressr1': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/Expressers_'$peekay'_'$xpressr1'.bam"'" name="'"expresser '$xpressr1': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"


if [[ "$xpressr2" -ne "" ]]; then 
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$xpressr2'/'$xpressr2'_blatAlign.sort.psl"'" name="'"expresser '$xpressr2': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/Expressers_'$peekay'_'$xpressr2'.bam"'" name="'"expresser '$xpressr2': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"
fi

if [[ "$xpressr3" -ne "" ]]; then 
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$xpressr3'/'$xpressr3'_blatAlign.sort.psl"'" name="'"expresser '$xpressr3': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/Expressers_'$peekay'_'$xpressr3'.bam"'" name="'"expresser '$xpressr3': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"
fi

echo "  </Panel>"




###     VCF of expressers

echo "  <Panel height="'"100"'" name="'"Expresser Variation"'" width="'"1111"'">"
echo "      <Track SQUISHED_ROW_HEIGHT="'"4"'" altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorMode="'"GENOTYPE"'" displayMode="'"EXPANDED"'" featureVisibilityWindow="'"10000"'" fontSize="'"10"'" id="'"'$VCFpath'/Expressers_'$peekay'.vcf"'" name="'"expressers: Variation"'" renderer="'"BASIC_FEATURE"'" siteColorMode="'"ALLELE_FREQUENCY"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'"/>"
echo "  </Panel>"
echo "  <PanelLayout dividerFractions="'"0.2,0.8"'"/>"


###     DNA of expressers
echo "  <Panel height="'"50"'" name="'"Expresser RNA"'" width="'"1121"'">"


echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/Expressers_'$peekay'_'$xpressr1'.bam"'" name="'"expresser '$xpressr1': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"

if [[ "$xpressr2" -ne "" ]]; then 
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/Expressers_'$peekay'_'$xpressr2'.bam"'" name="'"expresser '$xpressr2': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"
fi

if [[ "$xpressr3" -ne "" ]]; then 
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/Expressers_'$peekay'_'$xpressr3'.bam"'" name="'"expresser '$xpressr3': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"
fi

echo "  </Panel>"




###     PSL of nonexpressers

echo "  <Panel height="'"50"'" name="'"NonExpresser Transcript Alignments"'" width="'"1111"'">"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr1'/'$nonxpressr1'_blatAlign.sort.psl"'" name="'"nonexpresser '$nonxpressr1': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr1'.bam"'" name="'"nonexpresser '$nonxpressr1': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"

echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr2'/'$nonxpressr2'_blatAlign.sort.psl"'" name="'"nonexpresser '$nonxpressr2': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr2'.bam"'" name="'"nonexpresser '$nonxpressr2': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"


echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;1825.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/individuals/'$nonxpressr3'/'$nonxpressr3'_blatAlign.sort.psl"'" name="'"nonexpresser '$nonxpressr3': transcripts"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#       <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="1825.0" minimum="0.0" type="LINEAR"/>
echo "  </Track>"
echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$RNApath'/NonExpressers_'$peekay'_'$nonxpressr3'.bam"'" name="'"nonexpresser '$nonxpressr3': RNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"


echo "  </Panel>"


###     RNA of nonexpressers
#echo "  <Panel height="'"750"'" name="'"NonExpresser RNA"'" width="'"1111"'">"





###     VCF of nonexpressers

echo "  <Panel height="'"100"'" name="'"NonExpresser Variation"'" width="'"1111"'">"
echo "      <Track SQUISHED_ROW_HEIGHT="'"4"'" altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorMode="'"GENOTYPE"'" displayMode="'"EXPANDED"'" featureVisibilityWindow="'"10000"'" fontSize="'"10"'" id="'"'$VCFpath'/NonExpressers_'$peekay'.vcf"'" name="'"nonexpressers: Variation"'" renderer="'"BASIC_FEATURE"'" siteColorMode="'"ALLELE_FREQUENCY"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'"/>"
echo "  </Panel>"
echo "  <PanelLayout dividerFractions="'"0.2,0.8"'"/>"


###     DNA of nonexpressers
echo "  <Panel height="'"50"'" name="'"NonExpresser RNA"'" width="'"1111"'">"


echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr1'.bam"'" name="'"nonexpresser '$nonxpressr1': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"

echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr2'.bam"'" name="'"nonexpresser '$nonxpressr2': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"

echo "  <Track altColor="'"0,0,178"'" autoScale="'"false"'" color="'"0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"'$DNApath'/NonExpressers_'$peekay'_'$nonxpressr3'.bam"'" name="'"nonexpresser '$nonxpressr3': DNA-Seq"'" sortable="'"true"'" visible="'"true"'">"
echo "      <RenderOptions colorByTag="'""'" colorOption="'"READ_STRAND"'" flagUnmappedPairs="'"false"'" groupByTag="'""'" maxInsertSize="'"1000"'" minInsertSize="'"50"'" shadeBasesOption="'"QUALITY"'" shadeCenters="'"true"'" showAllBases="'"false"'" sortByTag="'""'"/>"
echo "  </Track>"

echo "  </Panel>"

echo " <Panel height="'"75"'" name="'"All Candidates"'" width="'"1111"'">"
echo "      <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;8.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/candidates.sort.bed"'" name="'"All candidates"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
echo "      </Track>"
echo "  </Panel>"

echo " <Panel height="'"75"'" name="'"Annotation Tracks"'" width="'"1111"'">"
echo "      <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;8.0;255,255,255;0,0,178"'" displayMode="'"SQUISHED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/data/refSeq_genes.bed"'" name="'"RefSeq Genes"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
echo "      </Track>"
#echo "      <Track altColor="'"0,0,178"'" autoScale="'"false"'" clazz="'"org.broad.igv.track.FeatureTrack"'" color="'"0,0,178"'" colorScale="'"ContinuousColorScale;0.0;8.0;255,255,255;0,0,178"'" displayMode="'"COLLAPSED"'" featureVisibilityWindow="'"-1"'" fontSize="'"10"'" id="'"/netscr/csoeder/1kGen/data/repeatmasker.bed"'" name="'"RepeatMasker"'" renderer="'"BASIC_FEATURE"'" sortable="'"false"'" visible="'"true"'" windowFunction="'"count"'">"
#echo "      </Track>"
echo "  </Panel>"


echo "</Session>"




# ##    VCF:
#   <Panel height="37585" name="Panel1463868757655" width="1111">
#       <Track SQUISHED_ROW_HEIGHT="4" altColor="0,0,178" autoScale="false" clazz="org.broad.igv.track.FeatureTrack" color="0,0,178" colorMode="GENOTYPE" displayMode="EXPANDED" featureVisibilityWindow="10000" fontSize="10" id="/netscr/csoeder/1kGen/merged.vcf.gz" name="merged.vcf.gz" renderer="BASIC_FEATURE" siteColorMode="ALLELE_FREQUENCY" sortable="false" visible="true" windowFunction="count"/>
#   </Panel>
#   <Panel height="30" name="FeaturePanel" width="1111">
#       <Track altColor="0,0,178" autoScale="false" color="0,0,178" displayMode="EXPANDED" featureVisibilityWindow="-1" fontSize="10" id="Reference sequence" name="Reference sequence" sortable="false" visible="true"/>
#   </Panel>
#   <PanelLayout dividerFractions="0.010889292196007259,0.9364791288566243"/>

# ##    BED:
#     <Panel height="37585" name="Panel1463868757655" width="1111">
#         <Track SQUISHED_ROW_HEIGHT="4" altColor="0,0,178" autoScale="false" clazz="org.broad.igv.track.FeatureTrack" color="0,0,178" colorMode="GENOTYPE" displayMode="EXPANDED" featureVisibilityWindow="10000" fontSize="10" id="/netscr/csoeder/1kGen/merged.vcf.gz" name="merged.vcf.gz" renderer="BASIC_FEATURE" siteColorMode="ALLELE_FREQUENCY" sortable="false" visible="true" windowFunction="count"/>
#     </Panel>
#     <Panel height="60" name="FeaturePanel" width="1111">
#         <Track altColor="0,0,178" autoScale="false" color="0,0,178" displayMode="EXPANDED" featureVisibilityWindow="-1" fontSize="10" id="Reference sequence" name="Reference sequence" sortable="false" visible="true"/>
#         <Track altColor="0,0,178" autoScale="false" clazz="org.broad.igv.track.FeatureTrack" color="0,0,178" colorScale="ContinuousColorScale;0.0;8.0;255,255,255;0,0,178" displayMode="COLLAPSED" featureVisibilityWindow="-1" fontSize="10" id="/netscr/csoeder/1kGen/candidates.sort.bed" name="candidates.sort.bed" renderer="BASIC_FEATURE" sortable="false" visible="true" windowFunction="count">
#             <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="8.0" minimum="0.0" type="LINEAR"/>
#         </Track>
#     </Panel>
#     <PanelLayout dividerFractions="0.010889292196007259,0.8820326678765881"/>
# ##    BAM:

#     <Panel height="835" name="Panel1463769751668" width="1121">
#         <Track altColor="0,0,178" autoScale="true" color="175,175,175" colorScale="ContinuousColorScale;0.0;10.0;255,255,255;175,175,175" displayMode="EXPANDED" featureVisibilityWindow="-1" fontSize="10" id="/netscr/csoeder/1kGen/individuals/HG00096/HG00096_mapsplice_alignment.sort.bam_coverage" name="HG00096_mapsplice_alignment.sort.bam Coverage" showReference="false" snpThreshold="0.2" sortable="true" visible="true">
#             <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="10.0" minimum="0.0" type="LINEAR"/>
#         </Track>
#         <Track altColor="0,0,178" autoScale="false" clazz="org.broad.igv.track.FeatureTrack" color="0,0,178" displayMode="SQUISHED" featureVisibilityWindow="-1" fontSize="10" height="60" id="/netscr/csoeder/1kGen/individuals/HG00096/HG00096_mapsplice_alignment.sort.bam_junctions" name="HG00096_mapsplice_alignment.sort.bam Junctions" sortable="false" visible="true" windowFunction="count">
#             <DataRange baseline="0.0" drawBaseline="true" flipAxis="false" maximum="60.0" minimum="0.0" type="LINEAR"/>
#         </Track>
#         <Track altColor="0,0,178" autoScale="false" color="0,0,178" displayMode="EXPANDED" featureVisibilityWindow="-1" fontSize="10" id="/netscr/csoeder/1kGen/individuals/HG00096/HG00096_mapsplice_alignment.sort.bam" name="HG00096_mapsplice_alignment.sort.bam" sortable="true" visible="true">
#             <RenderOptions colorByTag="" colorOption="READ_STRAND" flagUnmappedPairs="false" groupByTag="" maxInsertSize="1000" minInsertSize="50" shadeBasesOption="QUALITY" shadeCenters="true" showAllBases="false" sortByTag=""/>
#         </Track>
#     </Panel>



