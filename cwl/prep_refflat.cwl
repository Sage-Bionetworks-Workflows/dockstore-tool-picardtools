baseCommand:
- make_refflat.sh
class: CommandLineTool
cwlVersion: v1.0
doc: 'Generate refFlat reference file for Picard CollectRnaSeqMetrics.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.2-5fbea4d
id: prep-refflat
inputs:
- doc: Gene annotations (gene model) in GTF from Gencode
  id: genemodel_gtf
  inputBinding:
    position: 0
  label: Gene model GTF
  type: File
label: Build Picard refFlat
outputs:
- doc: Picard refFlat reference
  id: picard_refflat
  label: Picard refFlat
  outputBinding:
    glob: '*.refFlat.txt'
  type: File
