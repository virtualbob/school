#!/usr/bin/perl
use strict;

# Declare variables to store animal names, and assign values to them
my $AnimalNameOne="cats";
my $AnimalNameTwo="dogs";
my $AnimalNameThree="fish";

# Declare variables to store animal counts, and assign values to them
my $AnimalCountOne=3;
my $AnimalCountTwo=7;
my $AnimalCountThree=4;

# Calculate the sum of the animal counts
my $Total=$AnimalCountOne+$AnimalCountTwo+$AnimalCountThree;

# Display the counts and total
print "Pet roll call:\n".
 "===========\n".
 "$AnimalNameOne:\t$AnimalCountOne\n".
 "$AnimalNameTwo:\t$AnimalCountTwo\n".
 "$AnimalNameThree:\t$AnimalCountThree\n".
 "===========\n".
 "Total:\t$Total\n";
