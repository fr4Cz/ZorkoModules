#!/usr/bin/perl
use 5.010;
use strict;
use warnings;

use Zorko::Utils::Help::Msg;

my %params  = ( '_USAGE'    => "$0 -h",
                '_OPTS'     => {'h'     => 'Display this help message',
                                'help'  => 'Display this help message'},
            );

my $msg     = Zorko::Utils::Help::Msg->new(%params);

$msg->help('This is an example using a custom help message! Custom message is not necessary.');
