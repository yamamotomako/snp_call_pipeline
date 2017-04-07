#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
fastq_path_r1=`sed -n 1P $cur_dir/tmp_path`
fastq_path_r2=`sed -n 2P $cur_dir/tmp_path`
outdir=`sed -n 4P $cur_dir/tmp_path`

mkdir -p $outdir/tmp/split

split -l 4000000 -d -a 3 $fastq_path_r1 $outdir/tmp/split/r1.fq.
split -l 4000000 -d -a 3 $fastq_path_r2 $outdir/tmp/split/r2.fq.





