#!/usr/bin/perl -w

use DBI;

use CGI qw(:standard);

use warnings;
use strict;

my $connection = DBI->connect("DBI:SQLite:database=projectdatabase.db;host=localhost", "", "");

my $query = "SELECT fname, lname, home FROM apex;";

print header;

print "<table border=\"1\" width=\"800\"> \n";

print "<tr><td>First Name</td><td>Last Name</td><td>Home</td></tr>\n";

my $statement = $connection->prepare($query);

$statement->execute();

while (my @data = $statement->fetchrow_array()) {
my $fname = $data[0];
my $lname = $data[1];
my $home = $data[2];

print "<tr><td>$fname</td><td>$lname</td><td>$home</td></tr>\n";

}

print "</mytable>\n";

exit;
