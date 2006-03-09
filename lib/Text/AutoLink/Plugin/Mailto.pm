# $Id: Mailto.pm 1 2006-03-09 02:26:29Z daisuke $
#
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::Mailto;
use strict;
use base qw(Text::AutoLink::Plugin);

sub process
{
    my $self = shift;
    my $ref  = shift;

    $$ref =~ s/(mailto:[^@]+\@[^\.\s]+(?:\.[^\.\s]+)+)/
        $self->linkfy(target => undef, href => $1)
    /gex;
}

1;

=head1 NAME

Text::AutoLink::Plugin::Mailto - AutoLink mailto:

=cut