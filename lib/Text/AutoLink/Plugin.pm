# $Id: Plugin.pm 1 2006-03-09 02:26:29Z daisuke $
#
# Copyright (c) 2006 Daisuke Maki <dmaki@cpan.org>
# All rights reserved.

package Text::AutoLink::Plugin;
use strict;

sub new
{
    my $class = shift;
    my %args  = @_;
    my $self = bless {
        target => $args{target} || '',
    }, $class;
    return $self;
}

sub process { die }

sub linkfy
{
    my $self = shift;
    my %args = @_;

    my $target = exists $args{target} ? ($args{target} || '') : $self->{target};
    if ($target) {
        $target = qq| target="$target"|;
    }
    return sprintf('<a href="%s"%s>%s</a>',
        $args{href}, $target, $args{text} || $args{href});
}

1;

__END__

=head1 NAME

Text::AutoLink::Plugin - Base Class For Text::AutoLink Plugin

=head1 SYNOPSIS

  package MyPlugin;
  use strict;
  use base qw(Text::AutoLink::Plugin);
  sub process { ... }

=head1 DESCRIPTION

Base class for Text::AutoLink Plugin.

=head1 METHODS

=head2 new ARGS

Creates a new plugin instance.

=over 4

=item target SCALAR

You can specify the "target" attribute of the resulting link here

=back

=head2 process SCALARREF

This method must be overridden in the subclass. It receives a scalar ref,
which is the text that you should be modifying.

=head2 linkfy ARGS

=over 4

=item href

The link text.

=item target

The target text. Overrides the value provided to new()

=item text

The linked text. The value of 'href' is used if not specified.

=back

=cut