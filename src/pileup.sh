#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o /home/ymako/all/log -e /home/ymako/all/log


num=$SGE_TASK_ID

region=`sed -n ${num}P ./GRCh37_noScaffold_noDecoy.interval_list`


#notice: place the index bam file(.bai) at the same directory of bam file
samtools mpileup -f ./GRCh37.fa ./r.all.bam -r $region > ./out/pileup/$num.pileup



