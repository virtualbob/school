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
    start_html("Select User"),
    h1("User selection page");

if(param())
{
    print
	param('Username'),
	"@",
	param('Host');
}

print
    p("Select host:"),
    start_form(-action=>url(), -method=>'POST'),
    "Username: ",
    textfield(-size=>'40', -name=>'Username', -value=>'type the username here'),
    popup_menu(-name => "Host", -values => \@results),
    br(),
    textarea(-rows=>'4', -name=>'Username', -cols=>'10'),
    submit(-name=>'submit_button', -value=>'Submit query').
    end_form,
    "url:......",url(),
    br(),
    "self_url:.",self_url(),
    br(),
    a({-href=>"http://www.cs.rmit.edu.au"}, "RMIT School of Computer Science and Information Technology"),
    end_html;
