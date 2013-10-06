<html>
<body>
<?php
	$blah=array("_____________");
	if(count($_POST))
	{
		$query="SELECT * FROM USERS WHERE username='$blah[0]' AND password='{$_POST["password"]}'";
		echo($query);
	}
?>
<form action="braces.php" method="post">
	<input name="username" type="text" value="D'Souza" />
	<input name="password" type="text" value="D'Souza" />
	<input type="submit" />
</form>
</body>
</html>
