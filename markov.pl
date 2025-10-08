#!/usr/bin/env perl

=head1 NAME

markov.pl - Taylor Swift Lyrics Markov Chain Text Generator

=head1 SYNOPSIS

    perl markov.pl [OPTIONS]

=head1 DESCRIPTION

This script generates random text using Markov chains trained on Taylor Swift song lyrics.
It analyzes the provided lyrics files and creates new sentences based on word patterns.

=head1 OPTIONS

    --lines NUM      Number of lines to generate (default: 14)
    --length NUM     Words per line (default: 10)
    --chain-length NUM  Markov chain length (default: 3)
    --help           Show this help message

=head1 AUTHOR

Created for educational purposes to demonstrate Markov chain text generation.

=cut

use strict;
use warnings;
use Algorithm::MarkovChain;
use Path::Class;
use Getopt::Long;
use Pod::Usage;
use autodie;

# Configuration
my $num_lines     = 14;
my $words_per_line = 10;
my $chain_length  = 3;
my $help          = 0;

GetOptions(
    'lines=i'        => \$num_lines,
    'length=i'       => \$words_per_line,
    'chain-length=i' => \$chain_length,
    'help|?'         => \$help,
) or pod2usage(2);

pod2usage(1) if $help;

# Input files containing lyrics
my @input_files = qw(
    wildestdreams.txt
    22.txt
    bothofus.txt
    badblood.txt
    eyesopen.txt
    blankspace.txt
    trouble.txt
    shake.txt
    oursongs.txt
    never.txt
    mean.txt
    lovestory.txt
);

my $lyrics_dir = dir('./libs');
my @symbols = ();
my $total_words = 0;

print "Loading lyrics files...\n";
print "-" x 60 . "\n";

# Process each input file
foreach my $filename (@input_files) {
    my $file = $lyrics_dir->file($filename);
    
    unless (-e $file) {
        warn "Warning: File not found: $file\n";
        next;
    }
    
    my $line_count = 0;
    my $word_count = 0;
    my $file_handle = $file->openr();
    
    while (my $line = $file_handle->getline()) {
        chomp($line);
        next if $line =~ /^\s*$/;  # Skip empty lines
        
        my @words = split(/\s+/, $line);
        push(@symbols, @words);
        
        $line_count++;
        $word_count += scalar(@words);
    }
    
    $total_words += $word_count;
    printf "%-20s %4d lines, %5d words\n", $filename, $line_count, $word_count;
}

print "-" x 60 . "\n";
print "Total words processed: $total_words\n\n";

# Build and seed the Markov chain
print "Generating text using Markov chains...\n";
print "=" x 60 . "\n\n";

my $chain = Algorithm::MarkovChain->new();
$chain->seed(symbols => \@symbols, longest => $chain_length);

# Generate random text
for (1 .. $num_lines) {
    my @generated = $chain->spew(
        length   => $words_per_line,
        complete => ['the'],
    );
    
    print join(' ', @generated) . ".\n";
}

print "\n" . "=" x 60 . "\n";
print "Generation complete!\n";
