$namespaces:
  s: https://schema.org/
s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0001-9758-0176
    s:email: mailto:james.eddy@sagebase.org
    s:name: James Eddy
s:contributor:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-3659-9663
    s:email: mailto:william.poehlman@sagebase.org
    s:name: William Poehlman
baseCommand:
- combine_metrics_sample.py
class: CommandLineTool
cwlVersion: v1.0
doc: 'Combine data from one or more Picard metrics outputs into a

  single CSV table.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.3-85adf1f
id: combine-metrics
inputs:
- id: basef
  type: string
- id: picard_metrics
  inputBinding:
    position: 0
  label: Picard metrics files to combine
  type: File[]
- id: combined_metrics_filename
  inputBinding:
    position: 1
    prefix: -o
  label: Output metrics filename
  type: string
label: Combine Picard metrics per sample
outputs:
- doc: Combined metrics table saved as CSV text file
  id: combined_metrics_csv
  label: Combined metrics table
  outputBinding:
    glob: '*csv'
  type: File
requirements:
  StepInputExpressionRequirement: {}
