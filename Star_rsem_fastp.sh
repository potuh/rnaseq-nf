---
title: "shell_script_NF_CORE_RNAseq"
author: "Hemanth Potu"
date: "05/18/2024"
---
A shell script is a bunch of bash commands that will be run in a row. We can also add other
languages by calling them up. In this case we will also invoke nextflow.
So basically you can think of the .sh file as a list of tasks to run the pipeline rather
that typing them in one by one 
''' {bash}
#!/bin/bash
#SBATCH -p batch
#SBATCH --job-name=nfcore_rnaseq
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=hemanthp@udel.edu
#SBATCH --ntasks=6
#SBATCH --mem=32000
#SBATCH --time=10:00:00
#SBATCH --output=nextflow.out
#SBATCH --error=nextflow.err

pwd; hostname; date
echo "Here we go You've requested $SLURM_CPUS_ON_NODE core."

/home/hemanthp/bin/nextflow run nf-core/rnaseq -r 3.14.0 \
-resume \
-profile singularity \
--input /home/hemanthp/samplesheet.csv \
--outdir /home/hemanthp \
--fasta /work/binf694/project_1/reference/human-hisat2/grch38/Homo_sapiens.GRCh38.dna.primary_assembly.fa \
--gtf /work/binf694/project_1/reference/human-hisat2/grch38/Homo_sapiens.GRCh38.84.gtf \
--trimmer fastp \
--aligner star_rsem \
--pseudo_aligner salmon \
--gencode \
--email hemanthp@udel.edu \
-c /home/hemanthp/nextflow1.config
'''
