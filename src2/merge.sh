#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`
num=$SGE_TASK_ID

cat $outdir/tmp2/annovar_input_tmp/$num/* > $outdir/tmp2/annovar_input/an.all.$num


