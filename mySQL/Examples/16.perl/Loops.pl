#!/usr/bin/perl
use strict;

for(my $counter=1; $counter<=10; $counter++)
{
    print "\nThe value is: $counter";
}

print "\n--------------------\n";

my $counter=1;
while($counter<=10)
{
    print "\nThe value is: $counter";
    $counter++;
}

print "\n--------------------\n";

my $counter=1;
do
{
    print "\nThe value is: $counter";
    $counter++;
}
while($counter<=10);

print "\n--------------------\n";

my $counter=1;
until($counter>10)
{
    print "\nThe value is: $counter";
    $counter++;
}

print "\n--------------------\n";

my $UserID=2;
if($UserID==1)
{
    print "Hi Dad!\n";
}
else
{
    print "Hello!\n";
}
 
