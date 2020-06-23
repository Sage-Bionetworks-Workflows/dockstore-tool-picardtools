$namespaces:
  s: https://schema.org/
baseCommand:
- make_riboints.sh
class: CommandLineTool
cwlVersion: v1.0
doc: 'Generate ribosomal intervals reference file for Picard CollectRnaSeqMetrics.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:1.0.1
id: prep-riboints
inputs:
- doc: Gene annotations (gene model) in GTF format from Gencode
  id: genemodel_gtf
  inputBinding:
    position: 0
  label: Gene model GTF
  type: File
- doc: Reads data file in SAM (or BAM) format
  id: aligned_reads_sam
  inputBinding:
    position: 1
  label: Aligned reads SAM
  type: File
label: Build Picard ribosomal intervals
outputs:
- doc: Picard ribosomal (rRNA) interval list file
  id: picard_riboints
  label: Picard ribosomal intervals
  outputBinding:
    glob: '*.rRNA.interval_list'
  type: File
s:author:
- class: s:Person
  s:email: mailto:james.eddy@sagebase.org
  s:identifier: https://orcid.org/0000-0001-9758-0176
  s:name: James Eddy
s:contributor:
- class: s:Person
  s:email: mailto:william.poehlman@sagebase.org
  s:identifier: https://orcid.org/0000-0002-3659-9663
  s:name: William Poehlman
