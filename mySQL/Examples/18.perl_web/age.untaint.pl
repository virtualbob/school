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
    start_html("Age Page");

if(param())
{
    if(!(param('Age')=~/^([1-9][0-9])$/))
    {
        print
        font({-color=>'red'}, 'Invalid age:  must be between 10 and 99 inclusive.');
        exit 1;
    }
    my $user_age = "$1";
    print $user_age;
}
else
{
    print
    h1("Enter age"),
    p("Enter age:"),
    start_form(-action=>url(), -method=>'POST'),
    "Username: ",
    textfield(-size=>'4', -name=>'Age'),
    br(),
    submit,
    end_form;
}
print
hr(),
a({-href=>"http://www.cs.rmit.edu.au"}, "RMIT School of Computer Science and Information Technology"),
end_html;
