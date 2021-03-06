#!/usr/bin/env perl

use strict;
use warnings;
use lib './';
require('Hobbit.pm');

my $hobbit = Hobbit->new();

my $reqres = shift;
if ($reqres eq 'request') {
    my $request = do { local $/; <STDIN> };
    print $hobbit->marshal_request($hobbit->parse_request($request))
} elsif ($reqres eq 'response') {
    my $response = do { local $/; <STDIN> };
    print $hobbit->marshal_response($hobbit->parse_response($response))
} else {
    print "invalid request response given\n";
}
