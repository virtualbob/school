<?php
	$username="Sadri";

	if($username == "Ali")
	{
		print "Hi Dad!\n";
	}
	elseif($username == "Sadri")
	{
		print "Hi Mom!\n";
	}
	else
	{
		print "Hello!\n";
	}

/*
	#!/usr/bin/perl
	use strict;
	my $var1=786;

	######################################################################
	# Numerical comparison
	if($var1 < 786)
	{
		print "The value is less than 100.\n";
	}

	if($var1 >= 786)
	{
		print "The value is greater than or equal to 100.\n";
	}

	if($var1 == 786)
	{
		print "The value is equal to 100.\n";
	}

	######################################################################
	# String comparison
	my $username="Ali";

	if($username lt "N")
	{
		print "The username appears in the first half of the alphabet.\n";
	}


	if($username eq "Ali")
	{
		print "Hi Dad!\n";
	}
	else
	{
		print "Hello!\n";
	}

	if($username eq "Ali")
	{
		print "Hi Dad!\n";
	}
	elsif($username eq "Sadri")
	{
		print "Hi Mom!\n";
	}
	else
	{
		print "Hello!\n";
	}

	######################################################################
	# Combining conditions
	######################################################################
	# Boolean AND
	my $temperature=19;

	if( ($temperature > 18) && ($temperature < 35) )
	{
		print "The weather is fine.\n";
	}

	# Boolean OR
	if( ($temperature < 18) || ($temperature > 35) )
	{
		print "The weather isn't fine.\n";
	}

	# Boolean NOT (negating the condition)
	if( !($temperature < 18) )
	{
		print "The weather isn't cold.\n";
	}

	######################################################################
	# Symbolic and long form of Boolean expressions
	######################################################################
	# A combined expression...
	my $value=74;

	if( ($value > 80) || ( ($value < 75) && ! ($value == 73)) )
	{
		print "The value is greater than 80 or less than 75, but is not 73\n";
	}

	# ...and the equivalent in long form
	if( ($value > 80) or ( ($value < 75) and not ($value == 73)) )
	{
		print "The value is greater than 80 or less than 75, but is not 73\n";
	}
*/
?>
