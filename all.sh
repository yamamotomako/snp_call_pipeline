#! /bin/bash


write_usage(){
	echo ""
	echo "Usage: bash ./all.sh fastq_file_path(r1) fastq_file_path(r2) reference_fast_file_path outdir_path(absolute path) annovar_path(absolute path)"
	echo "(eg) bash ./all.sh ./data/r1.fastq ./data/r2.fastq ./data/GRCh37.fa /home/work_git/out /home/annovar"
	echo ""
}

fastq_path_r1=$1
fastq_path_r2=$2
ref_path=$3
out_dir=$4
annovar_dir=$5



if [ ! -f ${fastq_path_r1} ]; then
	echo "${fastq_path_r1} add correct path of fastq file (R1)."
	write_usage
	exit
fi

if [ ! -f ${fastq_path_r2} ]; then
	echo "${fastq_path_r2} add correct path of fastq file (R2)."
	write_usage
	exit
fi

if [ ! -f ${ref_path} ]; then
	echo "add your path of reference file."
	write_usage
	exit
fi

if [ "$4" = "" ]; then
	echo "add your path of output_directory."
	write_usage
	exit
fi

if [ ! -d ${annovar_dir} ]; then
	echo "add your path of annovar directory."
	write_usage
	exit
fi


#remove last slash
if [ ${fastq_file_r1:-1} = "/" ]; then
	$fastq_file_r1=`rev | cut -c 1 | rev`
fi

if [ ${fastq_file_r2:-2} = "/" ]; then
	$fastq_file_r2=`rev | cut -c 1 | rev`
fi

if [ ${ref_path:-1} = "/" ]; then
	$ref_path=`rev | cut -c 1 | rev`
fi

if [ ${out_dir:-1} = "/" ]; then
	$out_dir=`rev | cut -c 1 | rev`
fi

if [ ${annovar_dir:-1} = "/" ]; then
	$annovar_dir=`rev | cut -c 1 | rev`
fi


#write args directory
rm -f ./tmp_path
echo $fastq_path_r1 >> ./tmp_path
echo $fastq_path_r2 >> ./tmp_path
echo $ref_path >> ./tmp_path
echo $out_dir >> ./tmp_path
echo $annovar_dir >> ./tmp_path



#make log directory
rm -rf ./log
rm -rf $out_dir
mkdir -p ./log
chmod 766 ./log
mkdir -p $out_dir
chmod 766 $out_dir

#make reference index
bwa index -p ./data/human_index $ref_path

#alignment
qsub -N job1 ./src/runall.sh

#annotation
qsub -N job2 -hold_jid job1 ./src2/runall.sh




