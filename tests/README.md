- Reference fasta and gtf files were obtained from a subset of the human reference genome, downloaded from [gencode](https://www.gencodegenes.org/) (DOI: http://dx.doi.org/10.1093/nar/gky955)
- Reads for test input files were acquired from the [SRA database](https://www.ncbi.nlm.nih.gov/home/about/policies/), under accession [DRR208983](https://www.ncbi.nlm.nih.gov/sra/?term=DRR208983)

To run tests using [cwltest](https://github.com/common-workflow-language/cwltest), execute the following command:

```bash
cwltest --test test-descriptions.yaml --tool cwl-runner
```
