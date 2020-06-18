arguments:
- prefix: --out_dir
  valueFrom: $(runtime.outdir)
baseCommand:
- combine_metrics_study.R
class: CommandLineTool
cwlVersion: v1.0
doc: 'Combine individual sample metric files into a sample x metric matrix file.

  '
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.3
id: combine-metrics
inputs:
- id: picard_metrics
  inputBinding:
    position: 0
  label: Picard metrics files to combine
  type: File[]
- default: Study
  doc: 'Prefix for output file (i.e., <prefix>_all_metrics_matrix.txt)).

    '
  id: output_prefix
  inputBinding:
    position: 1
    prefix: --out_prefix
  label: Output counts file prefix
  type: string?
- default: .csv
  doc: 'Suffix to strip from sample filename [default %(default)s].

    '
  id: sample_suffix
  inputBinding:
    position: 2
    prefix: --sample_suffix
  label: Suffix to remove from filename
  type: string
label: Combine Picard metrics across samples
outputs:
- doc: Output combined metrics matrix saved as tab-delimited text file.
  id: combined_metrics
  label: Combined metrics matrix
  outputBinding:
    glob: '*txt'
  type: File
requirements:
- class: InlineJavascriptRequirement
