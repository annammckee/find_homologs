#! /usr/bin/bash

##Write a script that runs a BLAST of a query file against a subject file, writes only perfect matches
#to an output file, and prints the number of perfect matches to stdout.

#renaming arguments from command-line
query="$1"
subject="$2"
output="$3"

##perform blast on the query file against the subject file where the length of the match is the same length as the 
##subject file (we know this is 28 bp per the assignment description) and the sequences are 100% identical
## output the header of the matching subject sequence (qseqid)
blastn -query "$query" -subject "$subject" -task blastn-short -perc_identity 100 -word_size 28 -outfmt '6 qseqid' -out "$output" 

##Count the number of lines in the output file to determine how many perfect matches there are
## using wc -1 < "$output" will print the number of lines without also printing the filename
##in contrast wc -1 "$output" would also print the file name
matching_sequence_count=$(wc -l < "$output")

##print the number of matching sequences to stdout
echo "Number of perfect matches: $matching_sequence_count"
