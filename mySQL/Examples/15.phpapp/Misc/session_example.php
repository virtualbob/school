<?php
	// Initialise the session
	session_start();

	// If there is no "count" session variable, create one, and welcome
	// the user.
	if (!isset($_SESSION["count"]))
	{       
		$_SESSION["count"] = 0;
		echo "Welcome new user!";
	}       
	// Otherwise, increment the number of visits and display a message.
	else    
	{
		$_SESSION["count"]++;
		echo "Hello! You've visited this page {$_SESSION["count"]} times before.";  
	}
?>
