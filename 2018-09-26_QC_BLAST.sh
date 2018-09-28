#!/bin/bash

# Maggie Chen
# 2018 September 26
# ychen254@dons.usfca.edu

# This is a script for download fastq file, run QC check, trimming and BLAST them
# againist local copy of GenBank
# The data being used is from the NCBI  sequence  Read Archive study number ERP022657
# The data is from the research to demostrate whether the skin-associated bacteria community composition will match 
# the bacteria community on the keyboard and mice used by students. 


# Download the files in run table to the raw data directory
# the pipe and tail -n +2 is a handy way to exclude the first line
echo "Downloading files in run table to raw data directory....."
for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
	fastq-dump -v $SRA_number -O data/raw_data
done


