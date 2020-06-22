$namespaces:
  s: https://schema.org/
baseCommand:
- picard.sh
- CollectAlignmentSummaryMetrics
class: CommandLineTool
cwlVersion: v1.0
doc: "Use Picard to compute alignment summary metrics.\n\nOriginal command:\njava\
  \ -Xmx8G -jar $PICARD CollectAlignmentSummaryMetrics \\\n  VALIDATION_STRINGENCY=LENIENT\
  \ \\\n  MAX_RECORDS_IN_RAM=4000000 \\\n  ASSUME_SORTED=true \\\n  ADAPTER_SEQUENCE=\
  \ \\\n  IS_BISULFITE_SEQUENCED=false \\\n  MAX_INSERT_SIZE=100000 \\\n  R=$FASTA\
  \ \\\n  INPUT=\"picard/${sample}.tmp.bam\" \\\n  OUTPUT=\"picard/${sample}/picard.analysis.CollectAlignmentSummaryMetrics\"\
  \ \\\n  TMP_DIR=\"${scratchdir}/${USER}/${sample}/\"\n"
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:1.0.0
id: picard-alignmentsummarymetrics
inputs:
- doc: Reads data file in SAM (or BAM) format
  id: aligned_reads_sam
  inputBinding:
    position: 1
    prefix: INPUT=
    separate: false
  label: Aligned reads SAM
  type: File
- doc: Reference genome sequence in FASTA format
  id: genome_fasta
  inputBinding:
    position: 2
    prefix: R=
    separate: false
  label: Genome sequence FASTA
  type: File
- default: 100000
  id: max_insert_size
  inputBinding:
    position: 3
    prefix: MAX_INSERT_SIZE=
    separate: false
  type: int
- default: 4000000
  id: max_records_in_ram
  inputBinding:
    position: 4
    prefix: MAX_RECORDS_IN_RAM=
    separate: false
  type: int
- default: 'true'
  id: assume_sorted
  inputBinding:
    position: 5
    prefix: ASSUME_SORTED=
    separate: false
  type: string
- default: 'false'
  id: is_bisulfite_seq
  inputBinding:
    position: 6
    prefix: IS_BISULFITE_SEQUENCED=
    separate: false
  type: string
- default: ''
  id: adapter_sequence
  inputBinding:
    position: 7
    prefix: ADAPTER_SEQUENCE=
    separate: false
  type: string
- default: LENIENT
  id: validation_stringency
  inputBinding:
    position: 8
    prefix: VALIDATION_STRINGENCY=
    separate: false
  type: string
- default: output_alignment_metrics.txt
  id: output_metrics_filename
  inputBinding:
    position: 9
    prefix: OUTPUT=
    separate: false
  type: string?
label: Picard CollectAlignmentSummaryMetrics module
outputs:
- doc: Picard CollectAlignmentSummaryMetrics results
  id: alignmentsummarymetrics_txt
  label: Picard AlignmentSummaryMetrics
  outputBinding:
    glob: '*txt'
  type: File
requirements:
- class: InlineJavascriptRequirement
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
