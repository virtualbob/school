<?php
phpinfo();
	//	ini_set(session.gc_probability, 1);
	//	ini_set(session.gc_divisor    , 100);
	//	ini_set(session.gc_maxlifetime, 1440);

	//                    system("/usr/games/fortune");

	//system("/bin/echo ".$_GET['text']);

	//$query=escapeshellcmd($_GET['query']);
	$query=mysql_real_escape_string($_GET['query']);
	echo "\n<br />";
	echo ($_GET['query']);
	echo "\n<br />";
	echo $query;
	echo "\n<br />";
	echo "\n<br />";

	echo("/bin/echo $query | /usr/bin/bc");
	echo "\n<br />";
	system("/bin/echo $query | /usr/bin/bc");
?>
