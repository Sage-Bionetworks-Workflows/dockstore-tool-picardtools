baseCommand:
- picard.sh
- CollectRnaSeqMetrics
class: CommandLineTool
cwlVersion: v1.0
doc: "Use Picard to compute alignment summary metrics.\n\nOriginal command:\njava\
  \ -Xmx8G -jar $PICARD CollectRnaSeqMetrics \\\n  VALIDATION_STRINGENCY=LENIENT \\\
  \n  MAX_RECORDS_IN_RAM=4000000 \\\n  STRAND_SPECIFICITY=NONE \\\n  MINIMUM_LENGTH=500\
  \ \\\n  RRNA_FRAGMENT_PERCENTAGE=0.8 \\\n  METRIC_ACCUMULATION_LEVEL=ALL_READS \\\
  \n  R=$FASTA \\\n  REF_FLAT=$REFFLAT \\\n  RIBOSOMAL_INTERVALS=$RIBOINTS \\\n  INPUT=\"\
  picard/${sample}.tmp.bam\" \\\n  OUTPUT=\"picard/${sample}/picard.analysis.CollectRnaSeqMetrics\"\
  \ \\\n  TMP_DIR=\"${scratchdir}/${USER}/${sample}/\"\n"
hints:
- class: DockerRequirement
  dockerPull: sagebionetworks/dockstore-tool-picardtools:0.0.1
id: picard-rnaseqmetrics
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
- doc: Picard refFlat reference
  id: picard_refflat
  inputBinding:
    position: 3
    prefix: REF_FLAT=
    separate: false
  label: Picard refFlat
  type: File
- doc: Picard ribosomal (rRNA) interval list file
  id: picard_riboints
  inputBinding:
    position: 4
    prefix: RIBOSOMAL_INTERVALS=
    separate: false
  label: Picard ribosomal intervals
  type: File
- default: 4000000
  id: max_records_in_ram
  inputBinding:
    position: 5
    prefix: MAX_RECORDS_IN_RAM=
    separate: false
  type: int
- default: NONE
  id: strand_specificity
  inputBinding:
    position: 6
    prefix: STRAND_SPECIFICITY=
    separate: false
  type: string
- default: 500
  id: minimum_length
  inputBinding:
    position: 7
    prefix: MINIMUM_LENGTH=
    separate: false
  type: int
- default: 0.8
  id: rrna_fragment_percentage
  inputBinding:
    position: 8
    prefix: RRNA_FRAGMENT_PERCENTAGE=
    separate: false
  type: float
- default: ALL_READS
  id: metric_accumulation_level
  inputBinding:
    position: 9
    prefix: METRIC_ACCUMULATION_LEVEL=
    separate: false
  type: string
- default: LENIENT
  id: validation_stringency
  inputBinding:
    position: 10
    prefix: VALIDATION_STRINGENCY=
    separate: false
  type: string
- default: output_rnaseq_metrics.txt
  id: output_metrics_filename
  inputBinding:
    position: 11
    prefix: OUTPUT=
    separate: false
  type: string?
label: Picard CollectRnaSeqMetrics
outputs:
- doc: Picard CollectRnaSeqMetrics results
  id: rnaseqmetrics_txt
  label: Picard RnaSeqMetrics
  outputBinding:
    glob: '*txt'
  type: File
requirements:
- class: InlineJavascriptRequirement
