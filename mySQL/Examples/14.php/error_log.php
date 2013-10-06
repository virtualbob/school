<?php

showerrorA();
showerrorB();

function showerrorA()
{
// Display a message to the user
echo "<h3>Failure</h3>
 Unfortunately we're having technical difficulties; this has been logged.
 Please try again later.";

$sMessage= date("Y.m.d_H:i:s").": blah\n";

// Log the error number and description to the file /tmp/php_errors.log
error_log(
 $sMessage,
 3,
 "/tmp/php_errors.log");
//exit;
}  

function showerrorB()
{
 // Display a message to the user
 echo "<h3>Failure</h3>
  Unfortunately we're having technical difficulties; this has been logged.
  Please try again later.";
$sMessage= date("Y.m.d_H:i:s").": blah\n";
 // Log the error number and description to the file /tmp/php_errors.log
 error_log(
 $sMessage,
  1,
  "saied@cs.rmit.edu.au");
 exit;
}  
?>
