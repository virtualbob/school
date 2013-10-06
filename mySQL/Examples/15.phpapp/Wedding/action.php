<?php
	// action.php: Add or remove a gift from the user's shopping list

	// Include database parameters and related functions
	require_once("db.php");

	// Check if the user is logged in
	// (this also starts the session)
	logincheck();

	// Secure the user data
	if(count($_GET))
	{
		// Connect to the MySQL DBMS and use the wedding database - credentials are
		// in the file db.php
		if(!($connection= @ mysqli_connect(
			$DB_hostname, $DB_username, $DB_password, $DB_databasename)))
			showerror($connection);

		$gift_id = clean($_GET['gift_id'], 5);
		$action  = clean($_GET['action'] , 6);

		// Is the action something we know about?
		if($action != "add" && $action != "remove")
			// No, it's not;  perhaps someone's trying to manipulate the
			// URL query string?
			die("Unknown action: ".$action);

		// The program should reach this point only if the action is add
		// or remove, since otherwise processing stops with the die()
		// instruction.

		// What did the user want us to do?
		if ($action == "add")
		{
			// The user wants to add a new item to their shopping list.

			// Update the gifts table if we find the gift and it is not 
			// taken by any user.
			// This query avoids the need to lock the table.
			$query = "UPDATE gifts SET username = '{$_SESSION['username']}' ".
				"WHERE gift_id = {$gift_id} AND username IS NULL";

			// Run the query through the connection
			if (($result = @ mysqli_query($connection, $query))==FALSE)
				showerror($connection);

			// If we found the row and updated it, create a confirmation
			// message to show the user
			if (mysqli_affected_rows($connection) == 1)
			{
				$message = "Reserved the gift for you, {$_SESSION['username']}";
			}
			else // Couldn't reserve the gift because it wasn't free;
			{
				// Check whether it's already booked by someone other 
				// than the current user.
				$query = "SELECT * FROM gifts ".
						 "WHERE gift_id = {$gift_id} ".
						 "AND username  = '{$_SESSION['username']}'";
				// Run the query through the connection
				if (($result = @ mysqli_query($connection, $query))==FALSE)
					showerror($connection);

				// Create a message to show the user
				if (mysqli_num_rows($result))
					$message = "The gift is already reserved for you, ".
						"{$_SESSION['username']}";
				else
					$message = "Oh dear... someone just beat you to that gift!";
			}
		}
		else // The action is not add, so it must be remove
		{
			// The user wants to remove an existing item from their shopping list.

			// Try to unreserve the gift with the matching username and gift ID
			$query = "UPDATE gifts SET username = NULL WHERE gift_id = {$gift_id}".
				" AND username='{$_SESSION['username']}'";


			// Run the query through the connection
			if (($result = @ mysqli_query($connection, $query))==FALSE)
				showerror($connection);

			// Create a message to show the user
			if (mysqli_affected_rows($connection) == 1)
				$message = "Removed the gift from your shopping list, ".
					"{$_SESSION['username']}";
			else
				$message = "Couldn't unreserve the gift - perhaps you hadn't reserved it?";
		}

	}

	// Redirect the browser back to list.php
	header("Location: list.php?message=" . urlencode($message));
	exit;
?>
