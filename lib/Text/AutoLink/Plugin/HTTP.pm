# $Id: /mirror/perl/Text-AutoLink/trunk/lib/Text/AutoLink/Plugin/HTTP.pm 4207 2007-10-27T13:33:47.814555Z daisuke  $
# 
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::HTTP;
use strict;
use warnings;
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