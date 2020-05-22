baseCommand:
- combine_metrics_sample.py
class: CommandLineTool
cwlVersion: v1.0
doc: 'Combine data from one or more Picard metrics outputs into a

  single CSV table.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.1
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
