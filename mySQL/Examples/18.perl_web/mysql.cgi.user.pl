#!/usr/bin/perl
use strict;

# Connect to the MySQL server, run the query, store the result
use DBI;
my $dbh=DBI->connect("DBI:mysql:host=localhost;database=mysql", "root", "blah", {PrintError=>0, RaiseError=>1});
my $results = $dbh->selectall_hashref('SELECT * FROM user', 'User');
$dbh->disconnect();


# Prepare and display the results in HTML format
use CGI ':all';
my @table;
foreach my $User (keys %$results)
{
    my $tablerow = 
	    th({-align=>"LEFT", -bgcolor=>"SKYBLUE"}, $User).
	    td({-bgcolor=>"PINK"}, [$results->{$User}->{Host}, $results->{$User}->{Password}]);
    push @table, $tablerow;
}

my $result=
    header(-type=>"text/html").
    start_html(-title=>"List of Users").
    h1("Query Result").
    table(
	{-border=>'true'},
	Tr({-align=>"CENTER",-valign=>"TOP", -bgcolor=>"LIGHTGREEN"}, [th(['User','Host','Password'])]),
	Tr([@table],
    )).
    end_html;
print $result;

#table can have a entry:	caption(strong('List of users')),

#Alternatively, without CGI.pm:
my $result=
    "Content-Type: text/html; charset=ISO-8859-1\n\n".
    "<html>".
    "<head>".
    "<title>List of Users</title>".
    "</head><body>".
    "<title>List of Users</title>".
    "<h1>Query Result</h1>".
    "<table border='true'>".
	"<tr align='CENTER' valign='TOP' bgcolor='LIGHTGREEN'><th>User</th><th>Host</th><th>Password</th></tr>";

foreach my $User (keys %$results)
{
    $result.= 
    	"<tr>".
	"<th align='left' bgcolor='SKYBLUE'>$User</th>".
    	"<td bgcolor='PINK'>".$results->{$User}->{Host}."</td><td bgcolor='PINK'>".$results->{$User}->{Password}."</td>".
	"</tr>";
}

$result.=
    "</table>".
    "</body></html>";
print $result;



#both header and start_html can take a charset argument
