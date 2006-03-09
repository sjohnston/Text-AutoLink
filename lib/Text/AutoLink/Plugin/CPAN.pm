# $Id: CPAN.pm 2 2006-03-09 08:49:21Z daisuke $
#
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin::CPAN;
use strict;
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
  