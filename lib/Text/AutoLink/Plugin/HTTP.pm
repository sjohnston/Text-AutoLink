# $Id: HTTP.pm 1 2006-03-09 02:26:29Z daisuke $
# 
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::HTTP;
use strict;
use base qw(Text::AutoLink::Plugin);

sub process
{
    my $self = shift;
    my $ref  = shift;

    $$ref =~ s/(https?:\/\/[A-Za-z0-9~\/._\?\&=\-%#\+:\;,\@\']+)/
        $self->linkfy(href => $1)
    /gex;
}

1;

=head1 NAME

Text::AutoLink::Plugin::HTTP - AutoLink HTTP

=cut