use strict;
use Test::More tests => 3;

BEGIN { use_ok("Text::AutoLink") }

my $auto = Text::AutoLink->new(plugins => ['Text::AutoLink::Plugin::TwitPicThumb']);
my $text = $auto->parse_string(<<EOS);
    http://twitpic.com/1e10q
EOS

like($text, qr{<a href="http://twitpic.com/1e10q"><img src="http://twitpic.com/show/thumb/1e10q"});

my $ret = $auto->parse_string(<<'EOS');
    http://search.cpan.org/~dmaki/
EOS
is($ret, q{<a href="http://search.cpan.org/~dmaki/">http://search.cpan.org/~dmaki/</a>});
