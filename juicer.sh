#!/bin/bash
#SBATCH --job-name=juicer     # Job name
##SBATCH --mail-type=START, END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=yhao@tgen.org     # Where to send mail, change this 
#SBATCH --ntasks=16                    # Number of CPUs
#SBATCH --mem=64gb                     # Job memory request
#SBATCH --time=24:00:00               # Time limit hrs:min:sec
#SBATCH --output=juicer_%j.log      # Standard output and error log


# Working directory [Change to your working directory]
cd /scratch/yhao/Micro-C


java -Xmx48000m  -Djava.awt.headless=true -jar ./Micro-C/juicertools.jar pre --threads 16 mapped.pairs contact_map.hic hg38.genome

java -Xmx48000m  -Djava.awt.headless=true -jar ./Micro-C/juicertools.jar hiccups --threads 16 contact_map.hic hiccups --ignore-sparsity

java -Xmx48000m  -Djava.awt.headless=true -jar ./Micro-C/juicertools.jar arrowhead --threads 16 contact_map.hic contact_domains_list --ignore-sparsity
