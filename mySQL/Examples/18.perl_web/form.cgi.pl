#!/usr/bin/perl
use strict;
use CGI ':all';

print
    header(-type=>"text/html", -charset=>'UTF-8').
    start_html(-title=>"Search Page", -encoding => 'UTF-8');

if(param())
{
    print "<br />The string you entered was: '".param('query')."'";
    print "<br />Dumping all the submitted data...";
    foreach my $Name (param())
    {
        print "<br /><b>$Name:</b> ".param($Name);
    }
}
else
{
    #start_form can take -action, -method...
    print
        start_form.
        "Query String: ".
        textfield(-name=>'query', -value=>'type your query here').
        submit(-name=>'submit_button', -value=>'Submit query').
        end_form;
}
print end_html;
