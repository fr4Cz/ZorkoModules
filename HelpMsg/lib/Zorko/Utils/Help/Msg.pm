package Zorko::Utils::Help::Msg;
{
    use 5.010;
    use utf8;
    use strict;
    use warnings;
    our $VERSION = '0.0001';

    sub new() {
        my ($class, %params)    = @_;
        my @_REQUIRED           = qw(_USAGE _OPTS);

        unless(%params) {
            die 'Unable to create a help message without any options';
        }
    
        for my $_req (@_REQUIRED) {
            die "Missing required parameter $_req" unless $params{$_req};
        }

        return bless(\%params, $class);
    }

    sub help() {
        my $self    = shift;
        my $message = shift;
    
        my $usage   = $self->{'_USAGE'};
        my $opts    = $self->{'_OPTS'};
        my $msg_pat = '%-' . _fix_layout($opts) . 's%s';

        # Print help message
        say $message if $message;
        say sprintf('Usage: %s', $usage);
        for my $key (keys %{$opts}) {
            say sprintf($msg_pat, $key, $opts->{$key});
        }

        return;
    }

    sub _fix_layout() {
        my $params  = shift;
        my $length  = 0;
    
        for my $param (keys %{$params}) {
            $length = length($param) + 10 if length($param) > $length;
        }

        return $length;
    }
}
1;
__END__

=head1 NAME

Zorko::Utils::Help::Msg - Creates a simple help message for use in CLI scripts


=head1 VERSION

This document describes version 0.0001


=head1 SYNOPSIS

    use Zorko::Utils::Help::Msg;

    my %param = ('_USAGE' => "$0 -a", '_OPTS' => {<OPTION> => <DESC>, ...});
    my $msg = Zorko::Utils::Help::Msg->new(%param);

    $msg->help('Custom message');


=head1 DESCRIPTION

This module creates a simple nicely presented help message for use in CLI scripts.


=head1 CONFIGURATION AND ENVIRONMENT

Zorko::Utils::Help::Msg require no configuration files or environment variables.


=head1 DEPENDENCIES

The module requires Perl 5.010 or later.


=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<contact@zorko.co>


=head1 AUTHOR

Zorko C<< <CONTACT@ZORKO.CO> >>


=head1 LICENSE 

GPL(v2)

=head1 DISCLAIMER OF WARRANTY

A small module to create a simple help message in CLI scripts/programs written in Perl
Copyright (C) 2015 Zorko

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
