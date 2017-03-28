#!bin/bash

#$ -S /bin/bash
#$ -cwd
#$ -o /home/ymako/all/log -e /home/ymako/all/log


cat ./out/annovar_input/* > ./annovar_input_all.txt


#annovar
perl ../annovar/table_annovar.pl ./annovar_input_all.txt ../annovar/humandb/ -buildver hg19 -out myanno -remove -protocol refGene,cytoBand,genomicSuperDups,esp6500siv2_all,1000g2015aug_all,1000g2015aug_eur,exac03,cosmic70,avsnp147,dbnsfp30a -operation g,r,r,f,f,f,f,f,f,f --otherinfo










