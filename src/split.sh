#!bin/bash

#$ -S /bin/bash
#$ -cwd

mkdir -p ../data/out/split

split -l 4000000 -d -a 3 ../data/CRL_5629_R1.fastq ../data/out/split/r1.fq.
split -l 4000000 -d -a 3 ../data/CRL_5629_R2.fastq ../data/out/split/r2.fq.





