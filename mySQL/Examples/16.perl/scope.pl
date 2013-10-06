#!/usr/bin/perl

my $counter=10;
print "Before braces: $counter\n";
{
    my $counter=33;
    print "Within braces: $counter\n";
}
print "After braces:  $counter\n";

