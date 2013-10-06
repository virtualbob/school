#!/usr/bin/perl
use strict;

my %Animals=(
    "cats"=>3,
    "dogs"=>7,
    "fish"=>4);

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

print "\n";
 
