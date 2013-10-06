#!/usr/bin/perl
use strict;

# Connect to the MySQL server, run the query, store the result
use DBI;
my $dbh=DBI->connect("DBI:mysql:host=localhost;database=test", "root", "blah", {PrintError=>0, RaiseError=>1});
my $results = $dbh->selectall_hashref('SELECT * FROM Animals', 'Name');
$dbh->disconnect();

my $result=
    "Content-Type: text/html; charset=ISO-8859-1\n\n".
    "<html>".
    "<head>".
    "<title>List of Animals</title>".
    "</head><body>".
    "<h1>Pet roll call</h1>".
    "<table border='true'>".
	"<tr align='CENTER' valign='TOP' bgcolor='LIGHTGREEN'><th>Name</th><th>Count</th></tr>";

foreach my $Name (keys %$results)
{
    $result.= 
    	"<tr>".
	"<th align='left' bgcolor='SKYBLUE'>$Name</th>".
    	"<td bgcolor='PINK'>".$results->{$Name}->{Count}."</td>".
	"</tr>";
}

$result.=
    "</table>".
    "</body></html>";
print $result;
