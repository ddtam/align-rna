
# RNA alignment workflow

This repository contains a Nextflow workflow that generates alignments, gene quantification, and alignment sumamries from bulk RNA-seq FASTQs. This was written with the specific intention of processing libraries to be futher analysed by the [DROP pipeline](https://github.com/gagneurlab/drop).

## Inputs

The workflow requires the following inputs:

- Sample annotation file that is tab delimited, with `Sample ID` in the first column
    - Identifier in the `Sample ID` column should match the **first part of the FASTQ file name**, delimited by underscores from other information in the file name
        - e.g. Sample ID `DH141401` has paired end reads in `DH141401_RNA_01.fastq` and `DH141401_RNA_02.fastq`
- Directory containing FASTQ read pairs
- Nextflow configuration file, specifying run parameters, including:
    - Path to sample annotation file
    - Path to input directory containing FASTQs
    - Path to output directory
    = Paths to STAR and HISAT2 specific index files and directories

## Execution

The workflow is written in Nextflow. A SLURM submission script is written at `submit_nf.sh` and can be scheduled using

```
sbatch ./submit_nf.sh
```

## Outputs

Outputs will be found in the output directory specified in the configuration file. One of the following will be generated for every sample entry in the annotation file:

- `.BAM`, `.BAI`: alignment and index files
- `.BW`: coverage summary track
- `_gene.counts` and `_exon.counts`: quantification of gene- and exon-level expression using `featureCounts`

