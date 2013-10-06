#!/usr/bin/perl
use strict;

my $Answer;
while(@ARGV)
{
    $Answer+=shift(@ARGV);
}
print "Answer: $Answer\n"
