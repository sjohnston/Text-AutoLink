# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::TwitPicThumb;
use strict;
use warnings;
use base qw(Text::AutoLink::Plugin);

sub process
{
    my $self = shift;
    my $ref  = shift;

    $$ref =~ s/https?:\/\/twitpic.com\/([a-z0-9]+)/
        $self->twitpic($1)
    /gex;
}

sub twitpic
{
    my $self = shift;
    my $id   = shift;

    $self->linkfy(href => "http://twitpic.com/$id", img => "http://twitpic.com/show/thumb/$id");
}

1;

=head1 NAME

Text::AutoLink::Plugin::TwitPicThumb - AutoLink TwitPic image thumbnails

=cut
