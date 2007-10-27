# $Id: /mirror/perl/Text-AutoLink/trunk/lib/Text/AutoLink/Plugin/CPAN.pm 4207 2007-10-27T13:33:47.814555Z daisuke  $
#
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::CPAN;
use strict;
use warnings;
use base qw(Text::AutoLink::Plugin);
use URI;

sub process
{
    my $self = shift;
    my $ref = shift;

    $$ref =~ s{cpan://([A-Za-z0-9:_-]+)}{
        my $uri = URI->new('http://search.cpan.org/search');
        $uri->query_form(query => $1);
        $self->linkfy(href => $uri->as_string, text => $1);
    }gex;
}

1;

__END__

=head1 NAME

Text::AutoLink::Plugin::CPAN - AutoLink Perl Modules

=head1 DESCRIPTION

Using this plugin,

  cpan://Text-AutoLink

becomes 

  http://search.cpan.org/search?query=Text-AutoLink

=cut
  