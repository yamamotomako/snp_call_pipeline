#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log


cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`
num=$SGE_TASK_ID


region=`sed -n ${num}P $cur_dir/data/GRCh37_noScaffold_noDecoy.interval_list`


#notice: place the index bam file(.bai) at the same directory of bam file
samtools mpileup -f $cur_dir/data/GRCh37.fa $outdir/r.all.bam -r $region > $outdir/tmp2/pileup/$num.pileup



