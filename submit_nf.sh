#!/usr/bin/env bash
#
#SBATCH --partition=defq

srun nextflow align-rna.nf -c align-rna.config

