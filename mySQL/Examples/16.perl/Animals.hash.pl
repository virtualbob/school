#!/usr/bin/perl
use strict;

print "\nHash:\n";

my %Animals=( cats=>3, dogs=>7, fish=>4);

my $Total= $Animals{cats}+ $Animals{dogs}+ $Animals{fish};

print "Pet roll call:\n".
 "===========\n".
 "cats:\t$Animals{cats}\n".
 "dogs:\t$Animals{dogs}\n".
 "fish:\t$Animals{fish}\n".
 "===========\n".
 "Total:\t$Total\n";
