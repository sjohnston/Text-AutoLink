package Text::AutoLink::Plugin::TwitPicThumb;
use strict;
use warnings;
use base qw(Text::AutoLink::Plugin::HTTP);

use LWP::UserAgent ();
my $ua = LWP::UserAgent->new;

sub linkfy
{
    my $self = shift;
    my %args = @_;

    my $url = $self->unshorten($args{href});
    my ($id) = $url =~ /https?:\/\/twitpic.com\/([a-z0-9]+)/;
    if ($id) {
        $self->SUPER::linkfy(href => "http://twitpic.com/$id", img => "http://twitpic.com/show/thumb/$id");
    }
    else {
        $self->SUPER::linkfy(href => $1)
    }
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

Text::AutoLink::Plugin::TwitPicThumb - AutoLink TwitPic image thumbnails

=cut
