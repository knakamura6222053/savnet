#$ -S /bin/bash
#$ -cwd
#$ -o ./log
#$ -e ./log
#$ -l s_vem=2G
#$ -pe def_slot 8

set -o errexit
set -o nounset
set -x

export PATH=$PATH:/path/to/singularity

SAMPLE=$1

#run samtools.sh 
#move samtools.sh directory
./samtools.sh

#Create intron retention by launching savnet0.3.2.sif in singularity
singularity exec \
savnet0.3.2.sif \
intron_retention_utils \
simple_count \
/path/to/${SAMPLE}.sorted.bam \
/path/to/${SAMPLE}.intron_retention.txt
