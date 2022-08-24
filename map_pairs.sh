#!/bin/bash
#SBATCH --job-name=microc_map     # Job name
##SBATCH --mail-type=START, END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=yhao@tgen.org     # Where to send mail, change this 
#SBATCH --ntasks=16                    # Number of CPUs
#SBATCH --mem=64gb                     # Job memory request
#SBATCH --time=24:00:00               # Time limit hrs:min:sec
#SBATCH --output=microc_map_%j.log      # Standard output and error log


# Working directory [Change to your working directory]

cd /scratch/yhao/Micro-C


module load Python/3.8.2-GCCcore-9.3.0
module load BEDTools/2.29.0
module load bwa/0.7.17
module load samtools/1.9 

#Use the index file to generate the genome file by printing the first two columns into a new file.
#cut -f1,2 /home/tgenref/homo_sapiens/grch38_hg38/public_databases/gencode.v29/GRCh38.primary_assembly.genome.fa.fai > hg38.genome

# [Change input file names]
# [Change temp directory location]
bwa mem -5SP -T0 -t16 /home/tgenref/homo_sapiens/grch38_hg38/public_databases/gencode.v29/bwaIndex/GRCh38.primary_assembly.genome MicroC_2M_R1.fastq MicroC_2M_R2.fastq | pairtools parse --min-mapq 40 --walks-policy 5unique --max-inter-align-gap 30 --nproc-in 8 --nproc-out 8 --chroms-path hg38.genome | pairtools sort --tmpdir=/scratch/yhao/Micro-C/temp/ --nproc 16|pairtools dedup --nproc-in 8 --nproc-out 8 --mark-dups --output-stats stats.txt|pairtools split --nproc-in 8 --nproc-out 8 --output-pairs mapped.pairs --output-sam -|samtools view -bS -@16 | samtools sort -@16 -o mapped.PT.bam;samtools index mapped.PT.bam

