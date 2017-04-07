#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`

mkdir -p $outdir/tmp/split_sam
mkdir -p $outdir/tmp/split_bam

mkdir -p $outdir/tmp/split_sort


num=$SGE_TASK_ID
num=`expr $num - 1`

if [ $num -lt 10 ]; then
	num="00"$num

elif [ $num -lt 100 ]; then
	num="0"$num

fi


bwa mem $cur_dir/data/human_index $outdir/tmp/split/r1.fq.$num $outdir/tmp/split/r2.fq.$num > $outdir/tmp/split_sam/r.sam.$num

samtools view -S -b -h $outdir/tmp/split_sam/r.sam.$num > $outdir/tmp/split_bam/r.bam.$num

samtools sort $outdir/tmp/split_bam/r.bam.$num $outdir/tmp/split_sort/r.sort.$num


