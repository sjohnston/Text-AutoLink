#!perl
use strict;
use Test::More tests => 3;

BEGIN { use_ok("Text::AutoLink") }

my $original = <<EOS;
<html><body><a href="http://search.cpan.org">http://search.cpan.org</a></body></html>
EOS
my $auto = Text::AutoLink->new;
my $text = $auto->parse_string($original);

is($original, $text);

$original = <<EOS;
<html><body>http://search.cpan.org</a></body></html>
EOS

$text = $auto->parse_string($original);
is($text, <<EOS);
<html><body><a href="http://search.cpan.org">http://search.cpan.org</a></body></html>
EOS


