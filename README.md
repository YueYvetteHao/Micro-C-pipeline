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

#### Step3: [Library QC](https://micro-c.readthedocs.io/en/latest/library_qc.html)
```
python3 ./Micro-C/get_qc.py -p stats.txt
```
The output should look like:
```
Total Read Pairs                              2,000,000  100%
Unmapped Read Pairs                           93,511     4.68%
Mapped Read Pairs                             1,634,938  81.75%
PCR Dup Read Pairs                            5,420      0.27%
No-Dup Read Pairs                             1,629,518  81.48%
No-Dup Cis Read Pairs                         1,286,974  78.98%
No-Dup Trans Read Pairs                       342,544    21.02%
No-Dup Valid Read Pairs (cis >= 1kb + trans)  1,480,041  90.83%
No-Dup Cis Read Pairs < 1kb                   149,477    9.17%
No-Dup Cis Read Pairs >= 1kb                  1,137,497  69.81%
No-Dup Cis Read Pairs >= 10kb                 868,972    53.33%
```

#### Step4: [Generate contact map](https://micro-c.readthedocs.io/en/latest/contact_map.html) and [annotate contact domains and loops](https://github.com/aidenlab/juicer/wiki/Feature-Annotation)
```
sbatch juicer.sh
```
