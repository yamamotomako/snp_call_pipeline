#!bin/bash

#$ -S /bin/bash
#$ -cwd


str=`ls -d ../data/out/split_sort/* | tr "\n" " "`


../bin/samtools merge ../results/r.all.bam $str

../bin/samtools index ../results/r.all.bam

