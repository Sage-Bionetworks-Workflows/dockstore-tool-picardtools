baseCommand:
- picard.sh
- SamToFastq
class: CommandLineTool
cwlVersion: v1.0
doc: "Use Picard to convert BAM to FASTQ.\n\nOriginal command:\njava -Xmx4G -jar $PICARD\
  \ SamToFastq \\\n  INPUT=/dev/stdin \\\n  FASTQ=\"${fastqdir}/${sample}.r1.fastq\"\
  \ \\\n  SECOND_END_FASTQ=\"${fastqdir}/${sample}.r2.fastq\" \\\n  VALIDATION_STRINGENCY=SILENT\n"
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.3
id: picard-samtofastq
inputs:
- doc: Reads data file in SAM (or BAM) format
  id: aligned_reads_sam
  inputBinding:
    position: 1
    prefix: INPUT=
    separate: false
  label: Aligned reads SAM
  type: File
- id: reads_r1_fastq
  inputBinding:
    position: 2
    prefix: FASTQ=
    separate: false
  label: R1 reads FASTQ
  type: string
- id: reads_r2_fastq
  inputBinding:
    position: 3
    prefix: SECOND_END_FASTQ=
    separate: false
  label: R2 reads FASTQ
  type: string?
- default: LENIENT
  id: validation_stringency
  inputBinding:
    position: 4
    prefix: VALIDATION_STRINGENCY=
    separate: false
  type: string
label: Picard SamToFastq
outputs:
- id: mate_1
  label: mate 1 fastq
  outputBinding:
    glob: '*_1.fastq'
  type: File
- id: mate_2
  label: mate 2 fastq
  outputBinding:
    glob: '*_2.fastq'
  type: File
requirements:
- class: InlineJavascriptRequirement
