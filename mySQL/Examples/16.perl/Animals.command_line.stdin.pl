#!/usr/bin/perl
use strict;

my %Animals;

# Read in from standard input line by line; each line is
# automatically placed in $_
while(<STDIN>)
{
     # Remove the newline at the end of the line
     chomp($_);

     # Split the line by commas and load into the AnimalsData array
     my @AnimalsData=split(",", $_);

     # Assign the text before the first comma to the name
     my $AnimalName=$AnimalsData[0];

     # Assign the text between the first comma and the second comma
     # (if any) to the count
     my $AnimalCount=$AnimalsData[1];

     # Add an entry to the Animals hash for this animal name and
     # count pair:
     $Animals{$AnimalName}=$AnimalCount;
}

# Process the data to calculate the total;  code beyond this point is
# identical to our previous example, and doesn't deal with the
# command-line arguments.
my $Total=0;
print "Pet roll call:\n".
      "===========\n";
while ((my $Animal, my $Count) = each(%Animals))
{
    print "$Animal:\t$Count\n";
    $Total+=$Count;
}
print "===========\n".
      "Total:\t$Total\n";
