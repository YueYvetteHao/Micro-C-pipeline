# [Micro-C](https://micro-c.readthedocs.io/en/latest/index.html) pipeline

#### Step0: [Install dependencies](/Dependencies.md)

#### Step1: Generate .genome file for the reference

```
cut -f1,2 /home/tgenref/homo_sapiens/grch38_hg38/public_databases/gencode.v29/GRCh38.primary_assembly.genome.fa.fai > hg38.genome
```

#### Step2: [From fastq to final valid pairs bam file](https://micro-c.readthedocs.io/en/latest/fastq_to_bam.html)
```
sbatch map_pairs.sh
```
