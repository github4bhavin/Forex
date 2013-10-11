# NAME

Forex - Historic Foreign Exchange Rates from Open Exchange Rates 

# VERSION

1.3

# SYNOPSIS

    use Forex;
    

    my $forex = new Forex( 'APP_ID' => $app_id, 'BASE' => 'USD');
    

    #__fetch and initialize daily rates from $from_date to $to_date in yyyy-mm-dd 
    $forex->get_rates_from ( $from_date, $to_date );

    #___ fetches rates for $date (yyyy-mm-dd)
    $forex->get_rates( $date );
	 

    #___ fetches reates for today 
    $forex->get_rates();
	

    #___ gives AUD on 2012-09-01 in USD Base currency
    $usd = $forex->get_rate_of ( 'AUD', '2012-09-01' );  
    

    if ($Forex::LASTERROR )
       { print "\n Something went wrong" , $oxr->last_error_message(); }  

# DESCRIPTION

# METHODS

## Constructors

### new Forex()

returns new Forex object with defaults values for 

- OXR\_HOME = 'http://openexchangerates.org',
- API\_HOOK = 'api',
- APP\_ID   = 'temp-e091fc14b3884a516d6cc2c299a',
- BASE     = 'USD'

    my $oxe = new Forex( OXR_HOME => 'https://openexchangerates.org',
                         API_HOOK => 'api',
                         APP_ID   => 'temp-e091fc14b3884a516d6cc2c299a',
                         BASE     => 'AUD');

### get\_rate\_of( $currency, <$date> )

This method returns forex rate for `$currency` on $date in BASE currency, $date should be in `yyyy-mm-dd` format.

my $AUD = $oxr->get\_rate\_of( 'AUD' , '2012-09-10' );

### get\_rates\_from ( $from\_date , $to\_date ) 

downloads and fills CURRENCIES hash for $from\_date to $to\_date
both dates should be in `yyyy-mm-dd` formate

### get\_rates ( <$day> ) 

downloads and fills in values for all currencies in the CURRENCIES hash for given `$day`
$day should be in `yyyy-mm-dd` formate if $day is skipped , it uses `todays date`,

### get\_currency\_symbols()

this method downloads and initializes all currency symbols from openexchangerates site.
this method should be run before either `get_rates` or `get_rates_from`

### base\_currency( <$BASE\_CURRENCY> )

sets BASE currency so that succeeding request will request the rates with base currency as specified by $BASE\_CURRENCY.
if the parameter is omitted it return the current BASE\_CURRENCY value;

Note: you will have to flush the $CURRENCIES hash if you change the BASE currency. with `flush_values()`

### oxr\_home ( <$OXR\_HOME> )

sets OXR\_HOME parameter to $OXR\_HOME value , if the parameter is omitted it returns the current value of the OXR\_HOME.
OXR\_HOME value should cuntaion "http://" .

Note: you could you it to change the default "http://" to "https://" if you have enterprise APP\_ID

### app\_id ( <$APP\_ID> )

sets app\_id for all succeeding requests. return current app\_id if the parameter is omitted.

### get\_currencies()

returns all the currencies in the currencies hash

### last\_error()

returns last error object as returned by Open Exchange Rates API

### last\_error\_message ()

returns last error message 

### ERROR

on errors module sets $LASTERROR global variable which can be accessed by $Forex::LASTERROR.
And error message can be accessed via last\_error\_message() or last\_error()

### KNOWN BUGS



### SUPPORT

please submit known issues or bugs to mail4bhavin@yahoo.com

### AUTHOR

Bhavin Patel

### COPYRIGHT AND LICENSE

This Software is free to use , licensed under:

	The Artistic License 2.0 (GPL Compatible)
