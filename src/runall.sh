#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`

qsub -N job1 $cur_dir/src/split.sh

#qsub -N job2 -hold_jid job1 ./src/count.sh

qsub -N job2 -hold_jid job1 -l s_vmem=12G,mem_req=12G -t 1-83:1 $cur_dir/src/alignment.sh

qsub -N job3 -hold_jid job2 $cur_dir/src/merge.sh


