#!/usr/bin/perl
use strict;

print "\nThe total is:   ", sum(1, 5, 7);
print "\nThe average is: ", average(1, 5, 7);

# Function to calculate the sum of all the numbers passed to it
sub sum
{
    my $Total=0;
    while(my $value=shift)
    {
        $Total+=$value;
    }
    return $Total;
}

# Function to calculate the average of all the numbers passed to it
# This function calls the sum function internally.
sub average
{
    return sum(@_)/(@_);
}
