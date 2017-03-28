#!bin/bash

#$ -S /bin/bash
#$ -cwd


qsub -N job1 ../src/split.sh

qsub -N job2 -hold_jid job1 -l s_vmem=12G,mem_req=12G -t 1-83:1 ../src/alignment.sh

qsub -N job3 -hold_jid job1,job2 ../src/merge.sh


