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


print "\n";

my @AnimalName=("cats", "dogs", "fish");
#my @AnimalName=qw(cats dogs fish);
my @AnimalCount=(3, 7, 4);
my $Total=$AnimalCount[0]+$AnimalCount[1]+$AnimalCount[2];

print "Pet roll call:\n".
    "===========\n".
    "$AnimalName[0]:\t$AnimalCount[0]\n".
    "$AnimalName[1]:\t$AnimalCount[1]\n".
    "$AnimalName[2]:\t$AnimalCount[2]\n".
    "===========\n".
    "Total:\t$Total\n";



print "\nHash:\n"; 

my %Animals=(
    cats=>3,
    dogs=>7,
    fish=>4);

#my %Animals=qw(
#    cats 3
#    dogs 7
#    fish 4);
my $Total=
    $Animals{cats}+
    $Animals{dogs}+
    $Animals{fish};

print "Pet roll call:\n".
    "===========\n".
    "cats:\t$Animals{cats}\n".
    "dogs:\t$Animals{dogs}\n".
    "fish:\t$Animals{fish}\n".
    "===========\n".
    "Total:\t$Total\n";

# Extract the keys of the Animals hash into the AnimalName array
my @AnimalName = keys %Animals;
my $Total=
    $Animals{$AnimalName[0]}+
    $Animals{$AnimalName[1]}+
    $Animals{$AnimalName[2]};
print "Pet roll call:\n".
    "===========\n".
    "$AnimalName[0]:\t$Animals{$AnimalName[0]}\n".
    "$AnimalName[1]:\t$Animals{$AnimalName[1]}\n".
    "$AnimalName[2]:\t$Animals{$AnimalName[2]}\n".
    "===========\n".
    "Total:\t$Total\n";







print "\n";

my %Animals=(
    "cats"=>3,
    "dogs"=>7,
    "fish"=>4);

my $Total=0;
print "Pet roll call:\n".
    "===========\n";
foreach my $AnimalName (keys %Animals)
{
    $Total+=$Animals{$AnimalName};
    print "$AnimalName:\t$Animals{$AnimalName}\n";
}
print "===========\n".
    "Total:\t$Total\n";

print "\n";

my %Animals=(
    "cats"=>3,
    "dogs"=>7,
    "fish"=>4);

my $Total=0;
print "Pet roll call:\n".
    "===========\n";
while ((my $AnimalName, my $Count) = each(%Animals))
{
    $Total+=$Count;
    print "$AnimalName:\t$Count\n";
}
print "===========\n".
    "Total:\t$Total\n";

print "\n";


my $Answer=42;
print "The answer is: $Answer\n";
print 'The answer is: $Answer\n';

print "\n";

print q{test test\n};
print qq{test test\n};
print qw{test test 1 2\n};

print "\n";

print "This is Sarah's bag.";
print 'He said, "This is fun!"';

print "\n";

print 'This is Sarah\'s bag.';
print "He said, \"This is fun!\"";

print "\n";

print q(This is Sarah's bag.);
print qq(He said, "This is fun!");

print "\n";
 
