#!/usr/bin/perl
use DBI;
use strict;

# If the user hasn't provided any command-line arguments, provide a
# helpful error message.
if(@ARGV!=1)
{
    die("Syntax: $0 [Output file]\n");
}

my $DB_Database="AnimalDB";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:
			host=localhost;mysql_socket=/var/lib/mysql/mysql.sock;database=$DB_Database",
			"$DB_Username", "$DB_Password",
			{PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");


my $Query="SELECT Name, SUM(Count) FROM Animals GROUP BY Name";
my $sth = $dbh->prepare($Query); 
$sth->execute (); 

# Bind query results to variables
my $Animal_Name;
my $Animal_Count;
$sth->bind_columns(\$Animal_Name, \$Animal_Count); 

# Open the file specified on the command line;  if we can't open it,
# print an error message and stop.
open(OUTPUTFILE, ">$ARGV[0]")
    or die("Failed opening $ARGV[0]\n");

# Write header row with column names
print OUTPUTFILE "Name,Count\n";

# Iterate through the results and write them as comma-separated values
# to the output file
while($sth->fetchrow_arrayref())
{
#    $Animal_Name=~s/,/\\,/g;
    print OUTPUTFILE "\"$Animal_Name\",\"$Animal_Count\"\n";
}
$sth->finish();
$dbh->disconnect();

close(OUTPUTFILE);
