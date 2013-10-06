#!/usr/bin/perl
use strict;

my %Animals;
# If the user hasn't provided a non-zero even number of command-line
# arguments, provide a helpful error message.
if((@ARGV==0) || (@ARGV%2))
{
    die("Syntax: $0 [Animal One Name] [Animal One Count] ".
	"[Animal Two Name] [Animal Two Count] ...\n");
}
# If the user has provided the command line arguments, fill in the
# Animals hash with the corresponding values.
while(@ARGV)
{
    # Read in an argument and take this as the animal name
    my $AnimalName=shift(@ARGV);

    # Read in another argument and take this as the count for this animal
    my $AnimalCount=shift(@ARGV);

    # Add an entry to the Animals hash for this animal name and
    # count pair:
    $Animals{$AnimalName}=$AnimalCount;
}

# Process the data to calculate the total;  code beyond this point is
# identical to our previous example, and doesn't deal with the command
# line arguments.
my $Total=0;
print "Pet roll call:\n",
    "===========\n";
while ((my $Animal, my $Count) = each(%Animals))
{
    print "$Animal:\t$Count\n";
    $Total+=$Count;
}
print "===========\n",
    "Total:\t$Total\n";
