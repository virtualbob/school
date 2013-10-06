#!/usr/bin/perl
use strict;
use CGI;
my $cgi = new CGI;

my $Title="My first Perl CGI script";
print $cgi->header(-type=>"text/html", -charset=>"UTF-8");
print $cgi->start_html();
#print $cgi->start_html(-head=>meta({-http_equiv=>'Content-Type', -content=>'text/html'}));
print $cgi->h1("Important");
print $cgi->p("Here's some text");
print $cgi->end_html();
