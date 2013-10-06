<pre>
<?php
	function print_query($s)
	{
		global $connection;
		echo "\n=================================\n$s";

		$query="SELECT * FROM users WHERE username='$s' AND password='$s'";
		echo "\n$query";

		$t=mysql_real_escape_string($s);
		$t=mysqli_real_escape_string($connection, $s);
		$query="SELECT * FROM users WHERE username='$t' AND password='$t'";
		echo "\n$query";

		$t=clean($s,50);
		$query="SELECT * FROM users WHERE username='$t' AND password='$t'";
		echo "\n$query";

		echo "\n=================================";
	}

	// Include database parameters and related functions
	require_once("../db.php");
	// Connect to the MySQL DBMS and use the wedding database - credentials are in the file db.php
	if(!($connection= @ mysqli_connect($DB_hostname, $DB_username, $DB_password, $DB_databasename)))
		showerror($connection);

	echo "\n-----------------------";
	$s="' OR '' = '";
	print_query($s);

	echo "\n-----------------------";
	$s="testusername'; delete from users;";
	print_query($s);

	echo "\n-----------------------";
	$s="D'Arcy";
	print_query($s);

	echo "\n-----------------------";
	$s="' OR '' = '";
	print_query($s);

	echo "\n-----------------------";
	$s='testusername"; delete from users where \'\';';
	print_query($s);



echo "\n----------------------------------------------------------------\n";

	$s="' OR '' = '";
	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellcmd($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellarg($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=addslashes($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=addslashes(escapeshellcmd($s));
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";


	echo "\n-----------------------";
	$s='testusername"; delete from users where \'\';';

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellcmd($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";



	$t=addslashes($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellcmd(addslashes($s));
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";


	echo "\n-----------------------";
	$s="testusername'; delete from users;";

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellcmd($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";


	$t=addslashes($s);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$t=escapeshellcmd(addslashes($s));
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";


	echo "\n-----------------------";
	$s="D'Arcy";


	$t=(addslashes($s));
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	echo "\n--------------------------------------------------------------------------------------------";

	$s="' OR '' = '";

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";


	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	echo "\n-----------------------";
	$s='testusername"; delete from users where \'\';';

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	echo "\n-----------------------";
	$s="testusername'; delete from users;";

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	echo "\n-----------------------";
	$s="D'Arcy";

	$t=$s;
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

	$trans=array("'"=>"\'", ";"=>"\;", '"'=>'\"');
	$t=strtr($s, $trans);
    $query="SELECT * FROM users WHERE username='$t' AND password='$t'";
	echo "\n$query";

?>
</pre>
