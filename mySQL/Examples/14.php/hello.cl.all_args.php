#!/usr/bin/php
<?php
if($argc==1)
	echo "Syntax: {$argv[0]} [Your Name]\n";
else
{
	echo "Hello";
	foreach($argv as $index => $argument)
		if($index!=0)
			echo " $argument";
	echo "!\n";
}
?>
