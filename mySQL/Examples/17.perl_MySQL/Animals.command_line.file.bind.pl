#!/usr/bin/perl
use DBI;
use strict;

# If the user hasn't provided any command-line arguments, provide a
# helpful error message.
if(@ARGV!=1)
{
    die("Syntax: $0 [Input file]\n");
}
# If the user has provided the command line arguments, fill in the
# Animals hash with the corresponding values.

# Open the file specified on the command line;  if we can't open it,
# print an error message and stop.
open(INPUTFILE, $ARGV[0])
    or die("Failed opening $ARGV[0]\n");

####################################################################
# Load data from the CSV file into the Animals hash
my %Animals;
while(<INPUTFILE>)
{
    # Remove the newline at the end of the line
    chomp;

    # Split the line by commas
    my @AnimalsData=split(",", $_);

    # Assign the text before the first comma to the name
    my $AnimalName=@AnimalsData[0];

    # Assign the text between the first comma and the second comma
    # (if any) to the count
    my $AnimalCount=@AnimalsData[1];

    # Add an entry to the Animals hash for this animal name and
    # count pair:
    $Animals{$AnimalName}=$AnimalCount;
}
close(INPUTFILE);

####################################################################
# Connect to the database
my $DB_Database="AnimalDB";
my $DB_Username="root";
my $DB_Password="";
my $dbh=DBI->connect(	"DBI:mysql:host=localhost;database=$DB_Database",
			"$DB_Username", "$DB_Password", {PrintError=>0, RaiseError=>0})
    or
    die("Failed connecting to the database (error count $DBI::err): $DBI::errstr\n");

####################################################################
# Load the data into the database; variables bound to query
my $Query="INSERT INTO Animals (Name, Count) values (?, ?)";
my $sth=$dbh->prepare($Query);
while ((my $Animal, my $Count) = each(%Animals))
{
    $sth->execute($Animal, $Count);
}

####################################################################
# Read the data from the database; query results bound to variables
my $Total=0;
print "Pet roll call:\n",
      "===========\n";

my $Query="SELECT Name, Count from Animals";
my $sth = $dbh->prepare($Query); 
$sth->execute (); 

my $Animal_Name;
my $Animal_Count;

# Bind query results to variables
$sth->bind_columns(\$Animal_Name, \$Animal_Count); 

while($sth->fetchrow_arrayref())
{
    print "$Animal_Name:\t$Animal_Count\n";
    $Total+=$Animal_Count;
}
print "===========\n",
    "Total:\t$Total\n";

# Free the statement handler and disconnect from the database
$sth->finish();
$dbh->disconnect();
