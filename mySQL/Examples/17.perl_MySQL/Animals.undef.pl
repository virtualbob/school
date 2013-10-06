#!/usr/bin/perl -w
use DBI;
use strict;

my $DB_Database="AnimalDB";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");

my $Query="SELECT Count from Animals";
my $sth=$dbh->prepare($Query);
$sth->execute();
while(my $ref=$sth->fetchrow_hashref("NAME_uc"))
{
    my $Count=$ref->{COUNT};
    if(!defined($Count))
    {
	$Count="NULL";
    }
    print "Count=$Count\n";
}
$sth->finish();
$dbh->disconnect();
