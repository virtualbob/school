#!/usr/bin/perl
use strict;

my %Animals;
# If the user hasn't provided any command-line arguments, provide a
# helpful error message.
if(@ARGV!=2)
{
    die("Syntax: $0 [Input file] [Output file]\n");
}
# Open the file specified on the command line;  if we can't open it,
# print an error message and stop.
open(INPUTFILE, $ARGV[0])
    or
    die("Failed opening $ARGV[0]\n");

# Open the output file specified on the command line;  if we can't open it,
# print an error message and stop.
open(OUTPUTFILE, ">$ARGV[1]")
    or
    die("Failed opening $ARGV[1]\n");

# Read in from input file line by line; each line is
# automatically placed in $_
while(<INPUTFILE>)
{
    # Remove the newline at the end of the line
    chomp;

    # Split the line by commas
    my @AnimalsData=split(",", $_);

    # Assign the text before the first comma to the name
    my $AnimalName=@AnimalsData[0];

    # Assign the text between the first comma and the second comma
    # (if any) to the count
    my $AnimalCount=@AnimalsData[1];

    # Add an entry to the Animals hash for this animal name and
    # count pair:
    $Animals{$AnimalName}=$AnimalCount;
}
close(INPUTFILE);

# Process the data to calculate the total, then write to the output file
my $Total=0;
print OUTPUTFILE "Pet roll call:\n".
                 "===========\n";
while ((my $Animal, my $Count) = each(%Animals))
{
    print OUTPUTFILE "$Animal:\t$Count\n";
    $Total+=$Count;
}
print OUTPUTFILE "===========\n".
                 "Total:\t$Total\n";
