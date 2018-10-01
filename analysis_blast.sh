#!/bin/bash

for filename in output/blast/*.csv
do
	echo "$filename"
	cat "$filename" | cut -f 1 -d , | sort | uniq -c | sort | tail -5
done >> output/analysis_blast_output.txt 

