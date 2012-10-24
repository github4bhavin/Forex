#!/usr/bin/perl

use Test::More;
use Data::Dumper;
use lib './';
use_ok('LWP::UserAgent');
use_ok('Forex');

my $oxr = new_ok( 'Forex' );

can_ok( $oxr, 'get_rate_of');

ok ($oxr->get_rate_of('INR'), "optional date ");
ok ($oxr->get_rate_of('INR','2010-01-01'), "INR rate without prefill for 2010-01-01");

done_testing();