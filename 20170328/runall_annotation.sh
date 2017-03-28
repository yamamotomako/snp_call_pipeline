#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o /home/ymako/work/log -e /home/ymako/work/log

mkdir -p ./out
mkdir -p ./out/pileup


#count total file
qnum=`cat ./GRCh37_noScaffold_noDecoy.interval_list | wc -l`

#samtools pileup
qsub -N job1 -l s_vmem=12G,mem_req=12G -t 1-$qnum:1 pileup.sh

#prepare annovar input file
qsub -N job2 -hold_jid job1 -t 1-$qnum:1 make_annovar_file.sh


#merge & annovar
qsub -N job3 -hold_jid job2 cat.sh







