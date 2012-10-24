#!/usr/bin/perl

use Pod::Markdown;

my $md = new Pod::Markdown();
open my $mod , '<', 'Forex.pm';

$md->parse_from_filehandle( $mod );

close $mod;

print $md->as_markdown;
