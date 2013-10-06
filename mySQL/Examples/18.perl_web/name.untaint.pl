#!/usr/bin/perl
use strict;

# Connect to the MySQL server, run the query, store the result
use DBI;
my $dbh=DBI->connect("DBI:mysql:host=localhost;database=mysql", "root", "blah", {PrintError=>0, RaiseError=>1});
my @results = @{ $dbh->selectcol_arrayref ('SELECT Host FROM user')};
$dbh->disconnect();

# Prepare and display the results in HTML format
use CGI ':all';

print 
    header(-type=>"text/html"),
    start_html("Name Page");

if(param())
{
    if(!(param('Name')=~/^([A-Z][a-z]{0,9})$/))
    {
	print
	    font({-color=>'red'},
		'Invalid name:  must comprise only letters, '.
		'be at most ten characters long, ',
		'and have only the first letter capitalized.');
	exit;
    }
    my $Name = "$1";
    print $Name;
}
else
{
    print
    h1("Enter Name"),
    p("Enter Name:"),
    start_form(-action=>url(), -method=>'POST'),
    "Username: ",
    textfield(-size=>'4', -name=>'Name'),
    br(),
    submit,
    end_form;
}
print
hr(),
a({-href=>"http://www.cs.rmit.edu.au"}, "RMIT School of Computer Science and Information Technology"),
end_html;
