#!/usr/bin/perl
use DBI;
use strict;

my $DB_Database="music";
my $DB_Username="root";
my $DB_Password="blah";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password",
			{PrintError=>0, RaiseError=>0})
or
     die("Failed connecting to the database
	 (error number $DBI::err):$DBI::errstr\n");

my $count=0;

my $Query="SELECT * FROM artist";
my $sth=$dbh->prepare($Query);
$sth->execute();

printf ("%-5s %-30s\n", "ID:", "Name:");
printf ("%-5s %-30s\n", "---", "------------------------");
while(my $ref=$sth->fetchrow_hashref())
{
    printf ("%-5s %-128s\n", $ref->{artist_id}, $ref->{artist_name});
    $count++;
}

printf ("\nTotal:%d\n", $count);

$sth->finish();
$dbh->disconnect();
