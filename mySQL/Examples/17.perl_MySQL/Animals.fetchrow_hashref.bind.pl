#!/usr/bin/perl
use DBI;
use strict;

my $DB_Database="AnimalDB";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
                        "$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");

# Process the data to calculate the total;

my $Animal_Name;
my $Animal_Count;

my $Total=0;
print "Pet roll call:\n".
      "===============\n";

my $Query="SELECT Name, Count FROM Animals";
my $sth = $dbh->prepare($Query);
$sth->execute ();

# Bind query results to variables
$sth->bind_columns(\$Animal_Name,\ $Animal_Count);

while($sth->fetchrow_arrayref())
{
    print "$Animal_Name:\t$Animal_Count\n";
    $Total+=$Animal_Count;
}
print "===========\n".
      "Total:\t$Total\n";

$sth->finish();
$dbh->disconnect();
