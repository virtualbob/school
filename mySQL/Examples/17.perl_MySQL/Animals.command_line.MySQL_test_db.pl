#!/usr/bin/perl
use DBI;
use strict;

my $DB_Database="AnimalDB";
my $DB_Username="root";
my $DB_Password="";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");

# Create the table
my $Query="create table Animals (Name char(10), Count int)";
my $rowsaffected=$dbh->do($Query);
if($rowsaffected && $rowsaffected==0E0)
{
    print "Operation was successful but no rows were affected\n";
}
elsif($rowsaffected)
{
    print "Operation was successful ($rowsaffected rows)\n";
}
else
{
    print "Operation failed: $DBI::errstr\n";
}
