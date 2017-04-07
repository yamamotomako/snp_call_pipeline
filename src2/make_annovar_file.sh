#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`


num=$SGE_TASK_ID

mkdir -p $outdir/tmp2/annovar_input

inp_path=$outdir/tmp2/pileup
out_path=$outdir/tmp2/annovar_input

python $cur_dir/src2/make_annovar_file.py $num $inp_path $out_path



