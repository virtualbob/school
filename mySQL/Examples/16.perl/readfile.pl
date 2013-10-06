#!/usr/bin/perl
##!/opt/lampp/bin/perl
use strict;

# If the user hasn't provided one command-line argument, provide a
# helpful error message.
if(@ARGV!=1)
{
    die("Syntax: $0 [Input file]\n");
}
# Open the file specified on the command line;  if we can't open it,
# print an error message and stop.
open(INPUTFILE, $ARGV[0])
    or die("Failed opening $ARGV[0]\n");

# Read in the input file line by line
while(my $Line=<INPUTFILE>)
{
    print $Line;
}
# Close the input file
close(INPUTFILE);
