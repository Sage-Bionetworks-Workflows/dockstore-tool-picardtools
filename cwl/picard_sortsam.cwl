$namespaces:
  sbg: https://www.sevenbridges.com
arguments:
- position: 0
baseCommand:
- picard.sh
- SortSam
class: CommandLineTool
cwlVersion: v1.0
doc: "Use Picard to sort a SAM or BAM file.\n\nOriginal command:\njava -Xmx8G -jar\
  \ $PICARD SortSam \\\n  INPUT=\"${indir}/${1}\" \\\n  OUTPUT=/dev/stdout \\\n  SORT_ORDER=queryname\
  \ \\\n  QUIET=true \\\n  VALIDATION_STRINGENCY=SILENT \\\n  COMPRESSION_LEVEL=0\n"
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.2-5d3bab4
id: picard_sortsam
inputs:
- doc: Reads data file in SAM (or BAM) format
  id: aligned_reads_sam
  inputBinding:
    position: 1
    prefix: INPUT=
    separate: false
  label: Aligned reads SAM
  type: File
- default: queryname
  id: sort_order
  inputBinding:
    position: 2
    prefix: SORT_ORDER=
    separate: false
  label: Sort order
  type: string
- default: 'true'
  id: quiet
  inputBinding:
    position: 3
    prefix: QUIET=
    separate: false
  label: Verbosity (QUIET)
  type: string
- default: SILENT
  id: validation_stringency
  inputBinding:
    position: 4
    prefix: VALIDATION_STRINGENCY=
    separate: false
  label: Validation stringency
  type: string
- default: 5
  id: compression_level
  inputBinding:
    position: 5
    prefix: COMPRESSION_LEVEL=
    separate: false
  label: Compression level
  type: int
- id: sorted_reads_filename
  inputBinding:
    position: 6
    prefix: OUTPUT=
    separate: false
  label: Sorted SAM filename
  type: string
label: Picard SortSam
outputs:
- doc: Sorted SAM (or BAM) file
  id: sorted_reads_bam
  label: Sorted reads SAM
  outputBinding:
    glob: '*.bam'
  type: File
requirements:
- class: InlineJavascriptRequirement
