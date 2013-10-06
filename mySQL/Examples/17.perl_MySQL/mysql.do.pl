#!/usr/bin/perl
use strict;
use DBI;

my $DB_Database="testDB";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");

my $Query="DELETE FROM tst where col1='blah1' and col2='blah2'";      # Operation failed: Table 'test.tst' doesn't exist
my $Query="DELETE FROM test where col1='xblah1' and col2='blah2'";    # Operation was successful but no rows were affected
my $Query="INSERT INTO test (col1, col2) values ('blah1', 'blah2')"; # Operation was successful (1 rows)
my $Query="DELETE FROM test where col1='blah1' and col2='blah2'";     # Operation was successful (3 rows)

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

$dbh->disconnect();
