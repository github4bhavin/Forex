#!/usr/bin/perl

use Test::More;

use_ok('LWP::UserAgent');
use_ok('Forex');


my @args = ( APP_ID => undef );
my $oxr = new_ok( 'Forex' , \@args );


ok( $oxr->base_currency eq 'USD' , 'Base currency as USD');
ok( $oxr->base_currency('INR') eq 'INR' , 'Able to change base currency to INR');
ok( $oxr->app_id(123) == 123 , 'Able to changet APP ID to 123');
ok( $oxr->oxr_home('xe.com') eq 'xe.com' , 'Able to change open exchange rate home to xe.com');

 @args = ( APP_ID => undef );
 $oxr = new_ok( 'Forex' , \@args );

if ( $oxr->app_id =~ /temp/ ) {
	subtest 'Temp APP ID test' => sub {
		ok( $oxr->{APP_ID} =~ m/temp/ , 'Using temp APP ID');
		done_testing();
	};
}
else {
	diag "Not using temp APP ID "
}

$oxr->get_currency_symbols();

ok($oxr->get_rates(), "get rates for today works");
ok($oxr->get_rates( '2012-10-17' ) , "get_rates works" );

ok( $oxr->get_rates_from ( '2012-10-01', '2012-10-19') , "successfully download from 2012-10-01 to 2012-10-19" );

diag "checking for functions ";

can_ok( $oxr , 'new' );
can_ok( $oxr , 'get_rate_of' );
can_ok( $oxr , '_fetch_data' );

done_testing();
