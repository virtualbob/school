#!/usr/bin/perl
##!/opt/lampp/bin/perl
use strict;

# Connect to the MySQL server, run the query, store the result
use DBI;
my $dbh=DBI->connect("DBI:mysql:host=localhost;database=AnimalDB",
    "root",
    "blah",
    {PrintError=>0, RaiseError=>1});
my $results = $dbh->selectall_hashref('SELECT * FROM Animals', 'Name');
$dbh->disconnect();

# Prepare and display the results in HTML format
use CGI ':all';

my @AnimalsDataArray;
foreach my $Name (keys %$results)
{
    my $AnimalsDataArrayRow = 
	    th({-align=>"LEFT", -bgcolor=>"SKYBLUE"}, $Name).
	    td({-bgcolor=>"PINK"}, [$results->{$Name}->{Count}]);
    push @AnimalsDataArray, $AnimalsDataArrayRow;
}

my $result=
    header(-type=>"text/html", -charset=>'UTF-8').
    start_html(-title=>"List of Animals", -encoding => 'UTF-8').
    h1("Pet roll call").
    table(
	{-border=>'true'},
	Tr({-align=>"CENTER",-valign=>"TOP", -bgcolor=>"LIGHTGREEN"}, [th(['Name','Count'])]),
	Tr([@AnimalsDataArray])
    ).
    end_html;
print $result;
