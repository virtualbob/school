#!/usr/bin/perl
use DBI;
use strict;

my $DB_Database="music";
my $DB_Username="root";
my $DB_Password="";
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

print "\n\nStandard select:\n";
while(my $ref=$sth->fetchrow_hashref())
{
    printf ("%-5s %-128s\n", $ref->{artist_id}, $ref->{artist_name});
    $count++;
}
$sth->finish();

print "\n\nUppercase:\n";
my $sth=$dbh->prepare($Query);
$sth->execute();
#while(my $ref=$sth->fetchrow_hashref(""))
#while(my $ref=$sth->fetchrow_hashref("NAME_lc"))
while(my $ref=$sth->fetchrow_hashref("NAME_uc"))
{
    printf ("%-5s %-128s\n", $ref->{ARTIST_ID}, $ref->{ARTIST_NAME});
    $count++;
}
$sth->finish();

print "\n\narray:\n";
my $sth=$dbh->prepare($Query);
$sth->execute();
while(my @val=$sth->fetchrow_array())
{
    printf ("%-5s %-128s\n", $val[0], $val[1]);
    $count++;
}
$sth->finish();

print "\n\narrayref:\n";
my $sth=$dbh->prepare($Query);
$sth->execute();
while(my $ref=$sth->fetchrow_arrayref())
{
    printf ("%-5s %-128s\n", $ref->[0], $ref->[1]);
    $count++;
}
$sth->finish();

print "\n\nselectall_arrayref:\n";
my $ref=$dbh->selectall_arrayref($Query);
while(my $row=shift(@$ref))
{
    printf ("%-5s %-128s\n", $row->[0], $row->[1]);
    $count++;
}

print "\n\nselectall_hashref:\n";
my $ref = $dbh->selectall_hashref($Query, 'artist_id');
foreach my $artist_id (keys %$ref)
{
    printf ("%-5s %-128s\n", $artist_id, $ref->{$artist_id}->{artist_name});
    $count++;
}
$sth->finish();


printf "\nTotal:%d\n", $count;

$dbh->disconnect();
