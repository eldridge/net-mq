#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Net::MQ' ) || print "Bail out!
";
}

diag( "Testing Net::MQ $Net::MQ::VERSION, Perl $], $^X" );
