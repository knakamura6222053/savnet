1.Execute run.sh and create intron_retention.txt
※ command : seq 1 10 | while read line; do qsub /path/to/run.sh ${line}; done       # seq 1 10 is sampleID
