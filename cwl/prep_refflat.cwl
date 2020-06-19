$namespaces:
  s: https://schema.org/
s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9758-0176
    s:email: mailto: james.eddy@sagebase.org
    s:name: James Eddy
s:contributor:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-3659-9663
    s:email: mailto:william.poehlman@sagebase.org
    s:name: William Poehlman
baseCommand:
- make_refflat.sh
class: CommandLineTool
cwlVersion: v1.0
doc: 'Generate refFlat reference file for Picard CollectRnaSeqMetrics.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.3-85adf1f
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
