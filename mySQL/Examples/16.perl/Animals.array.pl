#!/usr/bin/perl
use strict;

my @AnimalName=("cats", "dogs", "fish");
my @AnimalCount=(3, 7, 4);
my $Total=$AnimalCount[0]+$AnimalCount[1]+$AnimalCount[2];

print "Pet roll call:\n".
 "===========\n".
 "$AnimalName[0]:\t$AnimalCount[0]\n".
 "$AnimalName[1]:\t$AnimalCount[1]\n".
 "$AnimalName[2]:\t$AnimalCount[2]\n".
 "===========\n".
 "Total:\t$Total\n";
