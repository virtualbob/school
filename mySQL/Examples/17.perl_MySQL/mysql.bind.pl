#!/usr/bin/perl
use DBI;
use strict;

my $DB_Database="mysql";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error number $DBI::err): $DBI::errstr\n");

my $count=0;

my $Query="SELECT * from user where User=? and Host=?";
my $sth=$dbh->prepare($Query);
$sth->execute('sarah', 'localhost');
while(my $ref=$sth->fetchrow_hashref("NAME_uc"))
{
    print "User=$ref->{USER}\tHost=$ref->{HOST}\n";
    $count++;
}

printf "\nTotal:%d\n", $count;

$sth->finish();
$dbh->disconnect();
