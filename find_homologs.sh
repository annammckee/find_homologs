#! /usr/bin/bash

##Write a script that runs a BLAST of a query file against a subject file, writes only perfect matches
#to an output file, and prints the number of perfect matches to stdout.

#renaming arguments from command-line
query="$1"
subject="$2"
output="$3"


##changed the blastn command to tblastn to screen a protein sequence (query) against nucleotide seqs
## want at least 30% identity
## only want results that have at least a 90% match length
tblastn -query "$query" -subject "$subject" -perc_identity 30 -outfmt '6' -out "$output" | awk '$4/$13' ;> 0.9 "$output" > "$output" | wc -l "$output"


echo "Number of matches: $output"
