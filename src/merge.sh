#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`

str=`ls -d $outdir/tmp/split_sort/* | tr "\n" " "`


samtools merge -f $outdir/r.all.bam $str

samtools index -f $outdir/r.all.bam

