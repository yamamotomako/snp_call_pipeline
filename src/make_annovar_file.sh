#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o /home/ymako/all/log -e /home/ymako/all/log


num=$SGE_TASK_ID

inp_path="./out/pileup"
out_path="./out/annovar_input"

python make_annovar_file.py $num $inp_path $out_path



