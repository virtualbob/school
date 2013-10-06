#!/usr/bin/perl
use strict;

# Connect to the MySQL server, run the query, store the result
use DBI;
my $dbh=DBI->connect("DBI:mysql:host=localhost;database=AnimalDB",
                     "root", "blah", {PrintError=>0, RaiseError=>1});

# Prepare and display the results in HTML format
use CGI ':all';

print header(-type=>"text/html", -charset=>'UTF-8');


my @results;
if(!param())
{
    @results = @{ $dbh->selectcol_arrayref ("SELECT Name FROM Animals order by Name")};

    print
        start_html(-title=>"Animal Selection Page", -encoding => 'UTF-8').
        h1("Select Animal").
        p("Select the animal name from the list: ").
        start_form(-action=>url(), -method=>'POST').
        "Animal Name: ".
        popup_menu(-name => "Name", -values => \@results).
        br().
        submit(-name=>'submit_button', -value=>'Submit query').
        end_form;
}
else
{
    my $Query="SELECT Count FROM Animals where Name='".param("Name")."'";
    @results = @{ $dbh->selectcol_arrayref ($Query)}
        or die("Problem with query $Query: ".$DBI::errstr);
    print
        start_html(-title=>"Animal Counts Page", -encoding => 'UTF-8').
        h1("Query result").
        "The count of ".
        b(param("Name")).
        " is: ".
        @results;
}
$dbh->disconnect();

print
    hr().
    a({-href=>"http://www.ora.com"}, "O'Reilly Media").
    end_html;
