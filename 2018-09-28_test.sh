#!/bin/bash

# Trim the sequence base on their quality score
# this will discard sequence under 150 base pairs
# and cut off reads when he base score is lower than 25
# create a new output directory as data/trimmed
# identify the location as data/raw_data/ when running the script
echo "Trimming the sequences based on quality score"
for filename in "$@"
do
	TrimmomaticSE -threads 2 -phred33 "$filename" data/trimmed/$(basename -s .fastq "$filename").trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

# Convert fastq files into fasta files
# So files can be used as BLASR queries
echo "Converting fastq to fasta files....."
for filename in "$@"
do
        bioawk -c fastx '{print ">"$name"\n"$seq}' "$filename"
done


# In the nt database, use blastn to search for the top matches of sequences
# This will create a  blast_results.csv file as output in the output directory
# and a query_seqs.fasta file, with one row for each uery sequence

