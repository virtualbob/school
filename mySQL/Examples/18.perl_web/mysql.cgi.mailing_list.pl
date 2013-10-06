#!/usr/bin/perl
#use strict;
use CGI ':all';
use DBI;
#$dbh=DBI->connect("DBI:mysql:host=localhost;database=mysql", "root", "blah", {PrintError=>0, RaiseError=>1});
#$dbh=DBI->connect("DBI:mysql:host=goanna.cs.rmit.edu.au;port=57777;database=ACM", "ACMUser", "ACMPass", {PrintError=>0, RaiseError=>1});
my $dbh=DBI->connect("DBI:mysql:host=131.170.24.40;port=57777;database=ACM", "ACMUser", "ACMPass", {PrintError=>0, RaiseError=>1});

#$sth = $dbh->prepare('SELECT * FROM user');
my $results = $dbh->selectall_hashref('SELECT * FROM Mailing_List limit 3', 'ID');
#$sth->finish;
$dbh->disconnect();

my $cgi = new CGI;
my @table;
foreach my $ID (keys %$results) {
    my $tablerow = 
	    th({-align=>LEFT, -bgcolor=>SKYBLUE}, $ID).td({-bgcolor=>PINK}, [$results->{$ID}->{Name}, $results->{$ID}->{Email}]),
	    ;
    push @table, $tablerow;
}

print $cgi->header(-type=>"text/html", -charset=>"UTF-8");
print $cgi->start_html("My first Perl CGI script");
print $cgi->h1("Results");
print $cgi->table(
    {-border=>'true'},
    caption(strong('Mailing List')),
    Tr({-align=>CENTER,-valign=>TOP, -bgcolor=>LIGHTGREEN}, [th(['ID','Name','Email'])]),
    Tr([@table],
));
print $cgi->end_html;
