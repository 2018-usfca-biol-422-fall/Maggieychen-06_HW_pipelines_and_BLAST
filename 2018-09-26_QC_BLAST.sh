#!/bin/bash

# Maggie Chen
# 2018 September 26
# ychen254@dons.usfca.edu

# This is a script for download fastq file, run QC and generate QC report for each individual sample sequence, 
# trimming and BLAST them againist local copy of GenBank
# The data being used is from the NCBI  sequence  Read Archive study number ERP022657
# The data is from the research to demostrate whether the skin-associated bacteria community composition will match 
# the bacteria community on the keyboard and mouse used by students. 

# Before run the script please create all the driecotries needed, data, data/raw_data output output/fastqc

# Download the files in run table to the raw data directory
# the pipe and tail -n +2 is a handy way to exclude the first line
echo "Downloading files in run table to raw_data directory....."
for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
	fastq-dump -v "$SRA_number" -O data/raw_data
done

# Create QC report for each of the  runs using FastQC program 
# Can use 'cyberduck' to  tranfer reports to personal laptop
# and view files in .html formate 
echo "Generating QC report to output/fastqc directory....."
fastqc data/raw_data/*.fastq --outdir=output/fastqc

# Trim the sequence base on their quality score
# this will discard sequence under 150 base pairs
# and cut off reads when he base score is lower than 25
# create a new output directory as data/trimmed
# identify the location as data/raw_data/ when running the script
mkdir data/trimmed
echo "Trimming the sequences based on quality score into data/trimmed directory....."
for filename in data/raw_data/*.fastq
do
        TrimmomaticSE -threads 2 -phred33 "$filename" data/trimmed/"$(basename -s .fastq "$filename")".trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

# Convert fastq files into fasta files, save in data/trimmed directory
# So files can be used as BLASR queries
echo "Converting fastq to fasta files into data/trimmed directory....."
for filename in data/trimmed/*.fastq
do
        bioawk -c fastx '{print ">"$name"\n"$seq}' "$filename" > data/trimmed/'$(basename -s .fastq "$filename").fasta'
done


# In the nt database, use blastn to search for the top matches of sequences
# This will create a  blast_results.csv file as output in the output directory
# and a query_seqs.fasta file, with one row for each query sequence
mkdir output/blast
echo "BLASTING fasta files, save results into output/blast directory....."
for filename in data/trimmed/*.fasta
do
	blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/blast/"$(basename -s .trim.fasta "$filename")".csv -max_target_seqs 1 -negative_gilist /blast-db/2018-09-19_environmental_sequence.gi -query "$filename"
done
