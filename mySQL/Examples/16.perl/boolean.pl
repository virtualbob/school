#!/usr/bin/perl
use strict;

my $Value=80;

if( ($Value > 80) or ( ($Value < 75) and not ($Value == 73)) )
{
    print "The value is greater than 80 or less than 75, but is not 73\n";
}
if( ($Value > 80) || ( ($Value < 75) &&  !   ($Value == 73)) )
{
    print "The value is greater than 80 or less than 75, but is not 73\n";
}
