<?php
if(!empty($_GET))
{
    // Include database parameters and related functions
    require_once("../db.php");
    $DB_databasename='music';
    // Connect to the MySQL DBMS and use the wedding database - credentials are in the file db.php
    if(!($connection= mysqli_connect($DB_hostname, $DB_username, $DB_password, $DB_databasename)))
        showerror($connection);

    // Untaint the artist name, and use at most 15 characters
    $artist_name = clean($_GET["artist_name"], 15);

    // Add the artist, using the next available artist_id
    $query="INSERT INTO artist (artist_id, artist_name) SELECT MAX(artist_id)+1, '$artist_name' FROM artist";
    if (! @ mysqli_query($connection, $query))
        die("Couldn't add artist");

    // Silently send the browser to the receipt page
    header("Location: receipt.php?Status=OK&artist_name=$artist_name");
}
else
{
    print "No artist name was provided";
}
?>
