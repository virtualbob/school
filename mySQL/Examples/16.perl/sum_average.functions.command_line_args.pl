#!/usr/bin/perl
use strict;

# If the user hasn't provided any command-line arguments, provide a
# helpful error message.
if((@ARGV==0))
{
    die("Syntax: $0 Number_1 Number_2 Number_3 ...\n");
}

print "\nThe total is:   ", sum(@ARGV);
print "\nThe average is: ", average(@ARGV);

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
#    return sprintf("%.2f", sum(@_)/(@_));
}
