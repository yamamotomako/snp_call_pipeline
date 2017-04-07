#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log


cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`
num=$SGE_TASK_ID


mkdir -p $outdir/tmp2/split_tmp/$num
mkdir -p $outdir/tmp2/annovar_input_tmp/$num

split -l 5000000 -d -a 3 $outdir/tmp2/pileup/$num.pileup $outdir/tmp2/split_tmp/$num/p.




