#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Task::BeLike::ZWON' ) || print "Bail out!
";
}

diag( "Testing Task::BeLike::ZWON $Task::BeLike::ZWON::VERSION, Perl $], $^X" );
