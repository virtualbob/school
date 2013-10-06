#!/usr/bin/perl
if ($ENV{'QUERY_STRING'}.length?
{
}
else
{
    print <<EOF
    <html>
	<head>
	    <title>
	    </title>
	</head>
	<body>
	An HTML form
	<form method="post" action="form.pl">
	Query: <input type="text" name="query" />
	<input type="submit" value="submit query" />
	</form>
	</body>
    </html>
    EOF
}
