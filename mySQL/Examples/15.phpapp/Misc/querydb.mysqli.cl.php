<?php
print "Artists\n=======\n";

printf("%-40s %-40s\n".
	"---------------------------------------- ".
	"----------------------------------------\n",
	"artist_id", "artist_name");

// Connect to the MySQL server
if (!($connection = @ mysqli_connect("localhost", "root",
	"")))
	die("Cannot connect");

if (!(mysqli_select_db($connection, "music")))
	die("Couldn't select music database");

// Run the query on the connection
if (!($result = @ mysqli_query($connection, "SELECT * FROM artist")))
	die("Couldn't run query");

// Until there are no rows in the result set, fetch a row into
// the $row array and ...
while ($row = @ mysqli_fetch_array($result, MYSQL_ASSOC))
{
	// print out each of the columns
	foreach($row as $data)
		printf("%-40s ", $data);

	// Start a new line
	print "\n";
}
?>
