package Text::AutoLink::Plugin::Unshorten;
use strict;
use warnings;
use base qw(Text::AutoLink::Plugin);

use LWP::UserAgent ();
my $ua = LWP::UserAgent->new;

sub process
{
    my $self = shift;
    my $ref  = shift;

    $$ref =~ s/https?:\/\/t\.co\/([a-z0-9]+)/
        $self->unshorten($$ref)
    /gex;
}

sub unshorten
{
    my $self = shift;
    my $url  = shift;

    my $request = HTTP::Request->new(HEAD => $url);
    my $response = $ua->request($request);

    if ($response->redirects) {
        return $response->request->uri;
    }

    return $url;
}

1;

=head1 NAME

Text::AutoLink::Plugin::Unshorten - Follow redirects to unshorten

=cut
