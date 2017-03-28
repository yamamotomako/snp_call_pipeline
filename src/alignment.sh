#!bin/bash

#$ -S /bin/bash
#$ -cwd


num=$SGE_TASK_ID
num=`expr $num - 1`

if [ $num -lt 10 ]; then
	num="00"$num

elif [ $num -lt 100 ]; then
	num="0"$num

fi


mkdir -p ../data/out/split_sam
mkdir -p ../data/out/split_bam
mkdir -p ../data/out/split_sort


../bin/bwa mem human_index ../data/out/split/r1.fq.$num ../data/out/split/r2.fq.$num > ../data/out/split_sam/r.sam.$num

../bin/samtools view -S -b -h ../data/out/split_sam/r.sam.$num > ../data/out/split_bam/r.bam.$num

../bin/samtools sort ../data/out/split_bam/r.bam.$num ../data/out/split_sort/r.sort.$num


