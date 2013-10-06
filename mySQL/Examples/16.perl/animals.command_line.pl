#!/usr/bin/perl
use strict;

my %Animals;
# If the user hasn't provided the correct number of command-line
# arguments, provide a helpful error message.
if(@ARGV!=3)
{
    die("Syntax: $0 [count of cats] [count of dogs] [count of fish]\n");
}
# If the user has provided the command line arguments, fill in the
# Animals hash with the corresponding values.
%Animals=(
    "cats"=>$ARGV[0],
    "dogs"=>$ARGV[1],
    "fish"=>$ARGV[2]);

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
