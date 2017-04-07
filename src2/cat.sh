#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o ./log -e ./log

cur_dir=`pwd`
outdir=`sed -n 4P $cur_dir/tmp_path`
annovar_dir=`sed -n 5P $cur_dir/tmp_path`

cat $outdir/tmp2/annovar_input/* > $outdir/tmp2/annovar_input_all.txt


#annovar
perl $annovar_dir/table_annovar.pl $outdir/tmp2/annovar_input_all.txt $annovar_dir/humandb/ -buildver hg19 -out $outdir/myanno -remove -protocol refGene,cytoBand,genomicSuperDups,esp6500siv2_all,1000g2015aug_all,1000g2015aug_eur,exac03,cosmic70,avsnp147,dbnsfp30a -operation g,r,r,f,f,f,f,f,f,f --otherinfo










