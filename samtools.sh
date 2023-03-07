#$ -S /bin/bash
#$ -cwd
#$ -o ./log
#$ -e ./log
#$ -l s_vmem=2G
#$ -pe def_slot 8

SAMPLE=$1

set -o errexit
set -o nounset
set -x

export PATH=$PATH:/path/to/samtools

# cram file to bam
samtools view /path/to/${SAMPLE}.cram \
--thread 8 -b \
-T /path/to/reference.fa \
-o /path/to/${SAMPLE}.bam

# make list
samples=$(ls /path/to/${SAMPLE}.bam)

# samtools sort & index
for sample in $samples
do
  samtools sort $sample -o ${sample/.bam/.sorted.bam}
  samtools index ${sample/.bam/.sorted.bam}
  
  mv /path/to/${SAMPLE}* /path/to/IR/${SAMPLE}
  
done
