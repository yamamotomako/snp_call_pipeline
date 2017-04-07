#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`

mkdir -p $outdir/tmp2
mkdir -p $outdir/tmp2/pileup


#count total file
qnum=`cat $cur_dir/data/GRCh37_noScaffold_noDecoy.interval_list | wc -l`

#samtools pileup
qsub -N job1 -l s_vmem=12G,mem_req=12G -t 1-$qnum:1 $cur_dir/src2/pileup.sh

#prepare annovar input file
qsub -N job2 -hold_jid job1 -t 1-$qnum:1 $cur_dir/src2/make_annovar_file.sh


#merge & annovar
qsub -N job3 -hold_jid job2 $cur_dir/src2/cat.sh







